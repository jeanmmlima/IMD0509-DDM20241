import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FormTarefa extends StatefulWidget {
  Function(String, DateTime) onSubmit;
  FormTarefa(this.onSubmit);

  @override
  State<FormTarefa> createState() => _FormTarefaState();
}

class _FormTarefaState extends State<FormTarefa> {

  final _tarefaController = TextEditingController();
  DateTime _dataSelecionada = DateTime.now();

  @override
  Widget build(BuildContext context) {

    _submitForm() {
      final titulo = _tarefaController.text;
      if (_tarefaController.text.isEmpty) {
        return;
      }
      //passando dado para componente pai
      widget.onSubmit(titulo, _dataSelecionada);
    }

    _showDatePicker() {
      showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2024),
              lastDate: DateTime(2025))
          .then((pickedDate) {
        if (pickedDate == null) {
          return;
        }
        setState(() {
          _dataSelecionada = pickedDate;
        });
      });
    }

    return Container(
      child: Column(
        children: [
          TextField(
            controller: _tarefaController,
            decoration: const InputDecoration(labelText: 'nova tarefa...'),
          ),
          Container(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                      'Data selecionada ${DateFormat('dd/MM/yyyy').format(_dataSelecionada)}'),
                ),
                TextButton(
                    onPressed: _showDatePicker, child: Text('Selecionar data'))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                onPressed: _submitForm, child: Text('Cadastrar tarefa')),
          )
        ],
      ),
    );
  }
}
