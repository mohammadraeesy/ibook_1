import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_clean_auth/features/register/presentation/bloc/register_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection_container.dart';

Widget regesterBottom(
    {@required BuildContext context,
    @required TextEditingController textControllerUsername,
    @required TextEditingController textControllerPassword,
    @required TextEditingController textControllerEmail,
    @required TextEditingController textControllerPhoneNumber,
    @required TextEditingController textControllerFirstName,
    @required TextEditingController textControllerLastName}) {
  return Material(
    elevation: 25,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    child: Container(
      width: MediaQuery.of(context).size.width / 1.1,
      height: MediaQuery.of(context).size.height / 15,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color(0xff4BB7FF),
                Color(0xff8300F5),
              ])),
      child: FlatButton(
        onPressed: () {
          BlocProvider.of<RegisterBloc>(context).add(clickButtomPress(
              password: textControllerPassword.text,
              username: textControllerUsername.text,
              lastname: textControllerLastName.text,
              email: textControllerEmail.text,
              firstname: textControllerFirstName.text,
              phonenumber: textControllerPhoneNumber.text));
        },
        child: Text(
          'Login',
          style: TextStyle(fontFamily: 'Rajdhani', color: Colors.white),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
    ),
  );
}
