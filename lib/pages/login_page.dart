import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fsone/blocs/login/bloc.dart';
import 'package:fsone/repositories/user_repository.dart';
import 'package:fsone/widgets/login_form.dart';

class LoginPage extends StatelessWidget {
  final UserRepository _userRepository;

  LoginPage({Key key, @required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // appBar: AppBar(title: Text('Login'), centerTitle: true),
      
      body: BlocProvider<LoginBloc>(
        create: (context) => LoginBloc(userRepository: _userRepository),
        child: LoginForm(userRepository: _userRepository),
      ),
    );
  }
}

