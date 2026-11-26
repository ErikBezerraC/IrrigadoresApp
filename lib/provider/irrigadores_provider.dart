import 'package:irrigadorapp/domain/irrigador.dart';
import 'package:flutter/material.dart';

class IrrigadoresProvider extends ChangeNotifier {
  List<Irrigador> _irrigadores = [];
  int _nextId = 1;

  double _umidadeGlobal = 0.0;
  double get umidadeGlobal => _umidadeGlobal;

  set umidadeGlobal(double valor) {
    _umidadeGlobal = valor.clamp(0, 100);
    notifyListeners();
  }

  List<Irrigador> get irrigadores => List.unmodifiable(_irrigadores);

  Irrigador adicionarIrrigador({
    required String nome,
    required String tipoFuncionamento,
    List<TimeOfDay> horarios = const [],
    double umidadeLimite = 30,
  }) {
    final novo = Irrigador(
      id: _nextId++,
      nome: nome,
      tipoFuncionamento: tipoFuncionamento,
      horarios: horarios,
      umidadeLimite: umidadeLimite,
      umidadeAtual: _umidadeGlobal,
    );
    _irrigadores.add(novo);
    notifyListeners();
    return novo;
  }

  void atualizarIrrigador(Irrigador irrigador) {
    final idx = _irrigadores.indexWhere((i) => i.id == irrigador.id);
    if (idx >= 0) {
      _irrigadores[idx] = irrigador;
      notifyListeners();
    }
  }

  void removerIrrigador(int id) {
    _irrigadores.removeWhere((i) => i.id == id);
    notifyListeners();
  }

  Irrigador? buscarPorId(int id) {
    try {
      return _irrigadores.firstWhere((i) => i.id == id);
    } catch (_) {
      return null;
    }
  }
}
