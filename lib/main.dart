import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const BytebankApp());
}

class BytebankApp extends StatelessWidget {
  const BytebankApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: FormularioTransferencia());
  }
}

class FormularioTransferencia extends StatelessWidget {
  final TextEditingController _controladorCampoNumeroConta =
      TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  FormularioTransferencia({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Criando Transferência'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: _controladorCampoNumeroConta,
              keyboardType: TextInputType.number,
              style: const TextStyle(fontSize: 24),
              decoration: const InputDecoration(
                  labelText: 'Número da conta', hintText: '00000'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: _controladorCampoValor,
              keyboardType: TextInputType.number,
              style: const TextStyle(fontSize: 24),
              decoration: const InputDecoration(
                  labelText: 'Valor',
                  hintText: '0.00',
                  icon: Icon(Icons.monetization_on)),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              final int? numeroConta =
                  int.tryParse(_controladorCampoNumeroConta.text);
              final double? valor =
                  double.tryParse(_controladorCampoValor.text);

              if (numeroConta != null && valor != null) {
                final Transferencia transferenciaCriada =
                    Transferencia(numeroConta: numeroConta, valor: valor);

                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(
                    transferenciaCriada.toString(),
                  ),
                ));
              }
            },
            child: const Text(
              'Confirmar',
              style: TextStyle(fontSize: 16),
            ),
          )
        ],
      ),
    );
  }
}

class ListaTransferencias extends StatelessWidget {
  const ListaTransferencias({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transferências'),
      ),
      body: Column(
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
      ),
      floatingActionButton: const FloatingActionButton(
        onPressed: null,
        child: Icon(Icons.add),
      ),
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

  @override
  String toString() {
    return 'Transferencia: { NumeroConta: $numeroConta, Valor: $valor }';
  }
}
