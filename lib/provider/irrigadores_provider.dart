import 'package:irrigadorapp/domain/irrigador.dart';
import 'package:flutter/material.dart';

class IrrigadoresProvider extends ChangeNotifier{
  List<Irrigador> _irrigadores = [];

  List<Irrigador> get irrigadores => _irrigadores;

  addIrrigador(Irrigador irrigador) {
    // Se a propriedade não estiver na lista
    // Posso adicionar a propriedade
    if (!isFavorite(irrigador)) {
      _irrigadores.add(irrigador);
    } else {
      removeFavorite(irrigador);
    }

    notifyListeners();
  }

  removeFavorite(Irrigador irrigador) {
    for (int i = 0; i < _irrigadores.length; i++) {
      if (_irrigadores[i].id == irrigador.id) {
        _irrigadores.removeAt(i);
        break;
      }
    }
  }

  bool isFavorite(Irrigador irrigador) {
    // Procurando a propriedade na lista
    for (var prop in _irrigadores) {
      if (irrigador.id == irrigador.id) {
        return true;
      }
    }

    return false;
  }

}