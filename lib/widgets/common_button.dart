import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  String textoBotao;
  Color corTextoBotao;
  Color cor;
  void Function() quandoClicar;

  CommonButton({
    super.key,
    required this.quandoClicar,
    this.cor = Colors.deepPurple,
    this.corTextoBotao = Colors.white,
    required this.textoBotao,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        quandoClicar();
      },
      child: Container(
        width: 100,
        height: 25,
        decoration: BoxDecoration(
          color: cor,
          borderRadius: BorderRadius.all(Radius.circular(5)),
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
