import 'dart:math';


import 'package:flutter/material.dart';

import 'components/form_tarefa.dart';
import 'components/lista_tarefa.dart';
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

  _novaTarefa(String tarefa, DateTime data) {
    Tarefa novaTarefa = Tarefa(
        id: Random().nextInt(9999).toString(), titulo: tarefa, data: data);

    setState(() {
      _tarefas.add(novaTarefa);
    });
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

            FormTarefa(_novaTarefa),
            const SizedBox(
              height: 20,
            ),
            // lista de tarefas
            ListaTarefa(listaTarefas: _tarefas),
          ],
        ),
      ),
    );
  }
}
