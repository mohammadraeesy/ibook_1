import 'package:flutter/material.dart';
import 'package:flutter_app_clean_auth/features/forgot_password/presentation/bloc/forgot_password_bloc.dart';
import 'package:flutter_app_clean_auth/features/forgot_password/presentation/pages/second_scree_forgot_password.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection_container.dart';

class ForgotPasswordPage extends StatelessWidget {
  var textControllerUsername = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.infinity,
          height: double.infinity,
          child: BlocProvider<ForgotPasswordBloc>(
            create: (_) => sl<ForgotPasswordBloc>(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                    padding: EdgeInsets.only(top: 25, right: 30, left: 30),
                    child: Material(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: TextField(
                        controller: textControllerUsername,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                            hintText: "username",
                            hintStyle: TextStyle(fontFamily: 'Rajdhani'),
                            suffixIcon: Icon(Icons.vpn_key_outlined)),
                      ),
                    )),
                BlocBuilder<ForgotPasswordBloc, ForgotPasswordState>(
                    builder: (context, state) {
                  if (state is Empity) {
                    return bottomForgotPassword(
                        context, textControllerUsername);
                  } else if (state is LoadingForgotPasswordState) {
                    return Text('Loading',
                        style: TextStyle(fontFamily: 'Rajdhani', fontSize: 15));
                  } else if (state is LoadedForgotPasswordState) {
                    return Text(state.massage,
                        style: TextStyle(fontFamily: 'Rajdhani', fontSize: 15));
                  } else if (state is ErrorForgotPasswordState) {
                    return Text(state.massage,
                        style: TextStyle(fontFamily: 'Rajdhani', fontSize: 15));
                  } else
                    return bottomForgotPassword(
                        context, textControllerUsername);
                }),
                Padding(
                  padding: EdgeInsets.only(top: 0),
                  child: Material(
                    elevation: 25,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      SecondScreenForgotPassword(
                                          username:
                                              textControllerUsername.text)));
                        },
                        child: Text(
                          'Next Page',
                          style: TextStyle(
                              fontFamily: 'Rajdhani', color: Colors.white),
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }

  Widget bottomForgotPassword(
      BuildContext context, TextEditingController textEditingController) {
    return Padding(
      padding: EdgeInsets.only(top: 0),
      child: Material(
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
              BlocProvider.of<ForgotPasswordBloc>(context)
                  .add(SendVerifyCodeEvent(email: textEditingController.text));
            },
            child: Text(
              'Send Recovery Code',
              style: TextStyle(fontFamily: 'Rajdhani', color: Colors.white),
            ),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          ),
        ),
      ),
    );
  }
}
