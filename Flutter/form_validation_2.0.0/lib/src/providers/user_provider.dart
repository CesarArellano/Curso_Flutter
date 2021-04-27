import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:form_validation/src/userPreferences/user_preferences.dart';

class UserProvider {
  
  final _firebaseToken = 'AIzaSyBVe0OMJ_Z6B5yE0mc0RI8SX8oQGWQ049g';
  final prefs = new UserPreferences();

  Future<Map<String, dynamic>> login(String email, String password) async {
    final urlApi = Uri.parse('https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=$_firebaseToken');
    
    final authData = {
      'email': email,
      'password': password,
      'returnSecureToken': true
    };

    final resp = await http.post(urlApi, body: json.encode(authData));
    
    Map<String, dynamic> decodedData = json.decode(resp.body);

    if (decodedData.containsKey('idToken')) {
      saveToken(decodedData['idToken']);
      return { 'ok': true, 'token': decodedData['idToken']};

    } else {
      return { 'ok': false, 'token': decodedData['error']['message']};
    }
  }

  Future<Map<String, dynamic>> newUser(String email, String password) async{
    final urlApi = Uri.parse('https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=$_firebaseToken');
    
    final authData = {
      'email': email,
      'password': password,
      'returnSecureToken': true
    };

    final resp = await http.post(urlApi, body: json.encode(authData));
    
    Map<String, dynamic> decodedData = json.decode(resp.body);
    
    if (decodedData.containsKey('idToken')) {
      saveToken(decodedData['idToken']);
      return { 'ok': true };
    } else {
      return { 'ok': false, 'token': decodedData['error']['message']};
    }
  }
  
  void saveToken(String token) {
    prefs.token = token;
  } 
}