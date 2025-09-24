import 'package:flutter/material.dart';
import 'package:todo/widgets/common_button.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Expanded(child: Container(color: Colors.red)),
              Container(
                height: 100,
                color: Colors.blue,
                child: Column(
                  children: [
                    CommonButton(
                      textoBotao: "Login",
                      corTextoBotao: Colors.grey,
                      cor: const Color.fromARGB(255, 59, 59, 59),
                      quandoClicar: () {
                        print("Pular");
                      },
                    ),
                    Container(height: 15), // distânica entre os botões
                    CommonButton(
                      textoBotao: "Criar conta",
                      corTextoBotao: Colors.grey,
                      cor: const Color.fromARGB(255, 59, 59, 59),
                      quandoClicar: () {
                        print("Pular");
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
