import 'package:irrigadorapp/domain/irrigador.dart';

/// Variável global de umidade (usada por várias telas)
double umidadeGlobal = 0.0;

class IrrigadorDao {
  static final IrrigadorDao _instance = IrrigadorDao._internal();
  factory IrrigadorDao() => _instance;
  IrrigadorDao._internal();

  final List<Irrigador> _irrigadores = [];
  int _nextId = 1;

  List<Irrigador> get todos => List.unmodifiable(_irrigadores);

  Irrigador? buscarPorId(int id) {
    try {
      return _irrigadores.firstWhere((i) => i.id == id);
    } catch (_) {
      return null;
    }
  }

  Irrigador criar({
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
      umidadeAtual: umidadeGlobal,
    );
    _irrigadores.add(novo);
    return novo;
  }

  void atualizar(Irrigador irrigador) {
    final idx = _irrigadores.indexWhere((i) => i.id == irrigador.id);
    if (idx >= 0) _irrigadores[idx] = irrigador;
  }

  void remover(int id) {
    _irrigadores.removeWhere((i) => i.id == id);
  }
}
