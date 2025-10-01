import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../widgets/custom_button.dart';
import '../services/booking_service.dart';

class BookingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Bookings'),
        backgroundColor: Colors.indigo,
      ),
      body: _buildMaterialDesign(context),
    );
  }

  // Material Design Version
  Widget _buildMaterialDesign(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.calendar_today, size: 80, color: Colors.indigo),
          SizedBox(height: 20),
          Text(
            'Total Bookings',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            '${BookingService.totalBookings}',
            style: TextStyle(fontSize: 48, color: Colors.indigo),
          ),
          SizedBox(height: 40),
          CustomButton(
            text: 'View History',
            icon: Icons.history,
            color: Colors.indigo,
            onPressed: () {
              _showCupertinoVersion(context);
            },
          ),
        ],
      ),
    );
  }

  // Cupertino Design Version (iOS Style)
  void _showCupertinoVersion(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoActionSheet(
        title: Text('Booking History'),
        message: Text('Total bookings: ${BookingService.totalBookings}'),
        actions: [
          CupertinoActionSheetAction(
            child: Text('View Details'),
            onPressed: () => Navigator.pop(context),
          ),
        ],
        cancelButton: CupertinoActionSheetAction(
          child: Text('Close'),
          onPressed: () => Navigator.pop(context),
        ),
      ),
    );
  }
}
