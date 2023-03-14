import 'package:flutter/material.dart';

onYes(String id) {}

onNo() {}

showDeleteConfirmationDialog(context) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('¿Eliminar elemento?'),
        content: SingleChildScrollView(
          child: ListBody(
            children: [
              Text('¿Está seguro de que desea eliminar este elemento?'),
            ],
          ),
        ),
        actions: [
          TextButton(
            child: Text('Cancelar'),
            onPressed: () {},
          ),
          TextButton(
            child: Text('Eliminar'),
            onPressed: () {},
          ),
        ],
      );
    },
  );
}
