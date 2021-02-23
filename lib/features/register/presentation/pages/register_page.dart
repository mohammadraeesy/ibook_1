import 'package:flutter/material.dart';
import 'package:flutter_app_clean_auth/features/login/presentation/pages/login_page.dart';
import 'package:flutter_app_clean_auth/features/register/presentation/bloc/register_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection_container.dart';

class RegisterPage extends StatelessWidget {
  var textControllerUsername = TextEditingController();
  var textControllerPassword = TextEditingController();
  var textControllerFirstname = TextEditingController();
  var textControllerLastname = TextEditingController();
  var textControllerEmail = TextEditingController();
  var textControllerPhoneNumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('register page'),
        ),
        body: BlocProvider<RegisterBloc>(
          create: (_) => sl<RegisterBloc>(),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 5, left: 5, top: 10),
                  child: TextField(
                    controller: textControllerUsername,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12)),
                        hintText: "user name",
                        suffixIcon: Icon(Icons.email)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 5, left: 5, top: 10),
                  child: TextField(
                    controller: textControllerPassword,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12)),
                        hintText: "password",
                        suffixIcon: Icon(Icons.vpn_key)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 5, left: 5, top: 10),
                  child: TextField(
                    controller: textControllerEmail,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12)),
                        hintText: "email",
                        suffixIcon: Icon(Icons.email)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 5, left: 5, top: 10),
                  child: TextField(
                    controller: textControllerFirstname,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12)),
                        hintText: "first name",
                        suffixIcon: Icon(Icons.account_circle_outlined)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 5, left: 5, top: 10),
                  child: TextField(
                    controller: textControllerLastname,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12)),
                        hintText: "last name",
                        suffixIcon: Icon(Icons.account_circle_outlined)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 5, left: 5, top: 10),
                  child: TextField(
                    controller: textControllerPhoneNumber,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12)),
                        hintText: "phone number",
                        suffixIcon: Icon(Icons.phone_enabled)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5, right: 2.5, left: 2.5),
                  child: BlocConsumer<RegisterBloc, RegisterState>(
                    listener: (context, state) {
                      if (state is Loaded) {
                        return Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyLoginPage()));
                      }
                    },
                    builder: (context, state) {
                      return SizedBox(
                        width: MediaQuery.of(context).size.width / 3,
                        child: FlatButton(
                          onPressed: () {
                            context.bloc<RegisterBloc>().add(clickButtomPress(
                                phonenumber: textControllerPhoneNumber.text,
                                firstname: textControllerFirstname.text,
                                email: textControllerEmail.text,
                                lastname: textControllerLastname.text,
                                username: textControllerUsername.text,
                                password: textControllerPassword.text));
                          },
                          child: Text('save'),
                          color: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
