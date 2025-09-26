import 'package:flutter/material.dart';
import 'package:todo/criarConta.dart';
import 'package:todo/login.dart';
import 'package:todo/widgets/common_button.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Align(
          alignment: Alignment.center,
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Bem-vindo ao MyToDo",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 25),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Text(
                        "Por favor, realize o login ou crie uma conta para continuar",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 100,
                child: Column(
                  children: [
                    SizedBox(
                      width: 400, // largura desejada
                      height: 30, // altura desejada
                      child: CommonButton(
                        textoBotao: "Login",
                        cor: Colors.deepPurple,
                        quandoClicar: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginPage(),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 15),
                    SizedBox(
                      width: 400,
                      height: 30,
                      child: CommonButton(
                        textoBotao: "Criar conta",
                        corTextoBotao: Colors.deepPurple,
                        cor: Colors.white,
                        quandoClicar: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const CriarcontaPage(),
                            ),
                          );
                        },
                      ),
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
