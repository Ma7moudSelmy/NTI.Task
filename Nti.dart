import 'dart:io';

void printSeats(List<List<String>> theater) {
  print("Theater Seats:");
  for (var row in theater) {
    print(row.join(" "));
  }
  print("");
}

void bookSeat(
  List<List<String>> theater,
  Map<String, Map<String, String>> bookings,
) {
  stdout.write("Enter row (1-5) or 'exit' to quit: ");
  String? rowInput = stdin.readLineSync();
  if (rowInput == null) return;
  if (rowInput.toLowerCase() == 'exit') return;

  int row;
  try {
    row = int.parse(rowInput) - 1;
    if (row < 0 || row >= theater.length) {
      print("Invalid row number.");
      return;
    }
  } catch (e) {
    print("Invalid input for row.");
    return;
  }

  stdout.write("Enter column (1-5): ");
  String? colInput = stdin.readLineSync();
  if (colInput == null) return;
  int col;
  try {
    col = int.parse(colInput) - 1;
    if (col < 0 || col >= theater[0].length) {
      print("Invalid column number.");
      return;
    }
  } catch (e) {
    print("Invalid input for column.");
    return;
  }

  if (theater[row][col] == 'B') {
    print("Seat is already booked");
    return;
  }

  stdout.write("Enter your name: ");
  String? name = stdin.readLineSync();
  stdout.write("Enter your phone number: ");
  String? phone = stdin.readLineSync();

  theater[row][col] = 'B';
  bookings["${row + 1},${col + 1}"] = {
    "name": name ?? "",
    "phone": phone ?? "",
  };
  print("Seat booked successfully\n");
}

void showBookings(Map<String, Map<String, String>> bookings) {
  if (bookings.isEmpty) {
    print("No bookings yet");
  } else {
    print("Users Booking Details:");
    bookings.forEach((seat, details) {
      print("Seat $seat: ${details['name']} - ${details['phone']}");
    });
  }
  print("");
}

void main() {
  List<List<String>> theater = List.generate(5, (_) => List.filled(5, 'E'));
  Map<String, Map<String, String>> bookings = {};

  print("Welcome To Our Theater");
  while (true) {
    print("press 1 to book new seat");
    print("press 2 to show the theater seats");
    print("press 3 to show users data");
    print("press 4 to exit");
    stdout.write("input=>");
    String? choice = stdin.readLineSync();
    if (choice == '1') {
      bookSeat(theater, bookings);
    } else if (choice == '2') {
      printSeats(theater);
    } else if (choice == '3') {
      showBookings(bookings);
    } else if (choice == '4') {
      break;
    } else {
      print("Invalid choice. Please try again\n");
    }
  }
  print("Final Theater Seats:");
  printSeats(theater);
  print("Final Users Booking Details:");
  showBookings(bookings);
}
