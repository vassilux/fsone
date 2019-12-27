import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fsone/blocs/authentication/authentication_bloc.dart';
import 'package:fsone/blocs/login/bloc.dart';
import 'package:fsone/repositories/user_repository.dart';
import 'package:fsone/widgets/login_form.dart';

class LoginPage extends StatelessWidget {
  final UserRepository userRepository;

  LoginPage({Key key, @required this.userRepository})
      : assert(userRepository != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {     
    return Scaffold(
     // appBar: AppBar(title: Text('Login'), centerTitle: true),      
      body: BlocProvider<LoginBloc>(
        create: (context) {
          return LoginBloc(
            authenticationBloc: BlocProvider.of<AuthenticationBloc>(context),
            userRepository: userRepository,
          );
        },
        child: LoginForm(),
      ),
    );
  }
}

