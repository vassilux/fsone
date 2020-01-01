import 'dart:async';

import 'package:fsone/models/site.dart';

class SitesRepository {
  List<Site> sitesList = List<Site>();

  Stream<List<Site>> loadSitesStream()  {
    var controller = StreamController<List<Site>>();
    var interval = Duration(seconds: 5);
    int maxCount = 10;    
    int counter = 0;  
    List<Site> sites = new List<Site>();
    for (var i = 1; i <= 10; i++) {
     
      sites.add(Site("lorExcepteur mollit consectetur commodo Lorem enim.$i", 
      "Minim voluptate excepteur cupidatat non cillum quis esse dolore ex tempor ea non.$i"));
    }
    void tick(Timer timer) {
      counter++;    
      if (maxCount != null && counter >= maxCount) {
        timer.cancel();
        controller.close(); // Ask stream to shut down and tell listeners.
      }
    }
    
    controller.add(sites);
    Timer.periodic(interval, tick); 
    return controller.stream;
  }

/* fro exemple 
  Future<List<Site>> loadSites() {
    // Simulate network delay
    return Future.delayed(
      Duration(seconds: 2),
      () {
        List<Site> sites = new List<Site>();
        for (var i = 10; i >= 1; i--) {
          var site = Site("site$i", "code$i");
          sites.add(site);
        }
        return sites;
      },
    );
  } */
}
