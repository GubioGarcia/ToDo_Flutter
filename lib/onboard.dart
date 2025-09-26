import 'package:flutter/material.dart';
import 'welcome.dart';
import 'widgets/common_button.dart';

class Onboard extends StatefulWidget {
  const Onboard({super.key});

  @override
  State<Onboard> createState() => _OnboardState();
}

class _OnboardState extends State<Onboard> {
  int indexAtual = 0;

  final List<Map<String, String>> onboardingData = [
    {
      "image": "assets/images/onboard-001.png",
      "title": "Gerencie suas tarefas",
      "subtitle":
          "Você pode gerenciar facilmente todas as suas tarefas diárias no MyToDo gratuitamente",
    },
    {
      "image": "assets/images/onboard-002.png",
      "title": "Organize seu tempo",
      "subtitle":
          "Defina prazos e receba lembretes para nunca perder uma tarefa importante",
    },
    {
      "image": "assets/images/onboard-003.png",
      "title": "Acompanhe seu progresso",
      "subtitle":
          "Visualize seu desempenho e mantenha-se motivado todos os dias",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 20, top: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: CommonButton(
                    textoBotao: "Pular",
                    corTextoBotao: Colors.grey,
                    cor: const Color.fromARGB(255, 59, 59, 59),
                    quandoClicar: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Welcome(),
                        ),
                      );
                    },
                  ),
                ),
              ),

              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      onboardingData[indexAtual]["image"]!,
                      width: 200,
                      height: 200,
                    ),
                    SizedBox(height: 50),
                    Text(
                      onboardingData[indexAtual]["title"]!,
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
                        onboardingData[indexAtual]["subtitle"]!,
                        style: TextStyle(fontSize: 20, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (indexAtual > 0)
                      Expanded(
                        child: CommonButton(
                          textoBotao: "Anterior",
                          corTextoBotao: Colors.grey,
                          cor: const Color.fromARGB(255, 59, 59, 59),
                          quandoClicar: () {
                            setState(() {
                              indexAtual--;
                            });
                          },
                        ),
                      )
                    else
                      Expanded(child: SizedBox()),
                    SizedBox(width: 16),
                    Expanded(
                      child: CommonButton(
                        textoBotao: "Próxima",
                        quandoClicar: () {
                          setState(() {
                            if (indexAtual < onboardingData.length - 1) {
                              indexAtual++;
                            } else {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Welcome(),
                                ),
                              );
                            }
                          });
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
