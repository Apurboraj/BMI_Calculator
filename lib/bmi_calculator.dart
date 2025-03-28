import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Import for input formatter
import 'helper/bmi_chart_helper.dart';
import 'helper/bmi_meter_helper.dart';

class BmiCalculator extends StatefulWidget {
  const BmiCalculator({super.key});

  @override
  State<BmiCalculator> createState() => _BmiCalculatorState();
}

class _BmiCalculatorState extends State<BmiCalculator> {
  TextEditingController ageController = TextEditingController();
  TextEditingController feetController = TextEditingController();
  TextEditingController inchController = TextEditingController();
  TextEditingController weightController = TextEditingController();

  double? ans;
  bool changeMaleGenderColor = false;
  bool changeFemaleGenderColor = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('BMI Calculator'),
        elevation: 4,
        actions: [
          IconButton(
            onPressed: () {
              dispose();
            },
            icon: const Icon(Icons.replay_outlined),
          ),
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.more_vert_rounded)),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              inputArea(),
              bmiChart(ans),
              const SizedBox(height: 10),
              const Text(
                'Normal Weight :  117.9 - 159.4 lb',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    letterSpacing: 0.2,
                    color: Colors.redAccent),
              )
            ],
          ),
        ),
      ),
    );
  }

  Column inputArea() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: ageController,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: const InputDecoration(labelText: 'Age'),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: TextFormField(
                controller: feetController,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: const InputDecoration(labelText: "Height (ft)"),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: TextFormField(
                controller: inchController,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: const InputDecoration(labelText: "Height (in)"),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        changeMaleGenderColor = true;
                        changeFemaleGenderColor = false;
                      });
                    },
                    child: Icon(
                      Icons.male,
                      color: changeMaleGenderColor ? Colors.green : Colors.black,
                      size: 28,
                    ),
                  ),
                  const SizedBox(width: 15),
                  const Text('|', style: TextStyle(fontSize: 25)),
                  const SizedBox(width: 15),
                  InkWell(
                    onTap: () {
                      setState(() {
                        changeFemaleGenderColor = true;
                        changeMaleGenderColor = false;
                      });
                    },
                    child: Icon(
                      Icons.female,
                      color: changeFemaleGenderColor ? Colors.green : Colors.black,
                      size: 28,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: TextFormField(
                controller: weightController,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: const InputDecoration(labelText: "Weight"),
              ),
            ),
            const SizedBox(width: 10),
            IconButton(
              onPressed: () {
                bmiCalculation();
              },
              icon: const Icon(Icons.done_outline_sharp),
            )
          ],
        ),
        bmiMeter(ans),
      ],
    );
  }

  void bmiCalculation() {
    double? wt = double.tryParse(weightController.text) ?? 0;
    double? ft = double.tryParse(feetController.text) ?? 0;
    double? inch = double.tryParse(inchController.text) ?? 0;

    double? meter = (ft * 12 + inch) * 0.0254;
    ans = wt / (meter * meter);
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
    ageController.clear();
    feetController.clear();
    inchController.clear();
    weightController.clear();
  }
}
