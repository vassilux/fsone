import 'package:flutter/material.dart';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fsone/pages/home_page.dart';
import 'package:fsone/pages/login_page.dart';
import 'package:fsone/pages/splash_page.dart';
import 'package:fsone/repositories/user_repository.dart';
import 'package:fsone/simple_bloc_delegate.dart';
import 'package:fsone/widgets/loading_indicator.dart';
import 'package:fsone/config/themes.dart';
import 'blocs/authentication/authentication_bloc.dart';
import 'blocs/authentication/bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  BlocSupervisor.delegate = SimpleBlocDelegate();
  final UserRepository userRepository = UserRepository();
  /*runApp(
    BlocProvider<AuthenticationBloc>(
      create: (context) => AuthenticationBloc(
        userRepository: userRepository,
      )..add(AppStarted()),
      child: App(userRepository: userRepository),
    ),
  );*/
  runApp(App(userRepository: userRepository));
}

class App extends StatelessWidget {
  final UserRepository _userRepository;
  final ThemeData _theme = Themes.light;

  App({Key key, @required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);


        
  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthenticationBloc>(
      create: (BuildContext context) => AuthenticationBloc(
        userRepository: _userRepository,
      )..add(AppStarted()),
      
      child: MaterialApp(
        theme: _theme,
        title: 'S1',
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        
        builder: (context, state) {
          BlocProvider.of<AuthenticationBloc>(context);
          if (state is AuthenticationUnauthenticated) {
            return LoginPage(userRepository: _userRepository);
          }
          if (state is AuthenticationAuthenticated) {
            return HomePage(name: "Test");
          }
          if (state is AuthenticationLoading) {
            return LoadingIndicator();
          }
          return SplashPage();
        },
      ),
        
      ), 
    );

    /*return MaterialApp(
      title: 'S1',
      theme: _theme,
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        
        builder: (context, state) {
          BlocProvider.of<AuthenticationBloc>(context);
          if (state is AuthenticationUnauthenticated) {
            return LoginPage(userRepository: _userRepository);
          }
          if (state is AuthenticationAuthenticated) {
            return HomePage(name: "Test");
          }
          if (state is AuthenticationLoading) {
            return LoadingIndicator();
          }
          return SplashPage();
        },
      ),
    );*/
  }
}
