import 'package:flutter/material.dart';
import 'dart:math';

class Jogo extends StatefulWidget {
  const Jogo({Key? key}) : super(key: key);

  @override
  State<Jogo> createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  final List<String> _opcoes = ["papel", "pedra", "tesoura"];
  String _imagemEscolhaApp = "images/padrao.png";
  String _mensagem = "Escolha uma opção abaixo:";
  String _emoji = "🤖";

  void _jogar(String escolhaUsuario) {
    int indiceApp = Random().nextInt(3);
    String escolhaApp = _opcoes[indiceApp];

    setState(() {
      _imagemEscolhaApp = "images/$escolhaApp.png";

      if ((escolhaUsuario == "pedra" && escolhaApp == "tesoura") ||
          (escolhaUsuario == "tesoura" && escolhaApp == "papel") ||
          (escolhaUsuario
