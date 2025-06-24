import 'dart:convert';
import 'dart:async';

import 'package:grad_project/core/helper/shared_prefrences.dart';
import 'package:signalr_netcore/signalr_client.dart';
import 'package:flutter/foundation.dart';

class SocketHelper {
  static final SocketHelper _instance = SocketHelper._internal();
  factory SocketHelper() => _instance;
  SocketHelper._internal();

  static const _serverUrl = 'https://skilly.runasp.net/chatHub';

  late HubConnection _hubConnection;

  Future<void> connect() async {
    _hubConnection = HubConnectionBuilder()
        .withUrl(
          _serverUrl,
          options: HttpConnectionOptions(
            accessTokenFactory: () async => await loadToken() ?? "",
          ),
        )
        .build();

    _hubConnection.onclose((error) {
      print('SignalR Disconnected: $error');
      _reconnect();
    });

    _hubConnection.on("ReceiveMessage", (args) {
      print("Message from server: $args");
      // You can trigger your stream/controller here
    });

    try {
      await _hubConnection.start();

      // _hubConnection.invoke("JoinChat",args: ["2019d561-014c-4f3b-a4d8-80ab399e8064"]);
      print('SignalR Connected');
    } catch (e) {
      print('SignalR Connection Error: $e');
      _reconnect();
    }
  }

  void _reconnect() {
    Future.delayed(const Duration(seconds: 5), () {
      connect();
    });
  }

  // void sendMessage(String method, List<dynamic> args) {
  //   if (!isConnected) {
  //     print("SignalR is not connected");
  //     return;
  //   }

  //   _hubConnection.invoke(method,args:args).catchError((e) {
  //     print("Error sending message: $e");
  //   });
  // }

  void disconnect() {
    _hubConnection.stop();
  }

  Stream<dynamic> onEvent(String eventName) {
    final controller = StreamController<List<dynamic>?>();
    _hubConnection.on(eventName, (args) {
      controller.add(args);
    });
    return controller.stream;
  }
}
