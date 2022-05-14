import 'dart:convert';

import 'package:blue_fc_store/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Services/API_service.dart';
import '../models/user_model.dart';




class Auth extends ChangeNotifier {
  APIService apiService = APIService();

  bool _loading = false ;
  bool get loading => _loading;

  void changeLoadingState(){
    _loading =!_loading;
    notifyListeners();
  }
    UserModel? signupResult;
   UserModel? loginResult;

  //TODO
  Future<UserModel?> signupTheUser({
    required String phoneNumber,
    required String userName,
    required String password,
    required String passwordConfirmation,
    required String email,
  }) async {
    final response = await apiService.post('register', {
      "phone_number": phoneNumber,
      "first_name": userName,
      "password": password,
      "password_confirmation": passwordConfirmation,
      "email": email,
    });
    print(response.statusCode);
    if(response.statusCode ==200){
      print(response.body);
      signupResult = UserModel.fromJson(jsonDecode(response.body));
      notifyListeners();
      return signupResult;
    }
   // return authResult;
    }

  Future<UserModel?> loginTheUser({
    required String phoneNumber,
    required String password,
  }) async {
    try{
    final response = await apiService.post('login', {
      "phone_number": phoneNumber,
      "password": password,
    },
    {
     // "content-type":'application/json; charset=UTF-8',
      "authorization":kToken,
    }
    );
    print(response.statusCode);

    if(response.statusCode ==200){
      print(response.body);
      loginResult = UserModel.fromJson(jsonDecode(response.body));
      notifyListeners();
      return loginResult;
    }}
        catch(e){print('the exception :' + e.toString());}
    // return authResult;
  }

}

