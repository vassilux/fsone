import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fsone/models/site.dart';
import 'package:fsone/sites/bloc.dart';


class SiteListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //final sitesBloc = BlocProvider.of<SitesBloc>(context);

    return BlocBuilder(
      bloc: BlocProvider.of<SitesBloc>(context),
      builder: (
        BuildContext context,
        SitesState state,
      ) {
        /* if (state is SitesLoaded) {
          final sites = state.sites;
          return Expanded(
            child: ListView.builder(
              itemCount: sites.length,
              itemBuilder: (context, index) {
                final content = sites[index];
                return SiteContentItem(site: content);
              },
            ),
          );
        }*/

        // if (state is SitesLoading) {
        return Center(child: CircularProgressIndicator());
        // } else
      },
    );
  }
}

class SiteContentItem extends StatelessWidget {
  final Site site;

  SiteContentItem({
    Key key,
    this.site,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new InkWell(
      onTap: () => {
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text("Comming soon"),
        ))
      },
      child: new Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        child: doSiteCard(context),
      ),
    );
  }

  Widget doSiteCard(BuildContext context) {
    return new Container(
      color: Theme.of(context).primaryColor,
      width: 200.0,
      padding: EdgeInsets.fromLTRB(5, 5, 0, 5),
      child: new Card(
          color: Colors.pink, //.of(context).primaryColor,
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.album, size: 70),
                  title: Text(site.name, style: TextStyle(color: Colors.white)),
                  subtitle:
                      Text(site.code, style: TextStyle(color: Colors.white70)),
                ),
                new Padding(padding: new EdgeInsets.all(5.0)),
              ])),
    );
  }
}
