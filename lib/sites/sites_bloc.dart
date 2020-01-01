import 'dart:async';
import 'package:bloc/bloc.dart';

import 'package:fsone/repositories/sites_repository.dart';
import 'package:fsone/sites/sites_event.dart';
import 'package:fsone/sites/sites_state.dart';
import 'package:meta/meta.dart';

class SitesBloc extends Bloc<SitesEvent, SitesState> {
  SitesRepository sitesRepository;
  StreamSubscription _sitesSubscription;

  @override
  SitesState get initialState => SitesLoading();

  SitesBloc({@required this.sitesRepository}) : assert(sitesRepository != null);

  @override
  void onTransition(Transition<SitesEvent, SitesState> transition) {
    print(transition);
  }

  @override
  void onError(Object error, StackTrace stacktrace) {
    print(error);
  }

  @override
  Stream<SitesState> mapEventToState(
    SitesEvent event,
  ) async* {
    if (event is FetchSitesEvent) {
      yield SitesLoading();
      _sitesSubscription?.cancel();
      sitesRepository.loadSitesStream().listen(
        (sites) {
          print("sitesloadedevents $sites");
          
          add(
            SitesLoadedEvent(sites),
          );
        },
      );

    } else if (event is SitesLoadedEvent) {
      print("SitesLoadedEvent yield siteloaded");
      yield SitesLoaded(event.sites);
    }
  }

}
