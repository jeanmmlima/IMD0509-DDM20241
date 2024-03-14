// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';


import 'package:intl/intl.dart';

import '../model/tarefa.dart';

class ListaTarefa extends StatelessWidget {
  List<Tarefa> listaTarefas;

  ListaTarefa({
    required this.listaTarefas,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
          itemCount: listaTarefas.length,
          itemBuilder: (context, index) {
            final tarefa = listaTarefas[index];
            return Card(
              child: Row(
                children: [
                  Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 10,
                      ),
                      padding: const EdgeInsets.all(10),
                      child: Text(DateFormat('dd/MM/yyyy').format(tarefa.data),
                          style: TextStyle(
                              color: tarefa.data.day >= DateTime.now().day
                                  ? Theme.of(context).colorScheme.primary
                                  : Theme.of(context).colorScheme.secondary))),
                  Text(tarefa.titulo),
                ],
              ),
            );
          }),
    );
  }
}
