import 'package:flutter/material.dart';
import 'widgets/common_button.dart';

class EditarCategoriaPage extends StatefulWidget {
  final Map categoria;

  const EditarCategoriaPage({required this.categoria, super.key});

  @override
  State<EditarCategoriaPage> createState() => _EditarCategoriaPageState();
}

class _EditarCategoriaPageState extends State<EditarCategoriaPage> {
  TextEditingController nomeController = TextEditingController();
  Color corSelecionada = Colors.deepPurple;

  @override
  void initState() {
    super.initState();
    nomeController.text = widget.categoria['nome'];
    corSelecionada = widget.categoria['cor'];
  }

  void salvarEdicao() {
    Map categoriaAtualizada = {
      'nome': nomeController.text,
      'cor': corSelecionada,
    };

    Navigator.pop(context, categoriaAtualizada);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Editar", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          children: [
            TextField(
              controller: nomeController,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: "Nome da Categoria",
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
            Text("Escolha a cor", style: TextStyle(color: Colors.white)),
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                corOption(Colors.deepPurple),
                corOption(Colors.blue),
                corOption(Colors.green),
                corOption(Colors.orange),
                corOption(Colors.red),
              ],
            ),
            SizedBox(height: 32),
            CommonButton(
              textoBotao: "Salvar",
              quandoClicar: salvarEdicao,
              altura: 40,
              largura: double.infinity,
              cor: Colors.white,
              corTextoBotao: Colors.deepPurple,
            ),
          ],
        ),
      ),
    );
  }

  Widget corOption(Color cor) {
    return GestureDetector(
      onTap: () {
        setState(() {
          corSelecionada = cor;
        });
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8),
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          color: cor,
          shape: BoxShape.circle,
          border: Border.all(
            color: corSelecionada == cor ? Colors.white : Colors.transparent,
            width: 2,
          ),
        ),
      ),
    );
  }
}
