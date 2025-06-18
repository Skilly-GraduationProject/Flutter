
import 'dart:async';

import 'package:signalr_netcore/signalr_client.dart';


class SocketHelper {
  static final SocketHelper _instance = SocketHelper._internal();
  factory SocketHelper() => _instance;
  SocketHelper._internal();

  static const _serverUrl = 'https://skilly.runasp.net/chatHub';

  late HubConnection _hubConnection;

  bool get isConnected => _hubConnection.state == HubConnectionState.Connected;

  Future<void> connect() async {
    _hubConnection = HubConnectionBuilder()
        .withUrl(
          _serverUrl,
          options: HttpConnectionOptions(
            accessTokenFactory: () async =>
                "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6ImM4Y2YxNzc2LTY3ZTAtNGNhOC05NGEzLTZhMWY1Yzk1MWIzYyIsImh0dHA6Ly9zY2hlbWFzLnhtbHNvYXAub3JnL3dzLzIwMDUvMDUvaWRlbnRpdHkvY2xhaW1zL21vYmlsZXBob25lIjoiMDEwMjk3NjI2MDQiLCJqdGkiOiI0YTIzNjE3ZC1iNTBmLTRkMzUtYTJlMS1lYmY1MjE5YWIxYTQiLCJleHAiOjE3NTAyNjEzMTQsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6NTI3MSIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCJ9.9tFNMpiTbKB3HXxwxXZzmftcXzYvBsf2G4IGhCbgOdQ",
          ),
        )
        .build();

    // _hubConnection.onclose((error) {
    //   print('SignalR Disconnected: $error');
    //   _reconnect();
    // });

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
