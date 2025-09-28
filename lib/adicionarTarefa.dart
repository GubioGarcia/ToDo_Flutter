import 'package:flutter/material.dart';
import 'categorias.dart';
import 'models/tarefa.dart';
import 'widgets/common_button.dart';

class AdicionarTarefaPage extends StatefulWidget {
  const AdicionarTarefaPage({super.key});

  @override
  State<AdicionarTarefaPage> createState() => _AdicionarTarefaPageState();
}

class _AdicionarTarefaPageState extends State<AdicionarTarefaPage> {
  final tituloController = TextEditingController();
  final descricaoController = TextEditingController();
  DateTime? dataHoraSelecionada;
  String prioridadeSelecionada = "Média";

  String categoriaSelecionada = "Pessoal";
  List<String> categoriasDisponiveis = [
    "Pessoal",
    "Trabalho",
    "Estudos",
    "Saúde",
  ];

  void salvarTarefa() {
    if (tituloController.text.isEmpty || dataHoraSelecionada == null) return;

    final novaTarefa = Tarefa(
      titulo: tituloController.text,
      descricao: descricaoController.text,
      dataHora: dataHoraSelecionada!,
      prioridade: prioridadeSelecionada,
      categoria: categoriaSelecionada,
    );

    Navigator.pop(context, novaTarefa);
  }

  Future<void> selecionarDataHora() async {
    final data = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );
    if (data != null) {
      final hora = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );
      if (hora != null) {
        setState(() {
          dataHoraSelecionada = DateTime(
            data.year,
            data.month,
            data.day,
            hora.hour,
            hora.minute,
          );
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Nova Tarefa", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            TextField(
              controller: tituloController,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: "Título",
                labelStyle: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: descricaoController,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: "Descrição",
                labelStyle: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: 16),
            DropdownButtonFormField<String>(
              initialValue: prioridadeSelecionada,
              items: [
                "Alta",
                "Média",
                "Baixa",
              ].map((p) => DropdownMenuItem(value: p, child: Text(p))).toList(),
              onChanged: (value) =>
                  setState(() => prioridadeSelecionada = value!),
              decoration: InputDecoration(
                labelText: "Prioridade",
                labelStyle: TextStyle(color: Colors.white),
              ),
              dropdownColor: Colors.black,
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<String>(
                    initialValue: categoriaSelecionada,
                    items: categoriasDisponiveis
                        .map((c) => DropdownMenuItem(value: c, child: Text(c)))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        categoriaSelecionada = value!;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: "Categoria",
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                    dropdownColor: Colors.black,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.edit, color: Colors.white),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CategoriasPage()),
                    );
                  },
                ),
              ],
            ),
            SizedBox(height: 16),
            CommonButton(
              textoBotao: dataHoraSelecionada == null
                  ? "Selecionar Data e Hora"
                  : "Selecionado: ${dataHoraSelecionada.toString()}",
              cor: Colors.white,
              corTextoBotao: Colors.deepPurple,
              largura: double.infinity,
              quandoClicar: selecionarDataHora,
            ),
            SizedBox(height: 24),
            CommonButton(
              textoBotao: "Salvar",
              altura: 40,
              quandoClicar: salvarTarefa,
            ),
          ],
        ),
      ),
    );
  }
}
