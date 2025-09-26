import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:todo/home_page.dart';
import 'package:todo/login.dart';
import 'widgets/common_button.dart';

class CriarcontaPage extends StatefulWidget {
  const CriarcontaPage({super.key});

  @override
  State<CriarcontaPage> createState() => _CriarcontaPageState();
}

class _CriarcontaPageState extends State<CriarcontaPage> {
  TextEditingController usuarioEntrada = TextEditingController();
  TextEditingController senhaEntrada = TextEditingController();
  TextEditingController confirmarSenhaEntrada = TextEditingController();

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
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Criar conta",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 32),
                TextField(
                  controller: usuarioEntrada,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: "Usuário",
                    labelStyle: TextStyle(color: Colors.white),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepPurple),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                TextField(
                  controller: senhaEntrada,
                  obscureText: true,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: "Senha",
                    labelStyle: TextStyle(color: Colors.white),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepPurple),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                TextField(
                  controller: confirmarSenhaEntrada,
                  obscureText: true,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: "Confirmar Senha",
                    labelStyle: TextStyle(color: Colors.white),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepPurple),
                    ),
                  ),
                ),
                SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: CommonButton(
                    textoBotao: "Criar Conta",
                    quandoClicar: validarCriacaoConta,
                  ),
                ),
                SizedBox(height: 32),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ),
                    );
                  },
                  child: Text(
                    "Já possui login? Entre aqui",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validarCriacaoConta() {
    String usuario = usuarioEntrada.text.trim();
    String senha = senhaEntrada.text.trim();
    String confirmarSenha = confirmarSenhaEntrada.text.trim();

    if (usuario.isEmpty || senha.isEmpty || confirmarSenha.isEmpty) {
      Fluttertoast.showToast(
        msg: "Preencha os campos",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.orange,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    } else if (senha != confirmarSenha) {
      Fluttertoast.showToast(
        msg: "As senhas não coincidem",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.redAccent,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    } else {
      Fluttertoast.showToast(
        msg: "Conta criada com sucesso!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0,
      );

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    }
  }
}
