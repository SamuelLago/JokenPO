import 'package:flutter/material.dart';
import 'dart:math';

class Jogo extends StatefulWidget {
  const Jogo({Key? key}) : super(key: key);

  @override
  State<Jogo> createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  final List<String> _opcoes = ["pedra", "papel", "tesoura"];
  String _imagemEscolhaApp = "images/padrao.png";
  String _mensagem = "Escolha uma opção abaixo:";
  String _emoji = "🤖";
  Color _corResultado = Colors.white;

  int _vitorias = 0;
  int _derrotas = 0;
  int _empates = 0;

  void _opcaoSelecionada(String escolhaUsuario) {
    int indiceApp = Random().nextInt(3);
    String escolhaApp = _opcoes[indiceApp];

    print("Escolha do App: $escolhaApp");
    print("Escolha do Usuário: $escolhaUsuario");

    setState(() {
      _imagemEscolhaApp = "images/$escolhaApp.png";

      if ((escolhaUsuario == "pedra" && escolhaApp == "tesoura") ||
          (escolhaUsuario == "tesoura" && escolhaApp == "papel") ||
          (escolhaUsuario == "papel" && escolhaApp == "pedra")) {
        _mensagem = "Você venceu!";
        _emoji = "🎉";
        _corResultado = Colors.green;
        _vitorias++;
      } else if (escolhaUsuario == escolhaApp) {
        _mensagem = "Empate!";
        _emoji = "😐";
        _corResultado = Colors.amber;
        _empates++;
      } else {
        _mensagem = "Você perdeu!";
        _emoji = "😢";
        _corResultado = Colors.red;
        _derrotas++;
      }
    });
  }

  void _resetarJogo() {
    setState(() {
      _imagemEscolhaApp = "images/padrao.png";
      _mensagem = "Escolha uma opção abaixo:";
      _emoji = "🤖";
      _corResultado = Colors.white;
      _vitorias = 0;
      _derrotas = 0;
      _empates = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: const Text('JokenPO'),
        actions: [
          IconButton(
            onPressed: _resetarJogo,
            icon: const Icon(Icons.refresh),
            tooltip: "Resetar jogo",
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 24),
            child: Center(
              child: Image.asset(
                'images/gif.gif',
                height: 100,
              ),
            ),
          ),
          const Text(
            "Escolha do App",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Image.asset(_imagemEscolhaApp, height: 100),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              _mensagem,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.055,
                fontWeight: FontWeight.bold,
                color: _corResultado,
              ),
            ),
          ),
          Text(
            _emoji,
            style: const TextStyle(fontSize: 40),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              "Vitórias: $_vitorias  |  Derrotas: $_derrotas  |  Empates: $_empates",
              style: const TextStyle(color: Colors.white),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 24.0, top: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: [
                    GestureDetector(
                      onTap: () => _opcaoSelecionada("pedra"),
                      child: Image.asset('images/pedra.png', height: 80),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      "Pedra",
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () => _opcaoSelecionada("papel"),
                      child: Image.asset('images/papel.png', height: 80),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      "Papel",
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () => _opcaoSelecionada("tesoura"),
                      child: Image.asset('images/tesoura.png', height: 80),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      "Tesoura",
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
