import 'package:flutter/material.dart';
import '../models/interpreter.dart';

class InterpreterCard extends StatelessWidget {
  final Interpreter interpreter;
  final VoidCallback onBook;

  InterpreterCard({
    required this.interpreter,
    required this.onBook,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      elevation: 4,
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  interpreter.name,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Chip(
                  label: Text(
                    interpreter.available ? 'Available' : 'Busy',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                  backgroundColor:
                      interpreter.available ? Colors.green : Colors.red,
                ),
              ],
            ),
            SizedBox(height: 8),
            Text(
              interpreter.specialty,
              style: TextStyle(color: Colors.grey[600]),
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.amber, size: 20),
                    SizedBox(width: 5),
                    Text('${interpreter.rating}'),
                  ],
                ),
                if (interpreter.available)
                  ElevatedButton(
                    onPressed: onBook,
                    child: Text('Book Now'),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
