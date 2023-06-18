import 'package:autowasch_termine/product/constants/padding_constants.dart';
import 'package:autowasch_termine/view/admin/view/admin_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../user/view/user_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with AutomaticKeepAliveClientMixin {
  String panel1Title = "Home";
  String panel2Title = "Autowäscher Panel";
  int _pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: Padding(
        padding: PAGE_PADDING,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CupertinoSegmentedControl(
              borderColor: Colors.black,
              groupValue: _pageIndex,
              selectedColor: const Color.fromARGB(255, 247, 171, 58),
              pressedColor: Colors.grey.shade200,
              children: _segmentItems,
              onValueChanged: (value) {
                setState(() {
                  _pageIndex = value;
                });
              },
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: _pageIndex == 0 ? const UserView() : const AdminView(),
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

  @override
  bool get wantKeepAlive => true;
}
