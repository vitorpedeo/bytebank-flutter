import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Transferências'),
        ),
        body: ListaTransferencias(),
        floatingActionButton: const FloatingActionButton(
          onPressed: null,
          child: Icon(Icons.add),
        ),
      ),
    ),
  );
}

class ListaTransferencias extends StatelessWidget {
  const ListaTransferencias({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const <Widget>[
        ItemTransferencia(
          transferencia: Transferencia(
            valor: 100,
            numeroConta: 124511,
          ),
        ),
        ItemTransferencia(
          transferencia: Transferencia(
            valor: 200,
            numeroConta: 637129,
          ),
        ),
        ItemTransferencia(
          transferencia: Transferencia(
            valor: 350,
            numeroConta: 988124,
          ),
        ),
      ],
    );
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia transferencia;

  const ItemTransferencia({Key? key, required this.transferencia})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(
          Icons.monetization_on,
          size: 40,
        ),
        title: Text(transferencia.valor.toString()),
        subtitle: Text(transferencia.numeroConta.toString()),
      ),
    );
  }
}

class Transferencia {
  final double valor;
  final int numeroConta;

  const Transferencia({required this.valor, required this.numeroConta});
}
