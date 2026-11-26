import 'package:flutter/material.dart';
import 'package:irrigadorapp/Telas/config/config_irrigador.dart';
import 'package:irrigadorapp/db/irrigador_dao.dart';
import 'package:irrigadorapp/domain/irrigador.dart';

class Irrigadores extends StatefulWidget {
  const Irrigadores({super.key});

  @override
  State<Irrigadores> createState() => _IrrigadoresState();
}

class _IrrigadoresState extends State<Irrigadores> {
  final IrrigadorDao _dao = IrrigadorDao();

  Future<void> _abrirConfig({Irrigador? existente}) async {
    final resultado = await Navigator.push<Map<String, dynamic>>(
      context,
      MaterialPageRoute(
        builder: (_) => ConfigIrrigador(irrigadorExistente: existente),
      ),
    );

    if (resultado == null) return;

    setState(() {
      if (existente == null) {
        _dao.criar(
          nome: resultado["nome"],
          tipoFuncionamento: resultado["tipo"],
          horarios: List<TimeOfDay>.from(resultado["horarios"]),
          umidadeLimite: (resultado["umidadeLimite"] as num).toDouble(),
        );
      } else {
        existente.nome = resultado["nome"];
        existente.tipoFuncionamento = resultado["tipo"];
        existente.horarios = List<TimeOfDay>.from(resultado["horarios"]);
        existente.umidadeLimite = (resultado["umidadeLimite"] as num).toDouble();
        _dao.atualizar(existente);
      }
    });
  }

  String _formatarUltima(DateTime? d) {
    if (d == null) return "Nunca irrigado";
    return "${d.day.toString().padLeft(2, '0')}/${d.month.toString().padLeft(2, '0')} "
        "${d.hour.toString().padLeft(2, '0')}:${d.minute.toString().padLeft(2, '0')}";
  }

  @override
  Widget build(BuildContext context) {
    final irrigadores = _dao.todos;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff87a277),
        title: Center(
          child: Container(
            width: 350,
            height: 50,
            decoration: BoxDecoration(
              color: const Color(0xffa5c994),
              borderRadius: BorderRadius.circular(15),
            ),
            child: const Center(
              child: Text(
                "IrrigaLegal",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
      backgroundColor: const Color(0xff87a277),
      body: irrigadores.isEmpty
          ? const Center(
              child: Text(
                "Nenhum irrigador configurado.\nToque em + para adicionar.",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: irrigadores.length,
              itemBuilder: (_, i) => _cardIrrigador(irrigadores[i]),
            ),
      floatingActionButton: SizedBox(
        width: 70,
        height: 70,
        child: FloatingActionButton(
          onPressed: () => _abrirConfig(),
          backgroundColor: Colors.white,
          child: const Icon(Icons.add, color: Color(0xff6c9358), size: 32),
        ),
      ),
    );
  }

  Widget _cardIrrigador(Irrigador irr) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xffa5c994),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Linha superior: nome + engrenagem
          Row(
            children: [
              Expanded(
                child: Text(
                  irr.nome,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.settings, color: Colors.white),
                onPressed: () => _abrirConfig(existente: irr),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Coluna esquerda: última irrigação + anel de umidade
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Última irrigação:",
                      style: TextStyle(color: Colors.white.withOpacity(0.85), fontSize: 13),
                    ),
                    Text(
                      _formatarUltima(irr.ultimaIrrigacao),
                      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        _anelUmidade(irr.umidadeAtual),
                        const SizedBox(width: 12),
                        const Text("Umidade", style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ],
                ),
              ),
              // Placeholder da planta (direita)
              Expanded(
                flex: 2,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.35),
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.white.withOpacity(0.6), width: 2),
                    ),
                    child: const Center(
                      child: Icon(Icons.local_florist, size: 48, color: Colors.white70),
                    ),
                    // Substitua o Icon por sua Image.asset(...) depois
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _anelUmidade(double umidade) {
    return SizedBox(
      width: 70,
      height: 70,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: 70,
            height: 70,
            child: CircularProgressIndicator(
              value: umidade / 100,
              strokeWidth: 8,
              backgroundColor: Colors.white.withOpacity(0.35),
              valueColor: AlwaysStoppedAnimation<Color>(
                umidade > 60
                    ? Colors.blue
                    : umidade > 30
                        ? Colors.orange
                        : Colors.red,
              ),
            ),
          ),
          Text(
            "${umidade.toStringAsFixed(0)}%",
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
