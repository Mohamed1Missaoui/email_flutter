import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:email/dashborad/Prix';


class Formulaire extends StatefulWidget {
  const Formulaire({Key? key, required String title}) : super(key: key);

  @override
  State<Formulaire> createState() => _FormulaireState();
}

class _FormulaireState extends State<Formulaire> {
 final TextEditingController _firstname = TextEditingController();
 final TextEditingController _lastname = TextEditingController();
  final TextEditingController date = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  int _value = 0;
  String selectType = "";
  final typesselected = TextEditingController();
  List<String> types = ["Tunise", "Enseignant","Industriel"];
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        title: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('frais d inscription'),
        ),

      ),
      body: Center(
        
        child: Form(
          
         key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
  
            child: Column(
              
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _firstname,
                decoration:const  InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Prenom",
                    icon: Icon(Icons.person)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _lastname,
                decoration:const  InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Nom",
                    icon: Icon(Icons.person)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: date,
                decoration:const InputDecoration(
                    icon: Icon(Icons.calendar_today_rounded),
                    labelText: "Date d'inscree"),
                onTap: () async {
                  DateTime? dateDeCueillette = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1990),
                      lastDate: DateTime(2023));
                  if (dateDeCueillette != null) {
                    setState(() {
                      date.text =
                          DateFormat("yyyy-MM-dd").format(dateDeCueillette);
                    });
                  }
                },
              ),
            ),
            
            Padding(
              
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    // ignore: prefer_const_constructors
                    children: const [Text(
                        "Categories",
                        style: TextStyle(fontSize: 25, color: Colors.yellow),
                      ),
                      SizedBox(
                        height: 60,
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Radio(
                        value: 1,
                        groupValue: _value,
                        onChanged: (value) {
                          setState(() {
                            _value = value as int;
                          });
                        },
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        "Tunise",
                        style: TextStyle(color: Colors.yellow),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Radio(
                          value: 2,
                          groupValue: _value,
                          onChanged: (value) {
                            setState(() {
                              _value = value as int;
                            });
                          }),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        "etranger",
                        style: TextStyle(color: Colors.yellow),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: const [
                      Text(
                        "Type d'inscription",
                        style: TextStyle(fontSize: 25, color: Colors.yellow),
                      ),
                      SizedBox(
                        height: 60,
                      ),
                    ],
                  ),
                  
                  Text(
                    "vous avez choisir : $selectType",
                    style: const TextStyle(fontSize: 20, color: Colors.yellowAccent),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      width: MediaQuery.of(context).size.width,
                      height: 60,
                      child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              loading = true;
                            });
                            Future.delayed(const Duration(seconds: 3), () {
                              setState(() {
                                loading = false;
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Dialogue(
                                              firstName: _firstname.text,
                                              lastName: _lastname.text,
                                              Typess: typesselected.text,
                                            )));
                              });
                            });
                          },
                          child: loading
                              ? Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Text(
                                      "loading...",
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.red),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    CircularProgressIndicator(
                                      color: Colors.red,
                                    ),
                                  ],
                                )
                              : const Text(
                                  "soumission",
                                  style:
                                      TextStyle(fontSize: 30, color: Colors.red),
                                )))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FloatingActionButton(
                child: const Icon(Icons.lock_reset),
                backgroundColor: Colors.yellowAccent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24)),
                onPressed: () {
                  _firstname.clear();
                  _lastname.clear();
                  date.clear();
                  typesselected.clear();
                  _value = 0;
                },
              ),
            )
          ],
        )),
      ),
    );
  }
}
