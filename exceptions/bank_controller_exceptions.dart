class SenderIdInvalidException implements Exception {
  SenderIdInvalidException({
    required this.idSender,
  });

  String idSender;
  static const String report = 'SenderIdInvalidException';

  @override
  String toString() {
    return '$report\nID Sender: $idSender';
  }
}

class ReceiverIdInvalidException implements Exception {
  ReceiverIdInvalidException({
    required this.idReceiver,
  });

  String idReceiver;
  static const String report = 'ReceiverIdInvalidException';

  @override
  String toString() {
    return '$report\nID Receiver: $idReceiver';
  }
}

class SenderNotAuthenticatedException implements Exception {
  SenderNotAuthenticatedException({
    required this.idSender,
  });

  String idSender;
  static const String report = 'SenderNotAuthenticatedException';

  @override
  String toString() {
    return '$report\nID Sender: $idSender';
  }
}

class ReceiverNotAuthenticatedException implements Exception {
  ReceiverNotAuthenticatedException({
    required this.idReceiver,
  });

  String idReceiver;
  String report = 'ReceiverNotAuthenticatedException';

  @override
  String toString() {
    return '$report\nID Receiver: $idReceiver';
  }
}

class SenderBalanceLowerThanAmountException implements Exception {
  SenderBalanceLowerThanAmountException({
    required this.idSender,
    required this.balance,
    required this.amount,
  });

  String idSender;
  double balance;
  double amount;
  static const String report = 'SenderBalanceLowerThanAmountException';

  @override
  String toString() {
    return '$report\nID Sender: $idSender\nSender Balance: $balance\nSender Amount: $amount';
  }
}
