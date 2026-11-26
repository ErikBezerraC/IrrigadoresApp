import 'package:irrigadorapp/domain/irrigador.dart';

class IrrigadorDao {
  static final IrrigadorDao _instance = IrrigadorDao._internal();
  factory IrrigadorDao() => _instance;
  IrrigadorDao._internal();

  final List<Irrigador> _irrigadores = [];

  List<Irrigador> get todos => List.unmodifiable(_irrigadores);

  void salvar(Irrigador irrigador) {
    final idx = _irrigadores.indexWhere((i) => i.id == irrigador.id);
    if (idx >= 0) {
      _irrigadores[idx] = irrigador;
    } else {
      _irrigadores.add(irrigador);
    }
  }

  void remover(int id) => _irrigadores.removeWhere((i) => i.id == id);
}
