class TheaterBookingSystem {
  static final TheaterBookingSystem _instance = TheaterBookingSystem._internal();
  List<String> bookings = [];

  factory TheaterBookingSystem() {
    return _instance;
  }

  TheaterBookingSystem._internal();

  void addBooking(String booking) {
    bookings.add(booking);
    print("Booking added: $booking");
  }

  void showBookings() {
    print("Current bookings: $bookings");
  }
}

void main() {
  var system1 = TheaterBookingSystem();
  var system2 = TheaterBookingSystem();
  system1.addBooking("Seat A1");
  system2.showBookings();
}
