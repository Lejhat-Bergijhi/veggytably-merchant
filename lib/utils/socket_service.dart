// ignore: library_prefixes
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:vegytably_merchant/utils/api.endpoints.dart';

import '../controllers/merchant_controller.dart';

class SocketService {
  static final SocketService _instance = SocketService._internal();

  late IO.Socket socket;

  factory SocketService() {
    return _instance;
  }

  SocketService._internal() {
    // namespace: https://domain:port/merchant
    socket = IO.io("${ApiEndPoints.baseUrl}merchant", <String, dynamic>{
      'transports': ['websocket'],
      // 'autoConnect': false,
    });
    socket.onConnect((_) {
      print('connected to server');
      // specify merchant id
      socket.emit('subscribe', MerchantController.to.merchant.id);
    });
    socket.onDisconnect((_) => print('disconnect'));
    socket.on('fromServer', (_) => print(_));
  }

  IO.Socket getInstance() {
    return socket;
  }
}
