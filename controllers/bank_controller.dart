import '../exceptions/bank_controller_exceptions.dart';
import '../models/account.dart';

class BankController {
  final Map<String, Account> _database = {};

  addAccount({required String id, required Account account}) {
    _database[id] = account;
  }

  bool verifyId(String id) {
    return _database.containsKey(id);
  }

  makeTransfer({
    required String idSender,
    required String idReceiver,
    required double amount,
  }) {
    //Verificação se o id do remetente é válido
    if (!verifyId(idSender)) {
      throw SenderIdInvalidException(idSender: idSender);
    }

    //Verificação se o id do destinatário é válido
    if (!verifyId(idReceiver)) {
      throw ReceiverIdInvalidException(idReceiver: idReceiver);
    }

    //Determinação das contas do remetente e do destinatário
    Account accountSender = _database[idSender]!;
    Account accountReceiver = _database[idReceiver]!;

    //Verificação se o remetente está autenticado
    if (!accountSender.isAuthenticated) {
      throw SenderNotAuthenticatedException(idSender: idSender);
    }

    //Verificação se o destinatário está autenticado
    if (!accountReceiver.isAuthenticated) {
      throw ReceiverNotAuthenticatedException(idReceiver: idReceiver);
    }

    //Verificação se o remetente possui saldo suficiente para efetuar a transação
    if (accountSender.balance < amount) {
      throw SenderBalanceLowerThanAmountException(
        idSender: idSender,
        amount: amount,
        balance: accountSender.balance,
      );
    }

    //Com todas as validações, efetivar a transação
    accountSender.balance -= amount;
    accountReceiver.balance += amount;

    return true;
  }
}
