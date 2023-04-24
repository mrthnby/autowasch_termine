import 'package:autowasch_termine/product/constants/padding_constants.dart';
import 'package:autowasch_termine/product/provider/main_provider.dart';
import 'package:autowasch_termine/view/pages/admin/admin_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../user/user_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String panel1Title = "Home";
  String panel2Title = "Autowäscher Panel";
  @override
  Widget build(BuildContext context) {
    final mainProvider = Provider.of<MainProvider>(context);

    return Scaffold(
      body: Padding(
        padding: PAGE_PADDING,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CupertinoSegmentedControl(
              borderColor: Colors.black,
              groupValue: mainProvider.pageIndex,
              selectedColor: const Color.fromARGB(255, 247, 171, 58),
              pressedColor: Colors.grey.shade200,
              children: _segmentItems,
              onValueChanged: (value) {
                mainProvider.pageIndex = value;
              },
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: mainProvider.pageIndex == 0
                  ? const UserView()
                  : const AdminView(),
            )
          ],
        ),
      ),
    );
  }

  Map<int, Widget> get _segmentItems {
    return {
      0: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Text(
          panel1Title,
          style: const TextStyle(color: Colors.black),
        ),
      ),
      1: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Text(
          panel2Title,
          style: const TextStyle(color: Colors.black),
        ),
      ),
    };
  }
}
