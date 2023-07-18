import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_test/features/login/ui/login_page.dart';
import 'package:river_test/features/product/ui/product_page.dart';
import 'package:river_test/provider/auth_provider.dart';

class AuthChecker extends ConsumerWidget {
  const AuthChecker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isRead = ref.watch(authProvider);
    return isRead == '' ? const LoginPage() : const ProductPage();
  }
}
