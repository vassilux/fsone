import 'package:flutter/material.dart';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:fsone/authentication/bloc.dart';
import 'package:fsone/repositories/user_repository.dart';
import 'package:fsone/settings/settings_bloc.dart';
import 'package:fsone/splash/splash.dart';
import 'package:fsone/login/login.dart';
import 'package:fsone/home/home.dart';
import 'package:fsone/common/common.dart';

import 'config/constants.dart';
import 'config/themes.dart';
import 'simple_bloc_delegate.dart';


void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  final userRepository = UserRepository();
  
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticationBloc>(
          create: (context){
             return AuthenticationBloc(
        userRepository: userRepository,
      )..add(AppStarted());
          },
        ),
        BlocProvider<SettingsBloc>(
          create: (context) => SettingsBloc(),
        ),
      ],
      child: App(userRepository: userRepository),
    ),
  );
}

class App extends StatelessWidget {
  final UserRepository userRepository;
  final ThemeData _theme = Themes.light;

  App({Key key, @required this.userRepository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Constants.appName,
     theme: _theme,
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is AuthenticationAuthenticated) {
            return HomePage();
          }
          if (state is AuthenticationUnauthenticated) {
            return LoginPage(userRepository: userRepository);
          }
          if (state is AuthenticationLoading) {
            return LoadingIndicator();
          }
          return SplashPage();
        },
      ),
    );
  }
}
