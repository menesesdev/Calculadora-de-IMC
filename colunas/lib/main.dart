import 'package:flutter/material.dart';

void main(List<String> args) => runApp(Myapp());

class Myapp extends StatefulWidget {
  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  //const Myapp({super.key});
  TextEditingController controllerPeso = TextEditingController();

  TextEditingController controllerAltura = TextEditingController();

  String resultadoIMC = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Calculadora de IMC'),
            //centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                TextFormField(
                  controller: controllerAltura,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Digite a sua altura - Ex : 1.75',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: controllerPeso,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Digite o seu peso - Ex : 90.3',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Resultado: ',
                      style: const TextStyle(fontWeight: FontWeight.normal),
                    ),
                    Text(
                      resultadoIMC,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 60,
                ),
                SizedBox(
                  width: 150,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        num numAux = (num.parse(controllerPeso.text) /
                            (num.parse(controllerAltura.text) *
                                num.parse(controllerAltura.text)));
                        resultadoIMC = numAux.toStringAsFixed(2);
                      });
                    },
                    child: const Text('Calcular'),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      resultadoIMC = '';
                    });
                  },
                  icon: const Icon(Icons.refresh),
                )
              ],
            ),
          )),
    );
  }
}
