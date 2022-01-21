import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthProvider extends ChangeNotifier {
  final String _baseUrl = 'identitytoolkit.googleapis.com';
  final String _firebaseApiKey = 'AIzaSyBVe0OMJ_Z6B5yE0mc0RI8SX8oQGWQ049g';

  final storage = const FlutterSecureStorage();

  Future<String?> createUser(String email, String password) async {
    final Map< String, dynamic > authData = {
      'email': email,
      'password': password,
      'returnSecureToken': true,
    };

    final url = Uri.https( _baseUrl , '/v1/accounts:signUp', {
      'key': _firebaseApiKey
    });

    final resp = await http.post(url, body: json.encode( authData ) );
    final Map<String, dynamic> decodedData = json.decode(resp.body);

    if( decodedData.containsKey('idToken') ) {
      await storage.write( key: 'token', value: decodedData['idToken'] );
      return null;
    }

    return decodedData['error']['message'];
  }

  Future<String?> login(String email, String password) async {
    final Map< String, dynamic > authData = {
      'email': email,
      'password': password,
      'returnSecureToken': true,
    };

    final url = Uri.https( _baseUrl , '/v1/accounts:signInWithPassword', {
      'key': _firebaseApiKey
    });

    final resp = await http.post(url, body: json.encode( authData ) );
    final Map<String, dynamic> decodedData = json.decode(resp.body);

    if( decodedData.containsKey('idToken') ) {
      await storage.write( key: 'token', value: decodedData['idToken'] );
      return null;
    }

    return decodedData['error']['message'];
  }

  Future<void> logOut() async {
    await storage.delete(key: 'token');
  }

  Future<String> readToken() async {
    return await storage.read(key: 'token') ?? '';
  }
}