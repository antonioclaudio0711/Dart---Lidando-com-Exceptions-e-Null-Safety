import 'dart:math';

import '../models/account.dart';

void testingNullSafety() {
  Account? myAccount = Account(
    name: 'Antônio CLaudio Ferreira Filho',
    balance: 1000,
    isAuthenticated: true,
  );

  //Simulando uma comunicação externa
  Random rng = Random();
  int randomNumber = rng.nextInt(10);
  print(randomNumber);

  if (randomNumber <= 5) {
    myAccount.createdAt = DateTime.now();
  }
  print(myAccount.runtimeType);
  print(myAccount.createdAt);

  if (myAccount != null) {
    print('A conta cadastrada possui um saldo de ${myAccount.balance} reais!');
    if (myAccount.createdAt != null) {
      print(
        'A conta em questão foi criada ${myAccount.createdAt!.day}',
      ); //Neste caso é indicada a utilização do bang (!), visto que já foi definido anteriormente que myAccount != null
    }
  } else {
    print('Conta nula!');
  }
  //print(myAccount != null ? myAccount.balance : 'Conta nula!');
  //print(myAccount?.balance); ---> irá mostrar o valor do saldo da conta somente se esta não for nula
  //print(myAccount!.balance); ---> uso de bang (!) = conversão direta (má prática)
}

void main() {
  testingNullSafety();

  String naoPodeSerNula = 'MyString!';
  //naoPodeSerNula = null;

  String? podeSerNula = 'MyString!';
  print(podeSerNula.runtimeType);
  podeSerNula = null;
  print(podeSerNula.runtimeType);
}
