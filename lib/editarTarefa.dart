import 'package:flutter/material.dart';
import 'categorias.dart';
import 'models/tarefa.dart';
import 'widgets/common_button.dart';

class EditarTarefaPage extends StatefulWidget {
  final Tarefa tarefa;

  const EditarTarefaPage({required this.tarefa, super.key});

  @override
  State<EditarTarefaPage> createState() => _EditarTarefaPageState();
}

class _EditarTarefaPageState extends State<EditarTarefaPage> {
  late TextEditingController tituloController;
  late TextEditingController descricaoController;
  late DateTime dataHoraSelecionada;
  late String prioridadeSelecionada;
  String categoriaSelecionada = "Pessoal";
  List<String> categoriasDisponiveis = [
    "Pessoal",
    "Trabalho",
    "Estudos",
    "Saúde",
  ];

  @override
  void initState() {
    super.initState();
    tituloController = TextEditingController(text: widget.tarefa.titulo);
    descricaoController = TextEditingController(text: widget.tarefa.descricao);
    dataHoraSelecionada = widget.tarefa.dataHora;
    prioridadeSelecionada = widget.tarefa.prioridade;
    categoriaSelecionada = widget.tarefa.categoria;
  }

  void salvarEdicao() {
    final tarefaAtualizada = Tarefa(
      titulo: tituloController.text,
      descricao: descricaoController.text,
      dataHora: dataHoraSelecionada,
      prioridade: prioridadeSelecionada,
      categoria: categoriaSelecionada,
    );
    Navigator.pop(context, tarefaAtualizada);
  }

  Future<void> selecionarDataHora() async {
    final data = await showDatePicker(
      context: context,
      initialDate: dataHoraSelecionada,
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );
    if (data != null) {
      final hora = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(dataHoraSelecionada),
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
        title: Text("Editar Tarefa", style: TextStyle(color: Colors.white)),
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
              controller: descricaoController,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: "Descrição",
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
              textoBotao: "Selecionar nova data e hora",
              quandoClicar: selecionarDataHora,
              largura: double.infinity,
              altura: 40,
              cor: Colors.white,
              corTextoBotao: Colors.deepPurple,
            ),
            SizedBox(height: 8),
            Text(
              "Atual: ${dataHoraSelecionada.toString()}",
              style: TextStyle(color: Colors.white70),
            ),
            SizedBox(height: 24),
            CommonButton(
              textoBotao: "Salvar",
              quandoClicar: salvarEdicao,
              altura: 40,
            ),
          ],
        ),
      ),
    );
  }
}
