import 'package:tournament_scheduler_client/control/notifier.dart';
import 'package:tournament_scheduler_client/control/storage.dart';
import 'package:tournament_scheduler_client/view/error_message_widget.dart';
import 'package:tournament_scheduler_client/view/menu.dart';
import 'package:tournament_scheduler_client/view/server_layer.dart';
import 'package:tournament_scheduler_client/view/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  if(Storage.instance().tryConnectToUrl("192.168.178.30:8080"))
    runApp(App());
}

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tournament Scheduler',
      themeMode: ThemeMode.system,
      theme: basicTheme,
      darkTheme: darkTheme,
      home: NotifierInit(child: ServerLayer()),
    );
  }
}

///Using an MultiProviderWidget all notifier in the storage will be initialized.
///Consumers with the same notifier will no be alerted at notifyListeners.
class NotifierInit extends StatelessWidget {
  final Widget child;

  NotifierInit({required this.child});

  @override
  Widget build(BuildContext context) {
    final st = Storage.instance();


    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: st.urlNotifier),
        ChangeNotifierProvider.value(value: st.infoNotifier),
        ChangeNotifierProvider.value(value: st.modeNotifier),
        ChangeNotifierProvider.value(value: st.gameNotifier),
        ChangeNotifierProvider.value(value: st.teamNotifier),
        ChangeNotifierProvider.value(value: st.serverNotifier),
      ],
      child: child,
    );
  }
}

///Shows the first layer of the app.
///The User will be able to store new urls and connect to one of the stored connection.
///After connection to a server a new layer will be opened on top of this.
class MainLayer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Storage st = Storage.instance();

    return Scaffold(
      body: ErrorMessageWidget(
        layer: 0,
        child: Consumer<UrlNotifier>(
          builder: (context, n, c) => ListView(
            children: st
                .getStoredUrls()
                .map((url) => _urlToWidget(context, url))
                .toList(growable: false),
          ),
        ),
      ),
      appBar: _buildAppBar(context),
    );
  }
}

///Taking an Url as String and converting it to a Widget.
Widget _urlToWidget(BuildContext context, String url) {
  return ListTile(
    title: Text(url),

    onTap: () {
      //if connection succeeds a new server-level layer will be created
      //if connection fails an error message will show up.

      if (Storage.instance().tryConnectToUrl(url)) {
        ErrorMessageWidget.currentLayer++;
        Navigator.push(
            context,
            MaterialPageRoute(

                //Open new layer
                builder: (_) => ServerLayer()));
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Connection failed")));
      }
    },

    ///Button to remove url from storage
    trailing: IconButton(
      icon: Icon(Icons.delete),
      onPressed: () => Storage.instance().removeUrl(url),
    ),
  );
}

///Building an AppBar that will be shown at the main layer
///With button to enter new urls and an info/setting (does nothing right now)
AppBar _buildAppBar(BuildContext context) {
  return AppBar(title: const Text("Tournament Scheduler"), actions: <Widget>[
    IconButton(
        icon: const Icon(Icons.add),
        onPressed: () {
          UrlDialog().show(context);
        }),
    IconButton(icon: const Icon(Icons.settings), onPressed: () {}),
  ]);
}
