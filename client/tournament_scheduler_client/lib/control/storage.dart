import 'dart:collection';
import 'dart:convert';

import 'package:tournament_scheduler_client/control/connection.dart';
import 'package:tournament_scheduler_client/control/file.dart';
import 'package:tournament_scheduler_client/control/model.dart';
import 'package:tournament_scheduler_client/control/notifier.dart';

class Storage {
  TeamNotifier teamNotifier = TeamNotifier();
  GameNotifier gameNotifier = GameNotifier();
  ModeNotifier modeNotifier = ModeNotifier();
  InfoNotifier infoNotifier = InfoNotifier();
  UrlNotifier urlNotifier = UrlNotifier();
  ServerNotifier serverNotifier = ServerNotifier();
  ErrorNotifier errorNotifier = ErrorNotifier();

  String? errorMessage;

  List<String> _urls = [];

  SocketConnection? _connection;
  _TournamentState? _tournament;
  _ServerState? _server;

  Storage() {
    try {
      FileSystem.loadAsJsonData("urls.txt").then((jsonUrls) {
        if (jsonUrls is List<dynamic>) {
          _urls = jsonUrls.cast<String>().toList();
          urlNotifier.notify();
        }
      });
    } catch (e) {}
  }

  ///List of all urls the user has previously saved.
  ///It can be assumed that there a no duplicates with the same string value.
  List<String> getStoredUrls() => _urls;

  ///The url will be saved and can be accessed with getStoredUrls().
  ///If this url is already stored it won't be added again but the method will return false.
  ///In case the new url is stored successfully the method will return true.
  bool storeNewUrl(String url) {
    if (_urls.contains(url)) {
      return false;
    }
    _urls.add(url);
    urlNotifier.notify();
    _storeUrls();
    return true;
  }

  ///Removing the url from storage.
  removeUrl(String url) {
    _urls.remove(url);
    urlNotifier.notify();
    _storeUrls();
  }

  void _storeUrls() {
    FileSystem.write("urls.txt", jsonEncode(_urls));
  }

  ///
  /// Connection
  /// Manages connection and events raised by the connection
  ///

  ///try to create connection with given url.
  ///if it fails it will catch the error and return false.
  ///If an old connection exists, it will be closed using disconnect().
  bool tryConnectToUrl(String url) {
    disconnect();
    _connection = new SocketConnection(url, _onData, _onError, disconnect);
    try {
      _connection!.connect();
      _server = _ServerState();
      _requestTournaments();
      _requestModes();
    } catch (e) {
      _connection = null;
      _server = null;
      return false;
    }
    return true;
  }

  ///Called on errors in the stream of the socket.
  ///Probably this will only be called if the url is invalid or the server refuses the request,
  ///then the connection should be closed.
  void _onError(error, StackTrace stackTrace) {
    disconnect();
  }

  ///This method has to tasks:
  ///1. When called, it will close the current connection and deletes the reference to it.
  ///2. It will passed to the connection and handles an event that will be raised if the stream is done.
  ///   This happens also if the stream is closed. Therefore this method will be called again, if the stream isn't closed already.
  ///Todo: the user should be notified and/or the current server layer should be closed if it's still open.
  void disconnect() {
    print("Disconnected!");
    _connection?.disconnect();
    _connection = null;
  }

  ///Called on messages received by the socket.
  void _onData(message) {
    final m = json.decode(message);
    try {
      if (m["type"] == "tournaments") {
        final data = m["data"].cast<String>().toList();

        _server?.keys = data;

        serverNotifier.notify();
      } else if (m["type"] == "modes") {
        final data = m["data"]
            .map((j) => ModeModel.fromJson(j))
            .toList()
            .cast<ModeModel>()
            .toList();

        _server?.modes = data;

        serverNotifier.notify();
      } else if (m["type"] == "allTournamentData") {
        if (m["key"] == _server?.activeKey) {
          _tournament?.sync = m["data"]["sync"];
          _setStatus(m["data"]["status"]);
          _setTeams(m["data"]["teams"]);
          _setModules(m["data"]["modules"]);
        }
      } else if (m["type"] == "tournamentData") {
        if (m["key"] == _server?.activeKey &&
            m["syncOld"] == _tournament?.sync) {
          _tournament?.sync = m["sync"];
          switch(m["dataType"]) {
            case "team":
              print("TEAM!");
              _setTeams(m["data"]);
              break;
            case "status":
              print("STATUS!");
              _setStatus(m["data"]);
              break;
            case "structure":
              print("STRUCTURE!");
              _setModules(m["data"]);
              break;
          }
        } else {
          _requestAll();
        }
      } else if (m["type"] == "error") {
        notifyError(m["message"]);
      } else if (m["type"] == "syncError") {
        _requestAll();
        notifyError("Synchronisation error. Please try again!");
      } else if (m["type"] == "connected") {
        _connection?.connected = true;
        serverNotifier.notify();
      }
    } catch (e) {
      print(e);
    }
  }

  void _setModules(data) {
    if (data != "") {
      _tournament?.modules = _decodeModule(data["modules"][0], null);
    } else {
      _tournament?.modules = [];
    }
    gameNotifier.notify();
  }

  void _setTeams(data) {
    _tournament?.teams = data
        .map((t) => TeamModel.fromJson(t))
        .toList()
        .cast<TeamModel>()
        .toList();
    teamNotifier.notify();
  }

  void _setStatus(data) {
    _tournament?.started = data["started"];
    _tournament?.activeMode = _server!.modes.firstWhere(
        (mode) => mode.id == data["mode"],
        orElse: () => ModeModel(-1, "", ""));

    if(data.containsKey("winner") && _tournament?.winner != data["winner"]) {
        //TODO: Winner message
        TeamModel? winner = _tournament!.getTeamById(data["winner"]);
        notifyError((winner == null ? "" : winner.name) + " wins");
    }
    _tournament?.winner = data["winner"];

    modeNotifier.notify();
    infoNotifier.notify();
  }

  List<ModuleModel> _decodeModule(Map module, ModuleModel? parent) {
    final List<Map> submodules = [];
    final List<GameModel> games = [];
    final ModuleModel? lastVisibleModel = module["visible"]
        ? ModuleModel(module["type"] as String, module["label"] as String)
        : parent;

    module['modules'].forEach((element) {
      if ((element["type"] as String) == "game") {
        games.add(GameModel.fromJson(element));
      } else {
        submodules.add(element);
      }
    });

    module['games'].forEach((element) {
      if ((element["type"] as String) == "game") {
        games.add(GameModel.fromJson(element));
      } else {
        submodules.add(element);
      }
    });

    List<ModuleModel> decoded = submodules
        .map((e) => _decodeModule(e, lastVisibleModel))
        .fold([], (previousValue, e) {
      previousValue.addAll(e);
      return previousValue;
    });

    lastVisibleModel?.games.addAll(games);

    if (lastVisibleModel != null &&
        lastVisibleModel != parent &&
        lastVisibleModel.games.length > 0) decoded.add(lastVisibleModel);

    return decoded;
  }

  void notifyError(String message) {
    errorMessage = message;
    errorNotifier.notify();
    print(message);
  }

  ///
  ///ServerState:
  ///Information related to the whole server. (like modes provided)
  ///

  ///
  ///Getter
  ///

  ///True if a connection is established.
  bool isConnected() => _connection?.connected ?? false;

  ///List of all Modes the Server provides.
  ///The value is NULL, if there isn't a connection to a server.
  List<ModeModel> getModes() => _server != null ? _server!.modes : [];

  String? getActiveKey() => _server?.activeKey;

  ///List of all Tournament Keys the Server currently has.
  ///The value is NULL, if there isn't a connection to a server.
  List<String> getKeys() => _server != null ? _server!.keys : [];

  String? getUrl() => _connection?.url;

  ///
  /// TournamentState:
  /// Information and actions related to the instance of the tournament currently connected to.
  ///

  ///
  /// Getter
  /// The value is NULL, if no tournament is active on this client.
  ///

  bool? isStarted() => _tournament?.started;

  ModeModel? getActiveMode() => _tournament?.activeMode;

  List<TeamModel> getTeams() => _tournament != null ? _tournament!.teams : [];

  List<ModuleModel> getModules() =>
      _tournament != null ? _tournament!.modules : [];

  ///
  /// Actions
  ///

  void _requestAll() =>
      _connection?.send('{"type":"requestAll","key":"${_server!.activeKey}"}');

  void _requestTournaments() => _connection?.send('{"type":"getTournaments"}');

  void _requestModes() => _connection?.send('{"type":"getModes"}');

  void subscribe(String key) {
    _tournament = _TournamentState();
    _server?.activeKey = key;
    _connection?.send('{"type":"subscribe","key":"$key"}');
    _requestAll();
  }

  void unsubscribe() {
    if (_server != null && _server!.activeKey != null) {
      _connection?.send('{"type":"unsubscribe","key":"${_server!.activeKey}"}');
      _tournament = null;
      _server!.activeKey = null;
    }
  }

  void createTournament(String name) =>
      _connection?.send('{"type":"createTournament","key":"$name"}');

  void startTournament() => _connection?.send(
      '{"type":"start","key":"${_server!.activeKey}","sync":"${_tournament!.sync}"}');

  void resetTournament() => _connection?.send(
      '{"type":"reset","key":"${_server!.activeKey}","sync":"${_tournament!.sync}"}');

  void addTeam(String name) => _connection?.send(
      '{"type":"addTeam","key":"${_server!.activeKey}","sync":"${_tournament!.sync}","name":"$name"}');

  void removeTeam(int id) => _connection?.send(
      '{"type":"removeTeam","key":"${_server!.activeKey}","sync":"${_tournament!.sync}","id":"$id"}');

  void setActiveMode(int id) => _connection?.send(
      '{"type":"setMode","key":"${_server!.activeKey}","sync":"${_tournament!.sync}","id":"$id"}');

  void setResult(int gameId, int resultA, int resultB) => _connection?.send(
      '{"type":"setResult","key":"${_server!.activeKey}","sync":"${_tournament!.sync}","gameId":"$gameId","resultA":"$resultA","resultB":"$resultB"}');

  ///
  ///Singleton logic
  ///
  static Storage? _instance;

  static Storage instance() => _instance ?? (_instance = Storage());
}

class _TournamentState {
  bool started = false;
  String sync = "";
  int? winner;

  ModeModel? activeMode;
  List<TeamModel> teams = [];
  List<ModuleModel> modules = [];

  TeamModel? getTeamById(id) {
    for(int i = 0; i < teams.length; i++) {
      if(teams[i].id == id) {
        return teams[i];
      }
    }
  }
}

class _ServerState {
  List<ModeModel> modes = [];
  List<String> keys = [];
  String? activeKey;
}
