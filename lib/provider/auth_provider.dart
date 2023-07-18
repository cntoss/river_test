import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_test/api/impl/api_impl.dart';

// Creating state notifier provider
final authProvider = StateNotifierProvider.autoDispose<AuthProvider, String>(
    (ref) => AuthProvider());

// Creating Notifier
class AuthProvider extends StateNotifier<String> {
  AuthProvider() : super('');

  login({String? username, String? password}) async {
    try {
      final token =
          await ApiRepositoryImpl().login(username: null, password: null);
      //  .login(username: username, password: password);
      state = token ?? '';
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
