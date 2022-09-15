import 'controllers/bank_controller.dart';
import 'exceptions/bank_controller_exceptions.dart';
import 'models/account.dart';

void main() {
  //Criação do banco
  BankController bankController = BankController();

  //Adicionando contas
  bankController.addAccount(
    id: 'Cacau',
    account: Account(
      name: 'Antônio Claudio',
      balance: 1250.50,
      isAuthenticated: true,
    ),
  );

  bankController.addAccount(
    id: 'Clarinha',
    account: Account(
      name: 'Ana Clara',
      balance: 900.50,
      isAuthenticated: false,
    ),
  );

  //Realização de transferência
  try {
    bool result = bankController.makeTransfer(
      idSender: 'Cacau',
      idReceiver: 'Clarinha',
      amount: 1200.5,
    );

    if (result) {
      print('Transação concluída com sucesso!');
    }
  } on SenderIdInvalidException catch (e) {
    print(e);
    print('O ID "${e.idSender}" do remetente não é um ID válido!');
  } on ReceiverIdInvalidException catch (e) {
    print(e);
    print('O ID "${e.idReceiver}" do destinatário não é um ID válido!');
  } on SenderNotAuthenticatedException catch (e) {
    print(e);
    print('O remetente de ID "${e.idSender}" não está autenticado!');
  } on ReceiverNotAuthenticatedException catch (e) {
    print(e);
    print('O destinatário de ID "${e.idReceiver}" não está autenticado!');
  } on SenderBalanceLowerThanAmountException catch (e) {
    print(e);
    print(
        'O remetente de ID "${e.idSender}" tentou fazer uma transferência de ${e.amount}, no entanto sua conta possui um saldo de ${e.balance} reais. Desta forma, faltam ${e.amount - e.balance} reais para que a transferência possa ser concluída!');
  } on Exception {
    print('Algum erro ocorreu durante a transação!');
  }
}
