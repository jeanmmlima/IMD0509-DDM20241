import 'dart:math';


import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'model/tarefa.dart';

void main() {
  runApp(ToDoListApp());
}

class ToDoListApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      theme: ThemeData().copyWith(
          colorScheme: ThemeData().colorScheme.copyWith(
                primary: Colors.purple,
                secondary: Colors.amber,
              )),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Tarefa> _tarefas = [
    Tarefa(id: 't0', titulo: 'Estudar', data: DateTime.now()),
    Tarefa(id: 't1', titulo: 'Jogar', data: DateTime.now()),
  ];

  final _tarefaController = TextEditingController();

  _novaTarefa() {
    Tarefa novaTarefa = Tarefa(
        id: Random().nextInt(9999).toString(),
        titulo: _tarefaController.text,
        data: DateTime.now());

    setState(() {
      _tarefas.add(novaTarefa);
    });
    //TODO: incrementar lista de tarefas
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To Do List'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            // formulario de tarefa
            Container(
              child: Column(
                children: [
                  TextField(
                    controller: _tarefaController,
                    decoration:
                        const InputDecoration(labelText: 'nova tarefa...'),
                  ),
                  ElevatedButton(
                      onPressed: _novaTarefa, child: Text('Cadastrar tarefa'))
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            // lista de tarefas
            Container(
              height: 300,
              child: ListView.builder(
                  itemCount: _tarefas.length,
                  itemBuilder: (context, index) {
                    final tarefa = _tarefas[index];
                    return Card(
                      child: Row(
                        children: [
                          Container(
                              margin: const EdgeInsets.symmetric(
                                horizontal: 15,
                                vertical: 10,
                              ),
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                  DateFormat('dd/MM/yyyy').format(tarefa.data),
                                  style: TextStyle(
                                      color: tarefa.data.day >=
                                              DateTime.now().day
                                          ? Theme.of(context)
                                              .colorScheme
                                              .primary
                                          : Theme.of(context)
                                              .colorScheme
                                              .secondary))),
                          Text(tarefa.titulo),
                        ],
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
