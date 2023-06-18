import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../view/booking/model/booking_model.dart';

class BookingCard extends StatelessWidget {
  const BookingCard({
    super.key,
    required this.currentBooking,
  });

  final Booking currentBooking;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Card(
        color: Colors.orange.shade100,
        child: ListTile(
          leading: const Icon(
            Icons.calendar_month_rounded,
            color: Colors.black,
            size: 30,
          ),
          subtitle: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text(
                    "Name: ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    currentBooking.name,
                  )
                ],
              ),
              Row(
                children: [
                  const Text(
                    "Phone: ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    currentBooking.phoneNumber,
                  )
                ],
              ),
            ],
          ),
          title: Text(
            currentBooking.plateNumber,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          trailing: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    DateFormat.yMMMEd().format(
                      currentBooking.terminDate,
                    ),
                    style: const TextStyle(fontSize: 15),
                  ),
                  Text(
                    DateFormat.Hm().format(
                      currentBooking.terminDate,
                    ),
                    style: const TextStyle(fontSize: 15),
                  ),
                ],
              ),
              currentBooking.terminDate.day <= 9
                  ? const Opacity(
                      opacity: 0,
                      child: Text("00"),
                    )
                  : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
