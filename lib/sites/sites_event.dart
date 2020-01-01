import 'package:fsone/models/site.dart';
import 'package:meta/meta.dart';

@immutable
abstract class SitesEvent {
  const SitesEvent();

}


class FetchSitesEvent extends SitesEvent {}

class SitesLoadedEvent extends SitesEvent {

  final List<Site> sites;

  const SitesLoadedEvent(this.sites);

  List<Object> get props => [sites];

  //@override
  //String toString() => 'SitesLoadedEvent { sites: $sites }';
}



class ClearSitesEvent extends SitesEvent {}