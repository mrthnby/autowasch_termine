import 'package:autowasch_termine/core/widgets/textfield/custom_textfield.dart';
import 'package:autowasch_termine/view/booking/model/booking_model.dart';
import 'package:autowasch_termine/view/booking/view/bookings_panel.dart';
import 'package:autowasch_termine/view/booking/viewmodel/booking_viewmodel.dart';
import 'package:autowasch_termine/view/user/model/autowash_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../product/controllers/user_controller.dart';

class BookingView extends StatefulWidget {
  const BookingView({super.key, required this.autowash});
  final Autowash autowash;

  @override
  State<BookingView> createState() => _BookingViewState();
}

class _BookingViewState extends State<BookingView> {
  final nameController = TextEditingController();
  final dateController = TextEditingController();
  final plateController = TextEditingController();
  final phoneController = TextEditingController();
  DateTime? pickedDate;
  DateTime? selectedDate;
  BookingViewModel bookingViewModel = BookingViewModel();
  List<int> _unavailableHours = [];
  UserController userController = UserController.instance;

  late final int _openingHour =
      int.parse(widget.autowash.openingHours.split("-")[0].split(".")[0]);
  late final int _closingHour =
      int.parse(widget.autowash.openingHours.split("-")[1].split(".")[0]);

  int? _selectedHour;

  int _getTerminCount() {
    return _closingHour - _openingHour;
  }

  String _getFormattedHour(int hour) {
    return hour / 10 >= 1 ? "$hour:00" : "0$hour:00";
  }

  void _getUnavailableHours(DateTime currentDate) async {
    List<int> res = await bookingViewModel.getUnavailableHours(
        currentDate, widget.autowash, _openingHour, _closingHour);
    if (mounted) {
      setState(() {
        _unavailableHours = res;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.autowash.name),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.to(
                () => BookingPanel(
                  autowash: widget.autowash,
                ),
              );
            },
            icon: const Icon(Icons.delete_rounded,),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
        centerTitle: true,
        backgroundColor: Colors.orange.shade400,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height - 100,
              width: MediaQuery.of(context).size.width / 3,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Erstellt neue Termin",
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontSize: 35),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    controller: nameController,
                    hint: "Guido Ludwig",
                    label: "Name",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    controller: phoneController,
                    hint: "+90 548 451 12 35",
                    label: "Phone Number",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    controller: plateController,
                    hint: "34 BK 5290",
                    label: "Plate",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    controller: dateController,
                    hint: "05 March 2024",
                    label: "Date",
                    isReadOnly: true,
                    prefixIcon: Icon(
                      Icons.date_range_rounded,
                      color: Colors.orange.shade300,
                    ),
                    onTap: () async {
                      pickedDate = await showDatePicker(
                        context: context,
                        initialDate: pickedDate ?? DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime.now().add(
                          const Duration(days: 365),
                        ),
                        builder: (context, child) {
                          return Theme(
                            data: Theme.of(context).copyWith(
                              colorScheme: const ColorScheme.light(
                                primary: Colors.orange,
                              ),
                            ),
                            child: child!,
                          );
                        },
                      );

                      if (pickedDate != null) {
                        String formattedDate =
                            DateFormat('dd MMMM yyyy').format(pickedDate!);
                        setState(() {
                          dateController.text = formattedDate;
                        });
                      }
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Available Hours:"),
                  ),
                  _getAvailableHours(),
                  ElevatedButton(
                    onPressed: _createTermin,
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(150, 60),
                      backgroundColor: Colors.orange.shade400,
                    ),
                    child: const Text("Create Booking"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Expanded _getAvailableHours() {
    return pickedDate == null
        ? const Expanded(
            child: Center(
              child: Text("Please select a date"),
            ),
          )
        : Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                childAspectRatio: 2,
              ),
              itemCount: _getTerminCount(),
              itemBuilder: (context, index) {
                _getUnavailableHours(
                  pickedDate ?? DateTime.now(),
                );
                return _unavailableHours.contains(_openingHour + index)
                    ? Chip(
                        elevation: 0,
                        backgroundColor: Colors.orange.shade300,
                        shadowColor: Colors.blueGrey,
                        label: SizedBox(
                          width: 50,
                          child: Text(
                            _getFormattedHour(_openingHour + index),
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              decoration: TextDecoration.lineThrough,
                              decorationThickness: 2,
                            ),
                          ),
                        ),
                      )
                    : InkWell(
                        borderRadius: BorderRadius.circular(50),
                        onTap: () {
                          setState(() {
                            _selectedHour = index;
                            selectedDate = pickedDate
                                ?.add(Duration(hours: _openingHour + index));
                          });
                        },
                        child: Chip(
                          elevation: 0,
                          backgroundColor: index == _selectedHour
                              ? Colors.orange.shade700
                              : Colors.orange.shade300,
                          shadowColor: Colors.orange,
                          label: SizedBox(
                            width: 50,
                            child: Text(
                              _getFormattedHour(_openingHour + index),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      );
              },
            ),
          );
  }

  void _createTermin() {
    if (nameController.text != "" &&
        phoneController.text != "" &&
        plateController.text != "" &&
        pickedDate != null &&
        _selectedHour != null &&
        selectedDate != null) {
      bookingViewModel
          .addBookig(
        Booking(
          name: nameController.text,
          phoneNumber: phoneController.text,
          plateNumber: plateController.text,
          autoWaschId: widget.autowash.id ?? "",
          terminDate: selectedDate!,
        ),
      )
          .then((value) {
        userController.usersBookings.add(value);
        nameController.text = "";
        phoneController.text = "";
        plateController.text = "";
        pickedDate = null;
        _selectedHour = null;
        selectedDate = null;
        Get.showSnackbar(
          GetSnackBar(
            title: "Thanks",
            messageText: const Text(
              "Ihr Termin ist gemacht worden",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            backgroundColor: Colors.green.shade300,
            borderRadius: 12,
            margin: EdgeInsets.symmetric(
              vertical: 4,
              horizontal: Get.size.width / 4.toInt(),
            ),
            snackPosition: SnackPosition.TOP,
            duration: const Duration(seconds: 2),
          ),
        );
      });
    } else {
      Get.showSnackbar(
        GetSnackBar(
          title: "Error",
          messageText: const Text(
            "Bitte füllen sie jede Field",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.orange,
          borderRadius: 12,
          margin: EdgeInsets.symmetric(
            vertical: 4,
            horizontal: Get.size.width / 4.toInt(),
          ),
          snackPosition: SnackPosition.TOP,
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }
}
