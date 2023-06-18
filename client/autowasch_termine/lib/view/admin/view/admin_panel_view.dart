import 'package:autowasch_termine/product/controllers/admin_controller.dart';
import 'package:autowasch_termine/view/admin/viewmodel/admin_viewmodel.dart';
import 'package:autowasch_termine/view/booking/model/booking_model.dart';
import 'package:autowasch_termine/view/user/model/autowash_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AdminPanel extends StatefulWidget {
  const AdminPanel({super.key});

  @override
  State<AdminPanel> createState() => _AdminPanelState();
}

class _AdminPanelState extends State<AdminPanel> {
  Autowash autowash = AdminController.instance.loggedUser!;
  AdminViewmodel adminViewmodel = AdminViewmodel();
  List<Booking>? _termins;

  @override
  void initState() {
    super.initState();
    getTermins();
  }

  void getTermins() async {
    _termins = await adminViewmodel.getTermins(autowash);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _appBar(context),
        Expanded(
          child: _termins == null
              ? Center(
                  child: Text(
                    "Da gibt keine Termin für ${autowash.name}",
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.orange,
                    ),
                  ),
                )
              : ListView.builder(
                  itemCount: _termins!.length,
                  itemBuilder: (BuildContext context, int index) {
                    Booking currentBooking = _termins![index];

                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Card(
                        color: Colors.orange.shade100,
                        child: ListTile(
                          leading: const Icon(
                            Icons.bookmark,
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
                                  ),
                                  Text(
                                    DateFormat.Hm().format(
                                      currentBooking.terminDate,
                                    ),
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
                  },
                ),
        ),
      ],
    );
  }

  Widget _appBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          Text(
            "Welcome back, ",
            style: Theme.of(context)
                .textTheme
                .headlineMedium
                ?.copyWith(color: Colors.orange.shade600),
          ),
          Text(
            autowash.name,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: Colors.orange.shade600,
                  fontWeight: FontWeight.bold,
                ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                onTap: () {
                  setState(() {
                    adminViewmodel.signOut();
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Sign Out",
                        style: TextStyle(color: Colors.orange.shade300),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Icon(
                        Icons.logout_rounded,
                        color: Colors.orange.shade300,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
