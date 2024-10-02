import 'package:atividade3mobile/domain/people.dart';
import 'package:atividade3mobile/widgets/bank_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _home();
}

class _home extends State<Home> {
  List<People> peoples = [];
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  String? _selectedGender;
  final List<String> _genders = ['Masculino', 'Feminino'];

  void _cadastrar() {
    setState(() {
      String? name = _nameController.text;
      int? age = int.tryParse(_ageController.text);
      if (age == null || name == null || name == "") return;

      bool isMan = _selectedGender == 'Masculino' ? true : false;
      People newPeople = People(name: name, age: age, isMan: isMan);
      peoples.add(newPeople);
      _nameController.text = "";
      _ageController.text = "";
      _selectedGender = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Center(
          child: Container(
            alignment: Alignment.center,
            width: 500,
            child: Column(
              children: [
                TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(labelText: "Nome"),
                ),
                TextField(
                  controller: _ageController,
                  decoration: const InputDecoration(labelText: "Idade"),
                ),
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(labelText: 'Gênero'),
                  value: _selectedGender,
                  items: _genders.map((String gender) {
                    return DropdownMenuItem<String>(
                      value: gender,
                      child: Text(gender),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      _selectedGender = newValue;
                    });
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                  onPressed: _cadastrar,
                  child: const Text("Cadastrar"),
                )
              ],
            ),
          ),
        ),
        Expanded(
            child: ListView.builder(
          itemCount: peoples.length,
          itemBuilder: (context, index) => BankCard(people: peoples[index]),
        ))
      ],
    ));
  }
}
