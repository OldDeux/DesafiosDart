
import 'dart:io';

void main() {
  List<String> tabuleiro = [
    '1', '2', '3',
    '4', '5', '6',
    '7', '8', '9'
  ];

  String jogador = 'X';
  bool terminou = false;

  while (!terminou) {
    print('\n${tabuleiro[0]} | ${tabuleiro[1]} | ${tabuleiro[2]}');
    print('--+---+--');
    print('${tabuleiro[3]} | ${tabuleiro[4]} | ${tabuleiro[5]}');
    print('--+---+--');
    print('${tabuleiro[6]} | ${tabuleiro[7]} | ${tabuleiro[8]}');

    print('\nJogador $jogador, escolha uma posição de 1 a 9:');
    String? entrada = stdin.readLineSync();
    int? posicao = int.tryParse(entrada ?? '');

    if (posicao == null || posicao < 1 || posicao > 9) {
      print('Posição inválida!');
      continue;
    }

    if (tabuleiro[posicao - 1] == 'X' ||
        tabuleiro[posicao - 1] == 'O') {
      print('Essa posição já está ocupada!');
      continue;
    }

    tabuleiro[posicao - 1] = jogador;

    bool ganhou = false;

    List<List<int>> combinacoes = [
      [0, 1, 2], [3, 4, 5], [6, 7, 8],
      [0, 3, 6], [1, 4, 7], [2, 5, 8],
      [0, 4, 8], [2, 4, 6]
    ];

    for (int i = 0; i < combinacoes.length; i++) {
      int a = combinacoes[i][0];
      int b = combinacoes[i][1];
      int c = combinacoes[i][2];

      if (tabuleiro[a] == jogador &&
          tabuleiro[b] == jogador &&
          tabuleiro[c] == jogador) {
        ganhou = true;
      }
    }

    if (ganhou) {
      print('\nJogador $jogador venceu!');
      terminou = true;
    } else if (!tabuleiro.any((casa) =>
        casa != 'X' && casa != 'O')) {
      print('\nO jogo terminou empatado!');
      terminou = true;
    } else {
      if (jogador == 'X') {
        jogador = 'O';
      } else {
        jogador = 'X';
      }
    }
  }

  print('\nTabuleiro final:');
  print('${tabuleiro[0]} | ${tabuleiro[1]} | ${tabuleiro[2]}');
  print('--+---+--');
  print('${tabuleiro[3]} | ${tabuleiro[4]} | ${tabuleiro[5]}');
  print('--+---+--');
  print('${tabuleiro[6]} | ${tabuleiro[7]} | ${tabuleiro[8]}');
}
