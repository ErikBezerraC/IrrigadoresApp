import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';


class Relatorios extends StatefulWidget {
  const Relatorios({super.key});

  @override
  State<Relatorios> createState() => _RelatoriosState();
}

class _RelatoriosState extends State<Relatorios> {
  List<double> consumoMes = [
    18,
    22,
    15,
    28,
    25,
    30,
    20,
    24,
    19,
    27,
    23,
    29,
    21,
    26,
    18,
    31,
    22,
    28,
    24,
    30,
    17,
    25,
    20,
    29,
    23,
    27,
    19,
    32,
    26,
    21,
  ];

  List<double> consumoAno = [
    550, // Janeiro
    620, // Fevereiro
    710, // Março
    680, // Abril
    750, // Maio
    820, // Junho
    900, // Julho
    870, // Agosto
    790, // Setembro
    720, // Outubro
    650, // Novembro
    590, // Dezembro
  ];

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
                    "Relatórios",
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

      body:Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: ListView(
            children: [
              Center(
                child: Container(
                  width: 360,
                  height: 100,
                  decoration: BoxDecoration(
                    color: const Color(0xff7a9b6e),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Padding(
                        padding: const EdgeInsets.only(top: 5, left: 5),
                        child: Text(
                          'Último consumo',
                          style: const TextStyle(
                            color: Color(0xffdcdcdc),
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                      ),

                      SizedBox(height: 20,),

                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 5, left: 15),
                            child: Text(
                              '20 L',
                              style: const TextStyle(
                                color: Color(0xffdcdcdc),
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                          ),

                          SizedBox(width: 10,),

                          Icon(Icons.water_drop_sharp,color: Color(
                              0xffa5c994), size: 18,),

                          SizedBox(width: 190,),

                          Text(
                            '18:26',
                            style: const TextStyle(
                              color: Color(0xffdcdcdc),
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          SizedBox(width: 10,),

                          Icon(Icons.timelapse,color: Color(
                              0xffa5c994), size: 18,),
                        ],
                      )

                    ],
                  ),
                ),
              ),

              SizedBox(height: 20,),

              Center(
                child: Container(
                  width: 360,
                  height: 290,
                  decoration: BoxDecoration(
                    color: const Color(0xff7a9b6e),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Padding(
                          padding: const EdgeInsets.only(top: 5, left: 5),
                          child: Text(
                            'Consumo do mês',
                            style: const TextStyle(
                              color: Color(0xffdcdcdc),
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                        ),

                        SizedBox(height: 12,),

                        //começo do gráfico
                        SizedBox(
                          height: 200,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,

                            child: SizedBox(
                              width: 800,

                              child: Padding(
                                padding: const EdgeInsets.only(left: 20, right: 25,top: 10),

                                child: LineChart(
                                  LineChartData(

                                    gridData: const FlGridData(
                                      show: true,
                                    ),

                                    titlesData: FlTitlesData(

                                      bottomTitles: AxisTitles(
                                        sideTitles: SideTitles(
                                          showTitles: true,
                                          interval: 1,

                                          getTitlesWidget: (value, meta) {
                                            return Text(
                                              '${value.toInt() + 1}',
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 13,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            );
                                          },
                                        ),
                                      ),

                                      leftTitles: AxisTitles(
                                        axisNameWidget: const Text(
                                          'Litros (L)',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        axisNameSize: 20,

                                        sideTitles: SideTitles(
                                          showTitles: true,
                                          interval: 3,
                                          reservedSize: 45,

                                          getTitlesWidget: (value, meta) {
                                            return Text(
                                              '${value.toInt()}',
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 13,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            );
                                          },
                                        ),
                                      ),

                                      topTitles: const AxisTitles(
                                        sideTitles: SideTitles(
                                          showTitles: false,
                                        ),
                                      ),

                                      rightTitles: const AxisTitles(
                                        sideTitles: SideTitles(
                                          showTitles: false,
                                        ),
                                      ),
                                    ),

                                    lineBarsData: [
                                      LineChartBarData(
                                        spots: List.generate(
                                          consumoMes.length,
                                              (index) => FlSpot(
                                              index.toDouble(),
                                              consumoMes[index]
                                          ),
                                        ),

                                        isCurved: true,
                                        barWidth: 3,
                                        color: Colors.white,

                                        dotData: const FlDotData(
                                          show: true,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),

                        SizedBox(height: 10,),

                        Padding(
                          padding: const EdgeInsets.only(top: 5, left: 5),
                          child: Text('Consumo total: '+consumoTotal(consumoMes)+' L',style: const TextStyle(
                            color: Color(0xffdcdcdc),
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                          ),
                        )
                      ]
                  ),
                ),
              ),

              SizedBox(height: 20,),

              Center(
                child: Container(
                  width: 360,
                  height: 290,
                  decoration: BoxDecoration(
                    color: const Color(0xff7a9b6e),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Padding(
                          padding: const EdgeInsets.only(top: 5, left: 5),
                          child: Text(
                            'Consumo do ano',
                            style: const TextStyle(
                              color: Color(0xffdcdcdc),
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                        ),

                        SizedBox(height: 12,),

                        //começo do gráfico
                        SizedBox(
                          height: 200,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,

                            child: SizedBox(
                              width: 600,

                              child: Padding(
                                padding: const EdgeInsets.only(left: 20, right: 25,top: 10),

                                child: LineChart(
                                  LineChartData(

                                    gridData: const FlGridData(
                                      show: true,
                                    ),

                                    titlesData: FlTitlesData(

                                      bottomTitles: AxisTitles(
                                        sideTitles: SideTitles(
                                          showTitles: true,
                                          interval: 1,

                                          getTitlesWidget: (value, meta) {
                                            return Text(
                                              '${value.toInt() + 1}',
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 13,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            );
                                          },
                                        ),
                                      ),

                                      leftTitles: AxisTitles(
                                        axisNameWidget: const Text(
                                          'Litros (L)',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        axisNameSize: 20,

                                        sideTitles: SideTitles(
                                          showTitles: true,
                                          interval: 50,
                                          reservedSize: 45,

                                          getTitlesWidget: (value, meta) {
                                            return Text(
                                              '${value.toInt()}',
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 13,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            );
                                          },
                                        ),
                                      ),

                                      topTitles: const AxisTitles(
                                        sideTitles: SideTitles(
                                          showTitles: false,
                                        ),
                                      ),

                                      rightTitles: const AxisTitles(
                                        sideTitles: SideTitles(
                                          showTitles: false,
                                        ),
                                      ),
                                    ),

                                    lineBarsData: [
                                      LineChartBarData(
                                        spots: List.generate(
                                          consumoAno.length,
                                              (index) => FlSpot(
                                              index.toDouble(),
                                              consumoAno[index]
                                          ),
                                        ),

                                        isCurved: true,
                                        barWidth: 3,
                                        color: Colors.white,

                                        dotData: const FlDotData(
                                          show: true,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),

                        SizedBox(height: 10,),

                        Padding(
                          padding: const EdgeInsets.only(top: 5, left: 5),
                          child: Text('Consumo total: '+consumoTotal(consumoAno)+' L',style: const TextStyle(
                            color: Color(0xffdcdcdc),
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                          ),
                        ),
                      ]
                  ),
                ),
              ),

              SizedBox(height: 20,),

              Center(
                child: Container(
                  width: 360,
                  height: 60,
                  decoration: BoxDecoration(
                    color: const Color(0xff7a9b6e),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: containerRela(
                      'Histórico de Consumo',
                      Icons.access_time_outlined,
                          (){

                          }

                  )
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}

consumoTotal(List<double> lista){
  double total=0;

  for(int i = 0; i < lista.length; i++){
    total += lista[i];
  }

  return total.toString();
}

Widget containerRela(
    String text,
    IconData icon,
    VoidCallback onTap,
    ) {
  return ListTile(
    onTap: onTap,
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
    trailing: const Icon(
      Icons.arrow_forward_ios,
      color: Colors.white,
      size: 18,
    ),
  );
}
