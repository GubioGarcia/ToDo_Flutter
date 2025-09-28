import 'package:flutter/material.dart';
import 'adicionarTarefa.dart';
import 'editarTarefa.dart';
import 'models/tarefa.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Tarefa> tarefas = [];

  void adicionarTarefa(Tarefa tarefa) {
    setState(() {
      tarefas.add(tarefa);
    });
  }

  void editarTarefa(int index, Tarefa tarefaAtualizada) {
    setState(() {
      tarefas[index] = tarefaAtualizada;
    });
  }

  void excluirTarefa(int index) {
    setState(() {
      tarefas.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Minhas Tarefas", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        child: Icon(Icons.add, color: Colors.white),
        onPressed: () async {
          final novaTarefa = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AdicionarTarefaPage(),
            ),
          );
          if (novaTarefa != null) adicionarTarefa(novaTarefa);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: tarefas.isEmpty
          ? Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/zeroitens.png', height: 200),
                    SizedBox(height: 32),
                    Text(
                      "O que você quer fazer hoje?",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 12),
                    Text(
                      "Toque em + para adicionar suas tarefas.",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            )
          : ListView.builder(
              padding: EdgeInsets.only(bottom: 80),
              itemCount: tarefas.length,
              itemBuilder: (context, index) {
                final tarefa = tarefas[index];
                return Card(
                  color: Colors.white,
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    title: Text(
                      tarefa.titulo,
                      style: TextStyle(color: Colors.deepPurple),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          tarefa.descricao,
                          style: TextStyle(color: Colors.deepPurple),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "${tarefa.dataHora} • Prioridade: ${tarefa.prioridade}",
                          style: TextStyle(color: Colors.deepPurple),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Categoria: ${tarefa.categoria}",
                          style: TextStyle(color: Colors.deepPurple),
                        ),
                      ],
                    ),
                    isThreeLine: true,
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit, color: Colors.deepPurple),
                          onPressed: () async {
                            final tarefaEditada = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    EditarTarefaPage(tarefa: tarefa),
                              ),
                            );
                            if (tarefaEditada != null)
                              editarTarefa(index, tarefaEditada);
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.delete, color: Colors.redAccent),
                          onPressed: () => excluirTarefa(index),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
