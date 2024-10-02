import 'package:atividade3mobile/domain/people.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BankCard extends StatelessWidget {
  final People people;
  BankCard({required this.people});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(20),
      child: Container(
        width: 200,
        height: 100,
        decoration: const BoxDecoration(color: Colors.lightGreen),
        alignment: Alignment.center,
        child: Center(
            child: Column(
          children: [
            Row(
              children: [
                Text(
                  people.name,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
                Text(
                  people.age.toString(),
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  people.isMan ? "Homem" : "Mulher",
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            )
          ],
        )),
      ),
    );
  }
}
