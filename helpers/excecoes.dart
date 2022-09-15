void main() {
  print("Started main!");
  function01();
  print("Finished main!");
}

void function01() {
  print("Started function 01!");
  try {
    //Bloco de código em que se espera que ocorra uma exceção
    function02();
  } on FormatException catch (e) {
    //Determinação da exceção esperada
    //O termo 'catch(e)' é usado para capturar a exceção como um objeto

    print(
      "A function02 foi capturada pela function01 por apresentar exceções!",
    );
  } on Exception catch (e) {} //Captura qualquer tipo de exceção, visto que nenhuma foi previamente especificada
  print("Finished function 01!");
}

void function02() {
  print("Started function 02!");
  for (var i = 1; i < 5; i++) {
    print(i);
    double amount = double.parse("Not a number");
  }
  print("Finished function 02!");
}
