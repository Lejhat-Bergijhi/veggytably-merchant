import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;
import 'package:vegytably_merchant/api/transaction_api.dart';

import '../models/exception_response.dart';
import '../models/transaction_model.dart';
import '../utils/socket_service.dart';

class TransactionController extends GetxController {
  RxList<Transaction> transactions = <Transaction>[].obs;

  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    // get transactions from server
    fetchTransactions();

    // listen to transaction event
    SocketService().socket.on('transaction', (data) {
      // update transaction list here
      Transaction transaction = Transaction.fromJson(data);
      addTransaction(transaction);
      print(transaction);

      update();
    });
  }

  @override
  void onClose() {
    super.onClose();
    // close socket connection
    SocketService().socket.disconnect();
  }

  void setTransactions(List<Transaction> transactions) {
    this.transactions.value = transactions;
    update();
  }

  void addTransaction(Transaction transaction) {
    transactions.insert(0, transaction);
  }

  void removeTransaction(Transaction transaction) {
    transactions.remove(transaction);
  }

  void fetchTransactions() async {
    try {
      isLoading.value = true;
      update();

      Response response = await TransactionApi.instance.fetchTransactions();
      if (response.statusCode != 200) {
        String errorMessage = ExceptionResponse.getMessage(response.data);
        throw Exception(errorMessage);
      }

      List<Transaction> transactions =
          (response.data['data']['transaction'] as List)
              .reversed
              .map((transaction) => Transaction.fromJson(transaction))
              .toList();

      setTransactions(transactions);
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
      update();
    }
  }
}
