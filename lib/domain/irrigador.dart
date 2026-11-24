import 'package:flutter/material.dart';

class Irrigador{
  late int id;
  late String Irrigador_name;
  late int umidade;
  late bool estado;
  late IconData icon;
  late String tipo;
  late DateTime horario;

  Irrigador(this.id,this.Irrigador_name,this.umidade,this.estado,this.icon,this.tipo);

  Irrigador.Horario(this.id,this.Irrigador_name,this.umidade,this.estado,this.icon,this.tipo,this.horario);

  Irrigador.fromJson(Map json) {
    id = json["id"];
    Irrigador_name = json["Irrigador_name"];
    umidade = json["umidade"];
    estado = json["estado"];
    icon = IconData(
      json["icon"],
      fontFamily: 'MaterialIcons',
    );
    tipo = json["tipo"];

    if (json["horario"] != null) {
      horario = DateTime.parse(json["horario"]);
    }
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};

    json["id"] = id;
    json["Irrigador_name"] = Irrigador_name;
    json["umidade"] = umidade;
    json["estado"] = estado;
    json["icon"] = icon.codePoint;
    json["tipo"] = tipo;
    json["horario"] = horario.toIso8601String();

    return json;
  }
}