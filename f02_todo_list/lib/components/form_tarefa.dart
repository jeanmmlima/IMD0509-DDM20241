import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class FormTarefa extends StatelessWidget {
  Function(String) onSubmit;
  FormTarefa(this.onSubmit);

  @override
  Widget build(BuildContext context) {
    final _tarefaController = TextEditingController();

    _submitForm() {
      if (_tarefaController.text.isEmpty) {
        return;
      }
      //passando dado para componente pai
      onSubmit(_tarefaController.text);
    }

    return Container(
      child: Column(
        children: [
          TextField(
            controller: _tarefaController,
            decoration: const InputDecoration(labelText: 'nova tarefa...'),
          ),
          ElevatedButton(
              onPressed: _submitForm, child: Text('Cadastrar tarefa'))
        ],
      ),
    );
  }
}
