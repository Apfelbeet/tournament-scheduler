import 'package:flutter/foundation.dart';

import 'storage.dart';


class TournamentNotifier extends ChangeNotifier {

  notify() {
    notifyListeners();
  }

}

class TeamNotifier extends TournamentNotifier {
}

class ModeNotifier extends TournamentNotifier {
}

class GameNotifier extends TournamentNotifier {
}

class InfoNotifier extends TournamentNotifier {
}

class UrlNotifier extends TournamentNotifier {

}
class ServerNotifier extends TournamentNotifier {

}

class ErrorNotifier extends TournamentNotifier {}


