import 'package:flutter/material.dart';
import 'package:flutter_demo/ui/auth/controller/signin_controller.dart';
import 'package:flutter_demo/ui/auth/signin_screen.dart';
import 'package:flutter_demo/utils/routes.dart';
import 'package:get/get.dart';




class RoutesGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.signInScreen:
        return GetPageRoute(
            routeName: settings.name,
            page: () =>  SignInScreen(),
            settings: settings,
            binding: BindingsBuilder(() {
              Get.lazyPut(() => SignInController());
            }));
      default:
        return GetPageRoute(
            routeName: settings.name,
            page: () => _errorRoute(),
            settings: settings);
    }
  }

  static Widget _errorRoute() {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Error'),
      ),
      body: const Center(
        child: Text('No Such screen found in route generator'),
      ),
    );
  }
}
