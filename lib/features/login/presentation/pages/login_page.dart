import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_clean_auth/features/login/presentation/bloc/login_bloc.dart';
import 'package:flutter_app_clean_auth/features/register/presentation/pages/register_page.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection_container.dart';

class MyLoginPage extends StatelessWidget {

  var textControllerEmaile = TextEditingController();
  var textControllerPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Bloc Api king",
            style: TextStyle(
              color: Colors.amberAccent,
            ),
          ),
        ),
        body: BlocProvider<LoginBloc>(
          create: (context) => sl<LoginBloc>(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
//            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 5, left: 5, top: 10),
                    child: TextField(
                      controller: textControllerEmaile,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12)),
                          hintText: "Emaile",
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
                          suffixIcon: Icon(Icons.account_circle_outlined)),
                    ),
                  ),
                ],
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.only(left: 2, right: 2),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        // width: MediaQuery.of(context).size.width,
                        // child: Container(color: Colors.yellow,width: 500,height: 500,),
                        child: BlocBuilder<LoginBloc, LoginState>(
                          builder: (context, state) {
                            if (state is Empty) {
                              return Container(
                                height: 50,
                                width: 100,
                                child: initial(context),
                              );
                            }
                            // return FlatButton(onPressed: (){}, child: Text('login'),color: Colors.yellow,);}
                            if (state is Loading) {
                              return Padding(
                                padding: EdgeInsets.only(bottom: 15),
                                child: Center(
                                  child: Text("loading..."),
                                ),
                              );
                            }
                            if (state is Loaded) {
                              return Text("login sucsesfully");
                              // navigat to main page
                            }
                            if (state is Error) {
                              return Padding(
                                padding: EdgeInsets.only(bottom: 15),
                                child: Center(
                                  child: Text(state.message),
                                ),
                              );
                            } else
                              return Container(
                                height: 50,
                                width: 180,
                                child: initial(context),
                              );
                          },
                        ),
                      ),
                      FlatButton(
                        color: Colors.blue,
                        child: Text('regestr'),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterPage()));
                        },
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }

  Widget initial(BuildContext context) {
    return FlatButton(
        child: Text('login'),
        color: Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        onPressed: () {
          context.bloc<LoginBloc>().add(clickButtonPress(
              username: textControllerEmaile.text,
              password: textControllerPassword.text));
        });
  }
}
