import 'package:flutter/material.dart';
import 'widgets/common_button.dart';

class Onboard extends StatefulWidget {
  const Onboard({super.key});

  @override
  State<Onboard> createState() => _OnboardState();
}

class _OnboardState extends State<Onboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: Column(
            children: [
              CommonButton(
                textoBotao: "Pular",
                corTextoBotao: Colors.grey,
                cor: const Color.fromARGB(255, 59, 59, 59),
                quandoClicar: () {
                  print("Pular");
                },
              ),

              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/onboard-001.png",
                      width: 200,
                      height: 200,
                    ),
                    SizedBox(height: 50),
                    Text(
                      "Gerencie suas tarefas",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 25),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Text(
                        "Você pode gerenciar facilmente todas as suas tarefas diárias no MyToDo gratuitamente",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),

              CommonButton(
                textoBotao: "Anterior",
                corTextoBotao: Colors.grey,
                cor: const Color.fromARGB(255, 59, 59, 59),
                quandoClicar: () {
                  print("Anterior");
                },
              ),
              CommonButton(
                textoBotao: "Próxima",
                quandoClicar: () {
                  print("Próxima");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
