import 'package:flutter/material.dart';
import 'authentication_service.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatelessWidget {
  final TextEditingController emailcontroller=TextEditingController();
  final TextEditingController passwordcontroller=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: emailcontroller,
              decoration: InputDecoration(
                labelText: "Email ID"
              ),
            ),
            TextField(
              controller: passwordcontroller,
              decoration: InputDecoration(
                  labelText: "password"
              ),
            ),
            TextButton(
                onPressed:(){
                  context.read<AuthenticationService>().signIn(
                    email:emailcontroller.text.trim(),
                    password:passwordcontroller.text.trim(),
                  );
                }, child: Text("Sign In"))

          ],
        )
      ),
    );
  }
}
