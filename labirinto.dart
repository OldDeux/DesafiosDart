
import 'dart:io';

void main() {
  List<List<String>> labirinto = [
    ['#', '#', '#', '#', '#', '#', '#'],
    ['#', '@', '#', '.', '.', '.', '#'],
    ['#', '.', '#', '.', '#', '.', '#'],
    ['#', '.', '.', '.', '#', '.', '#'],
    ['#', '#', '#', '.', '#', '.', '#'],
    ['#', '.', '.', '.', '.', '.', '#'],
    ['#', '#', '#', '#', '#', 'S', '#']
  ];

  int linha = 1;
  int coluna = 1;
  bool venceu = false;

  while (!venceu) {
    print('');

    for (int i = 0; i < labirinto.length; i++) {
      print(labirinto[i].join(' '));
    }

    print('\nUse W, A, S ou D para se movimentar:');
    String movimento =
        stdin.readLineSync()!.toLowerCase();

    int novaLinha = linha;
    int novaColuna = coluna;

    if (movimento == 'w') {
      novaLinha--;
    } else if (movimento == 's') {
      novaLinha++;
    } else if (movimento == 'a') {
      novaColuna--;
    } else if (movimento == 'd') {
      novaColuna++;
    } else {
      print('Movimento inválido!');
      continue;
    }

    if (labirinto[novaLinha][novaColuna] == '#') {
      print('Você encontrou uma parede!');
      continue;
    }

    if (labirinto[novaLinha][novaColuna] == 'S') {
      print('\nParabéns! Você encontrou a saída!');
      venceu = true;
      continue;
    }

    labirinto[linha][coluna] = '.';

    linha = novaLinha;
    coluna = novaColuna;

    labirinto[linha][coluna] = '@';
  }

  print('\nLabirinto concluído!');
}
