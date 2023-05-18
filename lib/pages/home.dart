import 'package:despesas_app/controller/home_controller.dart';
import 'package:despesas_app/model/entities/despesa.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../core/formater_utils.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final _controller = HomeController();

  Color _corDespesa(TipoDespesa tipo) {
    switch (tipo) {
      case TipoDespesa.ALIMENTACAO:
        return Colors.red;
      case TipoDespesa.LAZER:
        return Colors.green;
      case TipoDespesa.TRANSPORTE:
        return Colors.blue;
      case TipoDespesa.SERVICOS:
        return Colors.amber;
      case TipoDespesa.OUTROS:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Despesas"),
      ),
      body: ListView.builder(
        itemCount: _controller.despesas.length,
        itemBuilder: (ctx, index) {
          final despesa = _controller.despesas[index];
          return Card(
            elevation: 3.0,
            child: ListTile(
              leading: Container(
                height: 30,
                width: 80,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: _corDespesa(despesa.tipo),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Text("R\$${despesa.valor.toStringAsFixed(2)}"),
              ),
              title: Text(despesa.titulo),
              subtitle: Text(DateFormat().toBR(despesa.data)),
              trailing: Text("${despesa.tipo.texto}"),
            ),
          );
        },
      ),
    );
  }
}
