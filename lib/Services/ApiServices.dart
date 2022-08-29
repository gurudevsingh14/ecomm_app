import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiServices{

  Future <LoginApiResponse> apiCallLogin(Map<String,dynamic> param) async{

    var url = Uri.parse('https://ecommerce-calculator.herokuapp.com/api/MPC/login');
    var response = await http.post(url, body: param);

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    final data = jsonDecode(response.body);
    return LoginApiResponse(token: data["token"], error: data["message"]);
  }
}


class LoginApiResponse{
  final String? token;
  final String? error;

  LoginApiResponse({this.token,this.error});

}