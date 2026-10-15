import 'dart:io';

void main() {
  String palavra = 'dart';

  List<String> letras = [];

  // começa mostrando campo vaizo
  for (int cont = 0; cont < palavra.length; cont++) {
    letras.add('_');
  }

  int erros = 0;
  int limiteErros = 6;

  List<String> tentativas = [];

  while (erros < limiteErros) {
    print('\nPalavra: ${letras.join(' ')}');

    print('Digite uma letra:');
    String letra = stdin.readLineSync()!.toLowerCase();

    if (letra.length != 1) {
      print('Digite somente uma letra.');
      continue;
    }

    // Não deixa repetir a mesma letra
    if (tentativas.contains(letra)) {
      print('Você já tentou essa letra.');
      continue;
    }

    tentativas.add(letra);

    bool acertou = false;

    // procura a letra dentro da palavra
    for (int cont = 0; cont < palavra.length; cont++) {
      if (palavra[cont] == letra) {
        letras[cont] = letra;
        acertou = true;
      }
    }

    if (acertou) {
      print('Acertou!');
    } else {
      erros++;
      print('Errou!');
      print('Erros: $erros de $limiteErros');
    }

    // verifica se todas as letras foram descobertas
    if (!letras.contains('_')) {
      print('\nVocê venceu!');
      print('A palavra era: $palavra');
      break;
    }
  }

  if (erros == limiteErros) {
    print('\nVocê perdeu!');
    print('A palavra era: $palavra');
  }
}
