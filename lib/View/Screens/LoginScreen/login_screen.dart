import 'package:ecomm_app/View/Screens/LoginScreen/components/authPasswordField.dart';
import 'package:ecomm_app/View/Screens/LoginScreen/components/authTextField.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../Constants/colors.dart';

import '../../../Constants/device_size.dart';
import '../../../Controllers/progressIndicator.dart';
import '../../../Services/ApiServices.dart';
import 'components/primaryButton.dart';

class LoginScreen extends StatelessWidget {
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final controller= Provider.of<ProgressIndicatorController>(context);
    //MARK:API Call
     callLoginApi() async {
      final service = ApiServices();

      await service.apiCallLogin(
        {
          "email": emailController.text,
          "password": passwordController.text,
        },
      ).then((value){
        if(value.error != "loggedIn"){
          print(value.error!);
          final snackBar=ScaffoldMessenger.of(context);
          if(value.error=='Invalid_EmailId'){
            snackBar.showSnackBar(SnackBar(content: Text("User dosen't exists"),));
          }else if(value.error=='Invalid_Password'){
            snackBar.showSnackBar(SnackBar(content: Text("Wrong Password"),));
          }
        }else{
          print(value.token);
          Navigator.pushNamed(context, '/welcomeScreen');
          //push
        }
      });

    }
    return Scaffold(
      backgroundColor: primaryBackgroundColor,
      body: SafeArea(
        child: Form(
            key: _formKey,
            child: Stack(
              children: [
                Positioned(
                    left: 0,
                    top: 0,
                    width: 100,
                    child: Image.asset('assets/images/main_top.png')),
                Positioned(
                    bottom: 0,
                    left: 0,
                    width: 90,
                    child: Image.asset('assets/images/main_bottom.png')),
                Container(
                  alignment: Alignment.center,
                  height: displayHeight(context),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'Login',
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),
                                )
                              ]),
                          Image.asset(
                            'assets/images/login.png',
                            height: displayHeight(context) * 0.27,
                          ),
                          AuthTextField(
                            controller: emailController,
                            hintText: 'Email',
                            prefix: Icon(
                              Icons.email_outlined,
                              size: 22,
                            ),
                            validator: (value) {
                              bool emailValid = RegExp(
                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(value!);
                              if (!emailValid) {
                                return 'Enter a valid email';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          AuthPasswordField(
                              controller: passwordController,
                              label: 'Password',
                              hintText: 'Password'),
                          SizedBox(
                            height: 16,
                          ),
                          PrimaryButton(
                              text: 'Login',
                              height: 47,
                              width: displayWidth(context) * 0.94,
                              fontSize: 18,
                              callBack: () async {
                                if (_formKey.currentState!.validate()) {
                                  controller.startLoading();
                                  await callLoginApi();
                                  controller.stopLoading();
                                }
                              }),
                          SizedBox(height: 10,),
                          controller.loading==true?CircularProgressIndicator():SizedBox(),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
