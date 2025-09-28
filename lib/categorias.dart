import 'package:flutter/material.dart';
import 'editarCategoria.dart';
import 'criarCategoria.dart';

class CategoriasPage extends StatefulWidget {
  const CategoriasPage({super.key});

  @override
  State<CategoriasPage> createState() => _CategoriasPageState();
}

class _CategoriasPageState extends State<CategoriasPage> {
  List<Map<String, dynamic>> categorias = [
    {"nome": "Pessoal", "cor": Colors.deepPurple},
    {"nome": "Trabalho", "cor": Colors.blue},
    {"nome": "Estudos", "cor": Colors.green},
    {"nome": "Saúde", "cor": Colors.red},
  ];

  void adicionarCategoria(Map<String, dynamic> novaCategoria) {
    setState(() {
      categorias.add(novaCategoria);
    });
  }

  void editarCategoria(int index, Map<String, dynamic> categoriaAtualizada) {
    setState(() {
      categorias[index] = categoriaAtualizada;
    });
  }

  void excluirCategoria(int index) {
    setState(() {
      categorias.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Categorias", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      backgroundColor: Colors.black,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        child: Icon(Icons.add, color: Colors.white),
        onPressed: () async {
          final resultado = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CriarCategoriaPage()),
          );
          if (resultado is Map<String, dynamic>) {
            adicionarCategoria(resultado);
          }
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: categorias.isEmpty
          ? Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.category, size: 100, color: Colors.white24),
                    SizedBox(height: 32),
                    Text(
                      "Nenhuma categoria criada.",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 12),
                    Text(
                      "Toque em + para adicionar uma nova categoria.",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            )
          : ListView.builder(
              padding: EdgeInsets.only(bottom: 80),
              itemCount: categorias.length,
              itemBuilder: (context, index) {
                final categoria = categorias[index];
                return Card(
                  color: Colors.white,
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: categoria['cor'],
                      child: Text(
                        categoria['nome'][0],
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    title: Text(
                      categoria['nome'],
                      style: TextStyle(color: Colors.deepPurple),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit, color: Colors.deepPurple),
                          onPressed: () async {
                            final resultado = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    EditarCategoriaPage(categoria: categoria),
                              ),
                            );
                            if (resultado is Map<String, dynamic>) {
                              editarCategoria(index, resultado);
                            }
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.delete, color: Colors.redAccent),
                          onPressed: () => excluirCategoria(index),
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
