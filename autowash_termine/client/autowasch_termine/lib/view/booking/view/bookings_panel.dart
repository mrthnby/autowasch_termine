import 'package:autowasch_termine/core/widgets/card/booking_card.dart';
import 'package:autowasch_termine/product/controllers/user_controller.dart';
import 'package:autowasch_termine/view/booking/viewmodel/booking_viewmodel.dart';
import 'package:autowasch_termine/view/user/model/autowash_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/booking_model.dart';

class BookingPanel extends StatefulWidget {
  const BookingPanel({required this.autowash, super.key});
  final Autowash autowash;

  @override
  State<BookingPanel> createState() => _BookingPanelState();
}

class _BookingPanelState extends State<BookingPanel> {
  UserController userController = UserController.instance;
  BookingViewModel bookingViewmodel = BookingViewModel();
  List<bool> selectedItems = [];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < userController.usersBookings.length; i++) {
      selectedItems.add(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                for (int i = 0; i < userController.usersBookings.length; i++) {
                  if (selectedItems[i] == true) {
                    bookingViewmodel.deleteBooking(
                        userController.usersBookings[i].id ?? "");
                    userController.usersBookings.removeAt(i);
                  }
                }
                setState(() {
                  for (int i = 0;
                      i < userController.usersBookings.length;
                      i++) {
                    if (selectedItems[i] == true) {
                      userController.usersBookings.removeAt(i);
                    }
                  }
                });
              },
              icon: const Icon(
                Icons.delete_forever_rounded,
                color: Colors.orange,
              ))
        ],
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Ihre Termine in der ${widget.autowash.name}",
          style: const TextStyle(color: Colors.orange),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.orange,
          ),
          onPressed: () => Get.back(),
        ),
      ),
      body: userController.usersBookings.isEmpty
          ? Center(
              child: Text(
                "Da gibt keine Termin in der ${widget.autowash.name}",
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.orange,
                ),
              ),
            )
          : ListView.builder(
              itemCount: userController.usersBookings.length,
              itemBuilder: (BuildContext context, int index) {
                Booking currentBooking = userController.usersBookings[index];

                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: Checkbox(
                        value: selectedItems[index],
                        onChanged: (value) {
                          setState(() {
                            selectedItems[index] = value ?? false;
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: BookingCard(
                        currentBooking: currentBooking,
                      ),
                    )
                  ],
                );
              },
            ),
    );
  }
}
