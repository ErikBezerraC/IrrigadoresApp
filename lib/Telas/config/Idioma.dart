import 'package:flutter/material.dart';

class Idioma extends StatefulWidget {
  const Idioma({super.key});

  @override
  State<Idioma> createState() => _IdiomaState();
}

class _IdiomaState extends State<Idioma> {
  String idiomaSelecionado = 'Português';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xff87a277),
        title: Container(
          width: 350,
          height: 50,
          decoration: BoxDecoration(
            color: const Color(0xffa5c994),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back, color: Colors.white),
              ),

              const Expanded(
                child: Center(
                  child: Text(
                    "Idioma",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(width: 48), // Equilibra o espaço da seta
            ],
          ),
        ),
      ),

      backgroundColor: Color(0xff87a277),

      body: Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Container(
            width: 360,
            height: 411,
            decoration: BoxDecoration(
              color: const Color(0xff7a9b6e),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                containerIdioma(
                  'Português',
                  'Português',
                  Icons.language,
                  idiomaSelecionado,
                      (valor) {
                    setState(() {
                      idiomaSelecionado = valor!;
                    });
                  },
                ),

                linha(),

                containerIdioma(
                  'English',
                  'English',
                  Icons.language,
                  idiomaSelecionado,
                      (valor) {
                    setState(() {
                      idiomaSelecionado = valor!;
                    });
                  },
                ),

                linha(),

                containerIdioma(
                  'Espanhol',
                  'Espanhol',
                  Icons.language,
                  idiomaSelecionado,
                      (valor) {
                    setState(() {
                      idiomaSelecionado = valor!;
                    });
                  },
                ),

                linha(),

                containerIdioma(
                  'Françes',
                  'Françes',
                  Icons.language,
                  idiomaSelecionado,
                      (valor) {
                    setState(() {
                      idiomaSelecionado = valor!;
                    });
                  },
                ),

                linha(),

                containerIdioma(
                  'Russo',
                  'Russo',
                  Icons.language,
                  idiomaSelecionado,
                      (valor) {
                    setState(() {
                      idiomaSelecionado = valor!;
                    });
                  },
                ),

                linha(),

                containerIdioma(
                  'Alemão',
                  'Alemão',
                  Icons.language,
                  idiomaSelecionado,
                      (valor) {
                    setState(() {
                      idiomaSelecionado = valor!;
                    });
                  },
                ),
              ],
            )
          ),
        ),
      ),
    );
  }
}

Widget containerIdioma(
    String text,
    String valor,
    IconData icon,
    String? idiomaSelecionado,
    Function(String?) onChanged,
    ) {
  return ListTile(
    onTap: () {
      onChanged(valor);
    },

    leading: Icon(
      icon,
      color: Colors.white,
    ),

    title: Text(
      text,
      style: const TextStyle(
        color: Color(0xffdcdcdc),
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
    ),

    trailing: Radio<String>(
      value: valor,
      groupValue: idiomaSelecionado,
      fillColor: WidgetStateProperty.resolveWith<Color>((states) {
        if (states.contains(WidgetState.selected)) {
          return Colors.white; // selecionado
        }

        return const Color(0xff506448); // não selecionado
      }),
      onChanged: onChanged,
    ),
  );
}

linha() {
  return Text(
    "___________________________________________________________________________________",
    style: TextStyle(
      color: Color(0xff5d7755),
      fontWeight: FontWeight.bold,
      fontSize: 9,
    ),
  );
}
