import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  final String textoBotao;
  final Color corTextoBotao;
  final Color cor;
  final void Function() quandoClicar;
  final double largura;
  final double altura;

  const CommonButton({
    super.key,
    required this.quandoClicar,
    required this.textoBotao,
    this.cor = Colors.deepPurple,
    this.corTextoBotao = Colors.white,
    this.largura = 100,
    this.altura = 25,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: quandoClicar,
      child: Container(
        width: largura,
        height: altura,
        decoration: BoxDecoration(
          color: cor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: Text(
            textoBotao,
            style: TextStyle(fontSize: 14, color: corTextoBotao),
          ),
        ),
      ),
    );
  }
}
