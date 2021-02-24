import 'package:flutter/material.dart';
import 'package:flutter_app_clean_auth/features/forgot_password/presentation/bloc/forgot_password_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection_container.dart';

class SecondScreenForgotPassword extends StatelessWidget {
  final String username;

  SecondScreenForgotPassword({@required this.username});

  var textControllerVerifyCode = TextEditingController();
  var textControllerPassword1 = TextEditingController();
  var textControllerPassword2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocProvider<ForgotPasswordBloc>(
          create: (_) => sl<ForgotPasswordBloc>(),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width / 1.1,
                    height: MediaQuery
                        .of(context)
                        .size
                        .height / 3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                            padding: EdgeInsets.only(top: 0),
                            child: Material(
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              child: TextField(
                                controller: textControllerVerifyCode,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                            20)),
                                    hintText: "verify code",
                                    hintStyle: TextStyle(
                                        fontFamily: 'Rajdhani'),
                                    suffixIcon: Icon(Icons.vpn_key_outlined)),
                              ),
                            )),
                        Padding(
                            padding: EdgeInsets.only(top: 0),
                            child: Material(
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              child: TextField(
                                controller: textControllerPassword1,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                            20)),
                                    hintText: "password",
                                    hintStyle: TextStyle(
                                        fontFamily: 'Rajdhani'),
                                    suffixIcon: Icon(Icons.vpn_key_outlined)),
                              ),
                            )),
                        Padding(
                            padding: EdgeInsets.only(top: 0),
                            child: Material(
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              child: TextField(
                                controller: textControllerPassword2,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                            20)),
                                    hintText: "password",
                                    hintStyle: TextStyle(
                                        fontFamily: 'Rajdhani'),
                                    suffixIcon: Icon(Icons.vpn_key_outlined)),
                              ),
                            )),
                      ],
                    )),
                BlocBuilder<ForgotPasswordBloc, ForgotPasswordState>(
                    builder: (context, state) {
                      if (state is Empity) {
                        return bottomForgotPassword(context: context,
                            textEditingControllerPassword1: textControllerPassword1,
                            textEditingControllerPassword: textControllerPassword2,
                            textEditingControllerVerifyCode: textControllerVerifyCode);
                      } else if (state is LoadingForgotPasswordState) {
                        return Text('Loading',
                            style: TextStyle(
                                fontFamily: 'Rajdhani', fontSize: 15));
                      } else if (state is LoadedForgotPasswordState) {
                        return Text(state.massage,
                            style: TextStyle(
                                fontFamily: 'Rajdhani', fontSize: 15));
                      } else if (state is ErrorForgotPasswordState) {
                        return Text(state.massage,
                            style: TextStyle(
                                fontFamily: 'Rajdhani', fontSize: 15));
                      } else
                        return bottomForgotPassword(context: context,
                            textEditingControllerPassword1: textControllerPassword1,
                            textEditingControllerPassword: textControllerPassword2,
                            textEditingControllerVerifyCode: textControllerVerifyCode);
                    })
              ],
            ),
          ),
        )
    );
  }

  Widget bottomForgotPassword({
    @required BuildContext context, @required TextEditingController textEditingControllerPassword1, @required TextEditingController textEditingControllerPassword, @required TextEditingController textEditingControllerVerifyCode}) {
    return Padding(
      padding: EdgeInsets.only(top: 0),
      child: Material(
        elevation: 25,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Container(
          width: MediaQuery
              .of(context)
              .size
              .width / 1.1,
          height: MediaQuery
              .of(context)
              .size
              .height / 15,
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
                  .add(SubmitEvent(password1: textControllerPassword1.text,
                  verifyCode: textControllerVerifyCode.text,
                  username: username,
                  password2: textControllerPassword2.text));
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
