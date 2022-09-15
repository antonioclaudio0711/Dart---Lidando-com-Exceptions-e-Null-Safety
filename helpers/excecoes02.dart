import 'excecoes.dart';

void main() {
  print('Started main!');
  function01();
  print('Finished main!');
}

void function01() {
  print('Started function01!');
  try {
    function02();
  } catch (exception, stackTrace) {
    print(exception);
    print(stackTrace); //Provê o rastro da pilha de execução
    rethrow; //Tratamento da exceção, no entanto, esta ainda é enviada para o próximo nível da pilha de execução
  } finally {
    //O finally roda mesmo com qualquer quebra de código
    print('Chegou no finally!');
  }
  print('Finished function01!');
}

void function02() {
  print('Started function02!');
  for (var i = 1; i < 5; i++) {
    print(i);
    double amount = double.parse('Not a number!');
  }
  print('Finished function02!');
}
