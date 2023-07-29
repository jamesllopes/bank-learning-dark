class SenderIdInvalidException implements Exception {
  static const String report = "SenderIdInvalidException";
  String idSender;

  SenderIdInvalidException({required this.idSender});

  @override
  String toString() {
    return "$report\nSender: $idSender";
  }
}

class ReceiverIdInvalidException implements Exception {
  static const String report = "ReceiverIdInvalidException";

  String idReceiver;

  ReceiverIdInvalidException({required this.idReceiver});
  @override
  String toString() {
    return "$report\nReceiver: $idReceiver";
  }
}

class SenderNotAuthenticatedException implements Exception {
  static const String report = "SenderNotAuthenticatedException";

  String idSender;

  SenderNotAuthenticatedException({required this.idSender});
  @override
  String toString() {
    return "$report\nSender: $idSender";
  }
}

class SenderBalanceLowerThanAmountException implements Exception {
  static const String report = "SenderBalanceLowerThanAmountException";

  String idSender;
  double amount;
  double balance;

  SenderBalanceLowerThanAmountException(
      {required this.idSender, required this.amount, required this.balance});
  @override
  String toString() {
    return "$report\nSender: $idSender\nBalance: $balance\nAmount: $amount";
  }
}
