import 'package:flutter/material.dart';
import 'package:flutter_app_clean_auth/features/activision_account/presentation/pages/activision_page.dart';
import 'package:flutter_app_clean_auth/features/register/presentation/bloc/register_bloc.dart';
import 'package:flutter_app_clean_auth/features/register/presentation/wigets/bottom.dart';
import 'package:flutter_app_clean_auth/features/register/presentation/wigets/text_field_wiget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection_container.dart';

class RegisterPage extends StatelessWidget {
  var textControllerUsename = TextEditingController();
  var textControllerPassword = TextEditingController();
  var textControllerFirstname = TextEditingController();
  var textControllerLastname = TextEditingController();
  var textControllerEmail = TextEditingController();
  var textControllerPhoneNumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final textFieldsSizes = MediaQuery.of(context).size.height / 2;
    final textFieldsSize = textFieldsSizes / 7;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: BlocProvider<RegisterBloc>(
          create: (context) => sl<RegisterBloc>(),
          child: Container(
            height: double.infinity,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: 0,
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
                    child: Text('SIGN UP',
                        style:
                            TextStyle(fontFamily: 'Rajdhani', fontSize: 26))),
                Padding(
                    padding: EdgeInsets.only(top: 0, right: 30, left: 30),
                    child: Container(
                      height: textFieldsSizes,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextFieldWidget(
                              text: 'username',
                              size: textFieldsSize,
                              textFiledIcon: Icon(Icons.account_circle),
                              textController: textControllerUsename),
                          TextFieldWidget(
                              text: 'password',
                              size: textFieldsSize,
                              textFiledIcon: Icon(Icons.vpn_key_outlined),
                              textController: textControllerPassword),
                          TextFieldWidget(
                              text: 'phone number',
                              size: textFieldsSize,
                              textFiledIcon: Icon(Icons.phone_android),
                              textController: textControllerPhoneNumber),
                          TextFieldWidget(
                              text: 'email',
                              size: textFieldsSize,
                              textFiledIcon: Icon(Icons.email),
                              textController: textControllerEmail),
                          TextFieldWidget(
                              text: 'first name',
                              size: textFieldsSize,
                              textFiledIcon: Icon(Icons.account_circle),
                              textController: textControllerFirstname),
                          TextFieldWidget(
                              text: 'last name',
                              size: textFieldsSize,
                              textFiledIcon: Icon(Icons.account_circle),
                              textController: textControllerLastname),
                        ],
                      ),
                    )),
                Padding(
                  padding: EdgeInsets.only(top: 0),
                  child: BlocBuilder<RegisterBloc, RegisterState>(
                    builder: (context, state) {
                      if (state is Empty) {
                        return regesterBottom(
                            context: context,
                            textControllerFirstName: textControllerFirstname,
                            textControllerEmail: textControllerEmail,
                            textControllerLastName: textControllerLastname,
                            textControllerPassword: textControllerPassword,
                            textControllerPhoneNumber:
                                textControllerPhoneNumber,
                            textControllerUsername: textControllerUsename);
                      } else if (state is Loading) {
                        return Text('loading...');
                      } else if (state is Loaded) {
                        return Text(state.massage);
                      } else if (state is Error) {
                        return Column(
                          children: [
                            Text(state.message),
                            regesterBottom(
                                context: context,
                                textControllerFirstName:
                                    textControllerFirstname,
                                textControllerEmail: textControllerEmail,
                                textControllerLastName: textControllerLastname,
                                textControllerPassword: textControllerPassword,
                                textControllerPhoneNumber:
                                    textControllerPhoneNumber,
                                textControllerUsername: textControllerUsename)
                          ],
                        );
                      }
                      return regesterBottom(
                          context: context,
                          textControllerFirstName: textControllerFirstname,
                          textControllerEmail: textControllerEmail,
                          textControllerLastName: textControllerLastname,
                          textControllerPassword: textControllerPassword,
                          textControllerPhoneNumber: textControllerPhoneNumber,
                          textControllerUsername: textControllerUsename);
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 0),
                  child: Text(
                    'or',
                    style: TextStyle(fontFamily: 'Rajdhani', fontSize: 15),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: 0,
                      ),
                  child: Container(
                    width:  MediaQuery.of(context).size.width/1.5,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image(image: AssetImage('asserts/images/twitter.png')),
                        Image(
                            image: AssetImage('asserts/images/google-plus.png')),
                        Image(image: AssetImage('asserts/images/facebook.png'))
                      ],
                    ),
                  )
                ),
                Padding(
                  padding: EdgeInsets.only(top: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'New User ',
                        style: TextStyle(fontFamily: 'Rajdhani', fontSize: 15),
                      ),
                      FlatButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (contex)=>ActivisionPage(username: textControllerUsename.text)));
                          },
                          child: Text(
                            'SIGN UP',
                            style: TextStyle(
                                fontFamily: 'Rajdhani',
                                fontSize: 15,
                                color: Color(0xff50A8FE)),
                          ))
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 0),
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
    ;
  }
}
