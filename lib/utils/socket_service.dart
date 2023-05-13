import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:vegytably_merchant/utils/api.endpoints.dart';

class SocketService {
  static final SocketService _instance = SocketService._internal();

  late IO.Socket socket;

  factory SocketService() {
    return _instance;
  }

  SocketService._internal() {
    socket = IO.io(ApiEndPoints.baseUrl, <String, dynamic>{
      'transports': ['websocket'],
      // 'autoConnect': false,
    });
    socket.onConnect((_) {
      print('connect');
      socket.emit('msg', 'test');
    });
    socket.on('event', (data) => print(data));
    socket.onDisconnect((_) => print('disconnect'));
    socket.on('fromServer', (_) => print(_));
  }

  IO.Socket getInstance() {
    return socket;
  }
}
