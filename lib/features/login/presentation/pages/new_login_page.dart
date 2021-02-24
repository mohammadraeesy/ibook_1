import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_clean_auth/features/forgot_password/presentation/pages/first_forgot_password.dart';
import 'package:flutter_app_clean_auth/features/login/presentation/bloc/login_bloc.dart';
import 'package:flutter_app_clean_auth/features/register/presentation/pages/new_register_page.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection_container.dart';

class MyLoginPage extends StatelessWidget {
  var textControllerUsername = TextEditingController();
  var textControllerPassword = TextEditingController();
  var bloc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: BlocProvider<LoginBloc>(
          create: (context) => bloc = sl<LoginBloc>(),
          child: Container(
            height: double.infinity,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: 30,
                  ),
                  child: SizedBox(
                    child: Image(
                      image: AssetImage('asserts/images/Group-5.png'),
                      fit: BoxFit.cover,
                    ),
                    height: MediaQuery.of(context).size.height / 10,
                    width: MediaQuery.of(context).size.width / 4,
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(top: 0),
                    child: Text('Login',
                        style:
                            TextStyle(fontFamily: 'Rajdhani', fontSize: 26))),
                Padding(
                    padding: EdgeInsets.only(top: 0, right: 30, left: 30),
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
                            suffixIcon: Icon(Icons.account_circle)),
                      ),
                    )),
                Padding(
                    padding: EdgeInsets.only(top: 0, right: 30, left: 30),
                    child: Material(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: TextField(
                        controller: textControllerPassword,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                            hintText: "password",
                            hintStyle: TextStyle(fontFamily: 'Rajdhani'),
                            suffixIcon: Icon(Icons.vpn_key_outlined)),
                      ),
                    )),
                BlocBuilder<LoginBloc, LoginState>(
                    //                  cubit: bloc,
                    builder: (context, state) {
                  if (state is Empty) {
                    return _loginBottom(context);
                  } else if (state is Loading) {
                    return Text(
                      'Loading',
                      style: TextStyle(fontFamily: 'Rajdhani', fontSize: 15),
                    );
                    print("State is Loading");
                  } else if (state is Loaded) {
                    return Text('succefuly Login',
                        style: TextStyle(fontFamily: 'Rajdhani', fontSize: 15));
                  } else if (state is Error) {
                    return Column(
                      children: [
                        Text(state.message,
                            style: TextStyle(
                                fontFamily: 'Rajdhani',
                                fontSize: 15,
                                color: Colors.red)),
                        _loginBottom(context),
                      ],
                    );
                  }

                  return _loginBottom(context);
                }),
                Padding(
                  padding: EdgeInsets.only(top: 0),
                  child: Text(
                    'or',
                    style: TextStyle(fontFamily: 'Rajdhani', fontSize: 15),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 25,
                      left: MediaQuery.of(context).size.width / 10,
                      right: MediaQuery.of(context).size.width / 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image(image: AssetImage('asserts/images/twitter.png')),
                      Image(
                          image: AssetImage('asserts/images/google-plus.png')),
                      Image(image: AssetImage('asserts/images/facebook.png'))
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'New User ?',
                        style: TextStyle(fontFamily: 'Rajdhani', fontSize: 15),
                      ),
                      FlatButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RegisterPage()));
                        },
                        child: Text(
                          'SIGN UP',
                          style: TextStyle(
                              fontFamily: 'Rajdhani',
                              fontSize: 15,
                              color: Color(0xff50A8FE)),
                        ),
                      ),
                      FlatButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context)=>ForgotPasswordPage()
                          ));
                        },
                        child: Text(
                          'forgot password',
                          style: TextStyle(
                              fontFamily: 'Rajdhani',
                              fontSize: 15,
                              color: Color(0xff50A8FE)),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 15),
                  child: Container(
                    width: MediaQuery.of(context).size.width / 3.5,
                    height: 2,
                    color: Color(0xffBBBBBB),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 15),
                  child: Text(
                    'Having Trouble with your account?',
                    style: TextStyle(fontFamily: 'Rajdhani', fontSize: 15),
                  ),
                )
              ],
            ),
          ),
        ));
  }

  Widget _loginBottom(BuildContext context) {
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
              context.bloc<LoginBloc>().add(clickButtonPress(
                  username: textControllerUsername.text,
                  password: textControllerPassword.text));
            },
            child: Text(
              'Login',
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
