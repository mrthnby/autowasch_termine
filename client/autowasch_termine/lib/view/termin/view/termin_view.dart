import 'package:autowasch_termine/view/user/model/autowash_model.dart';
import 'package:flutter/material.dart';

class TerminView extends StatefulWidget {
  const TerminView({super.key, required this.autowash});
  final Autowash autowash;

  @override
  State<TerminView> createState() => _TerminViewState();
}

class _TerminViewState extends State<TerminView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.autowash.name),
        centerTitle: true,
        backgroundColor: Colors.orange.shade400,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            
          ],
        ),
      ),
    );
  }
}
