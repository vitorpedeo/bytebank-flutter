import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const BytebankApp());
}

class BytebankApp extends StatelessWidget {
  const BytebankApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: ListaTransferencias());
  }
}

class FormularioTransferencia extends StatelessWidget {
  final TextEditingController _controladorCampoNumeroConta =
      TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  FormularioTransferencia({Key? key}) : super(key: key);

  void _criaTransferencia(BuildContext ctx) {
    final int? numeroConta = int.tryParse(_controladorCampoNumeroConta.text);
    final double? valor = double.tryParse(_controladorCampoValor.text);

    if (numeroConta != null && valor != null) {
      final Transferencia transferenciaCriada =
          Transferencia(numeroConta: numeroConta, valor: valor);

      ScaffoldMessenger.of(ctx).showSnackBar(
        SnackBar(
          content: Text(
            transferenciaCriada.toString(),
          ),
        ),
      );

      Navigator.pop(ctx, transferenciaCriada);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Criando Transferência'),
      ),
      body: Column(
        children: <Widget>[
          Editor(
            controlador: _controladorCampoNumeroConta,
            rotulo: 'Número da conta',
            dica: '00000',
          ),
          Editor(
            controlador: _controladorCampoValor,
            rotulo: 'Valor',
            dica: '0.00',
            icone: Icons.monetization_on,
          ),
          ElevatedButton(
            onPressed: () => _criaTransferencia(context),
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

class Editor extends StatelessWidget {
  final TextEditingController controlador;
  final String rotulo;
  final String dica;
  final IconData? icone;

  const Editor(
      {Key? key,
      required this.controlador,
      required this.rotulo,
      required this.dica,
      this.icone})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: TextField(
        controller: controlador,
        keyboardType: TextInputType.number,
        style: const TextStyle(fontSize: 24),
        decoration: InputDecoration(
          icon: icone != null ? Icon(icone) : null,
          labelText: rotulo,
          hintText: dica,
        ),
      ),
    );
  }
}

class ListaTransferencias extends StatelessWidget {
  final List<Transferencia?> _transferencias = [];

  ListaTransferencias({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transferências'),
      ),
      body: ListView.builder(
        itemCount: _transferencias.length,
        itemBuilder: (context, index) {
          return ItemTransferencia(transferencia: _transferencias[index]);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final Future<Transferencia?> future =
              Navigator.push(context, MaterialPageRoute(builder: (context) {
            return FormularioTransferencia();
          }));

          future.then((transferenciaRecebida) {
            _transferencias.add(transferenciaRecebida);
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia? transferencia;

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
        title: Text(transferencia?.valor.toString() ?? ''),
        subtitle: Text(transferencia?.numeroConta.toString() ?? ''),
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
