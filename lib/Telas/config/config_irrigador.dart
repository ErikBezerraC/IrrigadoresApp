import 'package:flutter/material.dart';
import 'package:irrigadorapp/domain/irrigador.dart';

class ConfigIrrigador extends StatefulWidget {
  final Irrigador? irrigadorExistente;

  const ConfigIrrigador({super.key, this.irrigadorExistente});

  @override
  State<ConfigIrrigador> createState() => _ConfigIrrigadorState();
}

class _ConfigIrrigadorState extends State<ConfigIrrigador> {
  final _nomeController = TextEditingController();
  String _tipo = "horario"; // "horario" ou "umidade"
  final List<TimeOfDay> _horarios = [];
  double _umidadeLimite = 30;

  @override
  void initState() {
    super.initState();
    if (widget.irrigadorExistente != null) {
      final i = widget.irrigadorExistente!;
      _nomeController.text = i.nome;
      _tipo = i.tipoFuncionamento;
      _horarios.addAll(i.horarios);
      _umidadeLimite = i.umidadeLimite;
    }
  }

  Future<void> _adicionarHorario() async {
    final t = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (t != null) {
      setState(() => _horarios.add(t));
    }
  }

  void _confirmar() {
    if (_nomeController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Informe um nome para o irrigador")),
      );
      return;
    }
    if (_tipo == "horario" && _horarios.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Defina pelo menos um horário")),
      );
      return;
    }

    final resultado = {
      "nome": _nomeController.text.trim(),
      "tipo": _tipo,
      "horarios": _horarios,
      "umidadeLimite": _umidadeLimite,
    };

    Navigator.pop(context, resultado);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff87a277),
      appBar: AppBar(
        backgroundColor: const Color(0xff87a277),
        title: const Text("Configurar Irrigador", style: TextStyle(color: Colors.white)),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _card(
            child: TextField(
              controller: _nomeController,
              decoration: const InputDecoration(
                labelText: "Nome do irrigador",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          const SizedBox(height: 16),
          _card(
            child: Column(
              children: [
                RadioListTile<String>(
                  title: const Text("Por horário"),
                  value: "horario",
                  groupValue: _tipo,
                  onChanged: (v) => setState(() => _tipo = v!),
                ),
                RadioListTile<String>(
                  title: const Text("Por umidade"),
                  value: "umidade",
                  groupValue: _tipo,
                  onChanged: (v) => setState(() => _tipo = v!),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          if (_tipo == "horario")
            _card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Horários de irrigação", style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  ..._horarios.map((h) => ListTile(
                        dense: true,
                        leading: const Icon(Icons.access_time),
                        title: Text("${h.hour.toString().padLeft(2, '0')}:${h.minute.toString().padLeft(2, '0')}"),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () => setState(() => _horarios.remove(h)),
                        ),
                      )),
                  TextButton.icon(
                    onPressed: _adicionarHorario,
                    icon: const Icon(Icons.add),
                    label: const Text("Adicionar horário"),
                  ),
                ],
              ),
            ),
          if (_tipo == "umidade")
            _card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Umidade mínima: ${_umidadeLimite.toStringAsFixed(0)}%"),
                  Slider(
                    value: _umidadeLimite,
                    min: 0,
                    max: 100,
                    divisions: 100,
                    label: "${_umidadeLimite.toStringAsFixed(0)}%",
                    onChanged: (v) => setState(() => _umidadeLimite = v),
                  ),
                ],
              ),
            ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: _confirmar,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xff6c9358),
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
            child: const Text("Confirmar", style: TextStyle(color: Colors.white, fontSize: 18)),
          ),
        ],
      ),
    );
  }

  Widget _card({required Widget child}) => Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xffa5c994),
          borderRadius: BorderRadius.circular(15),
        ),
        child: child,
      );
}
