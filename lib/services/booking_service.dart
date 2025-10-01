import '../models/interpreter.dart';

class BookingService {
  static List<Interpreter> getInterpreters() {
    return [
      Interpreter(
        name: 'Maria Santos',
        specialty: 'ASL Expert',
        rating: 4.8,
        available: true,
      ),
      Interpreter(
        name: 'John Reyes',
        specialty: 'FSL Specialist',
        rating: 4.9,
        available: true,
      ),
      Interpreter(
        name: 'Ana Cruz',
        specialty: 'Educational',
        rating: 4.7,
        available: false,
      ),
    ];
  }

  static int totalBookings = 0;

  static void addBooking() {
    totalBookings++;
  }
}
