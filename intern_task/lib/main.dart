import 'package:flutter/material.dart';
import 'package:intern_task/components/constants.dart';
import 'package:intern_task/views/authScreen/auth_wrap.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: kWhite,
          appBarTheme: AppBarTheme(
              color: kWhite,
              elevation: 0.0,
              iconTheme: IconThemeData(color: kBlack))),
      home: AuthenticationWrapper(),
    );
  }
}
