import 'package:flutter/material.dart';
import 'package:imc_calculator/widgets/inputs/drop_down_field.dart';
import 'package:imc_calculator/widgets/inputs/height_form_field.dart';
import 'package:imc_calculator/widgets/bars/main_appbar.dart';
import 'package:imc_calculator/widgets/inputs/weight_form_field.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();
  final _weightController = TextEditingController();
  final _heightController = TextEditingController();

  Text _imcTable(double? value) {
    if (value == null) {
      return Text("");
    }
    if (value < 16) {
      return Text("Severe Thinnes");
    } else if (value < 17) {
      return Text("Moderated Thinnes");
    } else if (value < 18.5) {
      return Text("Light Thinnes");
    } else if (value < 25) {
      return Text("Healthy"); 
    } else if (value < 30) {
      return Text("Overweight");
    } else if (value < 35) {
      return Text("Grade I Obesity");
    } else if (value < 40) {
      return Text("Grade II Obesity");
    } else {
      return Text("Grade III Obesity");
    }
  }

  var myImc = "";
  var _weigthUnit = "kg";
  var _heighUnit = "m";

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      var weight = double.parse(_weightController.text);
      var height = double.parse(_heightController.text);

      // print((height, weight));
      if (_heighUnit == "cm") {
        height /= 100;
      }

      if (_weigthUnit == "g") {
        weight /= 1000;
      }
      // print((height, weight));

      setState(() {
        myImc = (weight / (height * height)).toStringAsFixed(2);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
      body: Center(
        child: Form(
          key: _formKey,
          child: Card(
            color: Theme.of(context).cardColor,
            elevation: 3,
            margin: EdgeInsets.all(20),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: HeightFormField(
                          controller: _heightController,
                          labelText: "Insert your Height",
                        ),
                      ),
                      SizedBox(
                        width: 70,
                        child: DropDownField(
                          value: _heighUnit,
                          valuesList: ["m", "cm"],
                          onChange: (value) {
                            setState(() {
                              if (value != null) _heighUnit = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 30),

                  Row(
                    children: [
                      Expanded(
                        child: WeightFormField(
                          controller: _weightController,
                          labelText: "Insert yout Weigth",
                        ),
                      ),
                      SizedBox(
                        width: 70,
                        child: DropDownField(
                          value: _weigthUnit,
                          valuesList: ["kg", "g"],
                          onChange: (value) {
                            setState(() {
                              if (value != null) _weigthUnit = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 30),

                  Offstage(
                    offstage: myImc.isEmpty,
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(25),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            _imcTable(double.tryParse(myImc)),
                            Text("Your IMC is: $myImc"),
                          ],
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 30),

                  MaterialButton(
                    onPressed: _submitForm,
                    color: Theme.of(context).primaryColor,
                    child: Text("Confirm"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
