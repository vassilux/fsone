import 'package:flutter/material.dart';


import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:fsone/blocs/authentication/bloc.dart';

class HomePage extends StatelessWidget {

  HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  
    

    return Scaffold(
      appBar: AppBar(
        //backgroundColor: Colors.blueAccent,  
        //elevation: 50.0,      
        leading: Icon(Icons.menu),
        //brightness: Brightness.dark,
        title: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            
            children: <Widget>[
              new Text(
                "Sites",
                style: TextStyle(fontSize: 20.0),
                
              ),
              new Text(
                "WTF",
                style: TextStyle(fontSize: 14.0),
              )
            ],
          ),
        ),
        actions: <Widget>[
          VerticalDivider(
            width: 30,
            //color: Theme.of(context).buttonColor,
          ),
          IconButton(
            icon: Icon(
              Icons.exit_to_app,
            ), onPressed: () {
              
              BlocProvider.of<AuthenticationBloc>(context).add(
                LoggedOut(),
              );
            },
          ),         
        ],
      ),
      body: Container(
        decoration: BoxDecoration(boxShadow: [
          //
          BoxShadow(
              color: Theme.of(context).primaryColor,
              blurRadius: 2.0,
              spreadRadius: 0.1)
        ]),
        child: Center(
            child: RaisedButton(
          child: Text('logout'),
          onPressed: () {
            BlocProvider.of<AuthenticationBloc>(context).add(
                LoggedOut(),
              );
              
          },
        )),
      ),
    );
  }

}
