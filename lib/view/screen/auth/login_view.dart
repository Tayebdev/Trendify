import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () {
            print('hzelll');
          },
          child: Text('test',style: TextStyle(fontSize: 30),),
        ),
      ),
    );
  }
}
