import 'package:flutter/material.dart';
import '../widgets/custom_button.dart';
import '../widgets/interpreter_card.dart';
import '../services/booking_service.dart';
import 'hello_world_stateless.dart';
import 'hello_world_stateful.dart';
import 'staggered_grid_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _showBookingConfirmation(String interpreterName) {
    BookingService.addBooking();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Booking Confirmed'),
        content: Text('Your session with $interpreterName has been booked!'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final interpreters = BookingService.getInterpreters();

    return Scaffold(
      appBar: AppBar(
        title: Text('SignSpeak - Find Interpreters'),
        backgroundColor: Colors.indigo,
      ),
      body: Column(
        children: [
          // Demo Section - Quick Access to Learning Tasks
          Container(
            color: Colors.orange.shade50,
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Text(
                  '📚 Learning Demos',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange.shade900,
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4),
                        child: ElevatedButton.icon(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HelloWorldStateless(),
                              ),
                            );
                          },
                          icon: Icon(Icons.code, size: 16),
                          label:
                              Text('Stateless', style: TextStyle(fontSize: 12)),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            foregroundColor: Colors.white,
                            padding: EdgeInsets.symmetric(vertical: 8),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4),
                        child: ElevatedButton.icon(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HelloWorldStateful(),
                              ),
                            );
                          },
                          icon: Icon(Icons.add_circle, size: 16),
                          label:
                              Text('Stateful', style: TextStyle(fontSize: 12)),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            foregroundColor: Colors.white,
                            padding: EdgeInsets.symmetric(vertical: 8),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4),
                        child: ElevatedButton.icon(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => StaggeredGridPage(),
                              ),
                            );
                          },
                          icon: Icon(Icons.grid_view, size: 16),
                          label: Text('Grid', style: TextStyle(fontSize: 12)),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.purple,
                            foregroundColor: Colors.white,
                            padding: EdgeInsets.symmetric(vertical: 8),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Emergency Booking Button
          Padding(
            padding: EdgeInsets.all(20),
            child: CustomButton(
              text: 'Emergency Booking',
              icon: Icons.emergency,
              color: Colors.red,
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      content: Text('Connecting to nearest interpreter...')),
                );
              },
            ),
          ),
          // Interpreter List
          Expanded(
            child: ListView.builder(
              itemCount: interpreters.length,
              itemBuilder: (context, index) {
                return InterpreterCard(
                  interpreter: interpreters[index],
                  onBook: () =>
                      _showBookingConfirmation(interpreters[index].name),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
