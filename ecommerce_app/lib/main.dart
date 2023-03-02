import 'dart:async';

import 'package:ecommerce_app/src/app.dart';
import 'package:flutter/material.dart';
//import 'package:go_router/go_router.dart';
import 'package:url_strategy/url_strategy.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // * For more info on error handling, see:
  // * https://docs.flutter.dev/testing/errors
  await runZonedGuarded(() async {
    // * Entry point of the app
    setPathUrlStrategy();
    runApp(const MyApp());

    // * This code will present some error UI if any uncaught exception happens
    FlutterError.onError = (FlutterErrorDetails details) {
      FlutterError.presentError(details);
    };
    ErrorWidget.builder = (FlutterErrorDetails details) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: const Text('An error occurred'),
        ),
        body: Center(child: Text(details.toString())),
      );
    };
  }, (Object error, StackTrace stack) {
    // * Log any errors to console
    debugPrint(error.toString());
  });
}
