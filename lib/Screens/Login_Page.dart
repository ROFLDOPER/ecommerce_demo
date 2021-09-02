import 'package:flutter/material.dart';

import '../Constants/Constants.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          'Login Page',
          // textDirection: TextDirection.ltr,
          style: Constants.regularHeading,
        ),
      ),
    );
  }
}
