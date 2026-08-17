import 'package:flutter/material.dart';

class Notificacao extends StatefulWidget {
  String not;
  String hora;

  Notificacao({super.key, required this.not, required this.hora});

  @override
  State<Notificacao> createState() => _NotificacaoState();
}

class _NotificacaoState extends State<Notificacao> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 340,
      height: 100,
      decoration: BoxDecoration(
        color: const Color(0xff85a977),
        borderRadius: BorderRadius.circular(15),
      ),
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: const EdgeInsets.only(top: 5, left: 5),
            child: Row(
              children: [
                Text(
                  'IrrigaApp  ',
                  style: const TextStyle(
                    color: Color(0xffdcdcdc),
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                Icon(Icons.circle,size: 6,color: Colors.white,),

                Text(
                  '  '+widget.hora,
                  style: const TextStyle(
                    color: Color(0xffdcdcdc),
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(width: 165,),

                Icon(Icons.notifications_active_outlined,size: 20,color: Colors.white,),

              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 5, left: 13),
            child: Row(
              children: [
                Text(
                  widget.not,
                  style: const TextStyle(
                    color: Color(0xffdcdcdc),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          )


        ],
      ),
    );
  }
}
