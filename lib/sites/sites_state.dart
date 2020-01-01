import 'package:equatable/equatable.dart';
import 'package:fsone/models/site.dart';

import 'package:meta/meta.dart';

@immutable
abstract class SitesState extends Equatable {
   const SitesState();

  @override
  List<Object> get props => [];
}
  
class SitesLoading extends SitesState {}

class SitesLoad extends SitesState {
  SitesLoad(List<Site> sites);
}

class SitesLoaded extends SitesState {

 final List<Site> sites;

  const SitesLoaded(this.sites);

  @override
  List<Object> get props => [sites];

  @override
  String toString() => 'SitesLoaded { sites: $sites }';

}

class SitesNotLoaded extends SitesState {}
