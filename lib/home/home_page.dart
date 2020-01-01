import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fsone/authentication/bloc.dart';
import 'package:fsone/home/site_list_widget.dart';
import 'package:fsone/repositories/sites_repository.dart';
import 'package:fsone/settings/settings_page.dart';
import 'package:fsone/sites/bloc.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final SitesRepository sitesRepository = SitesRepository();

  SitesBloc sitesBloc;

  _HomePageState() {
    sitesBloc = SitesBloc(
      sitesRepository: sitesRepository,
    );
  }

  @override
  void initState() {
    sitesBloc.add(FetchSitesEvent());   
    super.initState();
  }

  Widget _createAppBar(BuildContext context) {
      return AppBar(
       // backgroundColor: Colors.blue, //Theme.of(context).buttonColor,
      //  elevation: 10.0,
        leading: Icon(Icons.menu, color: Colors.white,),
        //brightness: Brightness.dark,
        title: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text(
                "Sites",
                //style: TextStyle(fontSize: 20.0, color: Colors.white),
              )
            ],
          ),
        ),
        actions: <Widget>[
          IconButton(
            color : Colors.white,
            icon: Icon(
              Icons.refresh,
            ),
            onPressed: () {
              sitesBloc.add(
                FetchSitesEvent(),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SettingsPage(),
                ),
              );
            },
          ),
          VerticalDivider(
            width: 30,
            //color: Theme.of(context).buttonColor,
          ),
          IconButton(
            //color : Colors.white,
            icon: Icon(
              Icons.exit_to_app,
            ),
            onPressed: () {
              BlocProvider.of<AuthenticationBloc>(context).add(
                LoggedOut(),
              );
            },
          ),
        ],
      );
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _createAppBar(context),
      body: BlocBuilder(
          bloc: sitesBloc,
          builder: (BuildContext context, SitesState state) {
            if (state is SitesLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is SitesNotLoaded) {
              return Center(
                child: Text('failed to fetch posts'),
              );
            }

            if (state is SitesLoaded) {
              final sites = state.sites;             
                return ListView.builder(
                  itemCount: sites.length,
                  itemBuilder: (context, index) {
                    final content = sites[index];
                    return SiteContentItem(site: content);
                  },
                );
             
            }

            return Center(
              child: CircularProgressIndicator(),
            );
          }),
    );

  }
}
