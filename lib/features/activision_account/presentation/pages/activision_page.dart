import 'package:flutter/material.dart';
import 'package:flutter_app_clean_auth/features/activision_account/presentation/bloc/activision_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection_container.dart';

class ActivisionPage extends StatelessWidget {
  final String username;

  ActivisionPage({@required this.username});

  var textControllerVerifyCode = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            width: double.infinity,
            height: double.infinity,
            child: BlocProvider<ActivisionBloc>(
              create: (_) => sl<ActivisionBloc>(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                      padding: EdgeInsets.only(top: 0, right: 30, left: 30),
                      child: Material(
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: TextField(
                          controller: textControllerVerifyCode,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              hintText: "username",
                              hintStyle: TextStyle(fontFamily: 'Rajdhani'),
                              suffixIcon: Icon(Icons.vpn_key_outlined)),
                        ),
                      )),
                  BlocBuilder<ActivisionBloc, ActivisionState>(
                      builder: (context, state) {
                    if (state is EmpityStateActivisionAccount) {
                      return activationBottom(
                          context:context);
                    } else if (state is LoadinStateActivisionAccount) {
                      return Text('Loading',
                          style:
                              TextStyle(fontFamily: 'Rajdhani', fontSize: 15));
                    } else if (state is LoadedStateActivisionAccount) {
                      return Text(state.massage,
                          style:
                              TextStyle(fontFamily: 'Rajdhani', fontSize: 15));
                    } else if (state is ErrorStateActivisionAccount) {
                      return Text(state.massage,
                          style:
                              TextStyle(fontFamily: 'Rajdhani', fontSize: 15));
                    } else
                      return activationBottom(
                          context:context);
                  }),
                ],
              ),
            )));
  }

  Widget activationBottom({@required BuildContext context}) {
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
              BlocProvider.of<ActivisionBloc>(context).add(
                  BottomClickEventActivision(
                      username: username,
                      verifyCode: textControllerVerifyCode.text));
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
