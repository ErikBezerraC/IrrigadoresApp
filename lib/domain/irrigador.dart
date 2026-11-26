import 'package:flutter/material.dart';

class Irrigador {
  int id;
  String nome;
  String tipoFuncionamento; // "horario" ou "umidade"
  List<TimeOfDay> horarios; // usado quando tipo == "horario"
  double umidadeLimite; // usado quando tipo == "umidade"
  double umidadeAtual;
  DateTime? ultimaIrrigacao;
  bool estado;

  Irrigador({
    required this.id,
    required this.nome,
    required this.tipoFuncionamento,
    this.horarios = const [],
    this.umidadeLimite = 30,
    this.umidadeAtual = 0,
    this.ultimaIrrigacao,
    this.estado = false,
  });

  Map<String, dynamic> toJson() => {
        "id": id,
        "nome": nome,
        "tipoFuncionamento": tipoFuncionamento,
        "horarios": horarios
            .map((h) => "${h.hour.toString().padLeft(2, '0')}:${h.minute.toString().padLeft(2, '0')}")
            .toList(),
        "umidadeLimite": umidadeLimite,
        "umidadeAtual": umidadeAtual,
        "ultimaIrrigacao": ultimaIrrigacao?.toIso8601String(),
        "estado": estado,
      };

  factory Irrigador.fromJson(Map<String, dynamic> json) {
    List<TimeOfDay> hs = [];
    if (json["horarios"] != null) {
      for (var h in json["horarios"]) {
        final parts = (h as String).split(":");
        hs.add(TimeOfDay(hour: int.parse(parts[0]), minute: int.parse(parts[1])));
      }
    }
    return Irrigador(
      id: json["id"] ?? 0,
      nome: json["nome"] ?? "",
      tipoFuncionamento: json["tipoFuncionamento"] ?? "umidade",
      horarios: hs,
      umidadeLimite: (json["umidadeLimite"] ?? 30).toDouble(),
      umidadeAtual: (json["umidadeAtual"] ?? 0).toDouble(),
      ultimaIrrigacao: json["ultimaIrrigacao"] != null
          ? DateTime.parse(json["ultimaIrrigacao"])
          : null,
      estado: json["estado"] ?? false,
    );
  }
}
