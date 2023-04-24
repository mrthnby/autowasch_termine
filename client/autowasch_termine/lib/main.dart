import 'package:autowasch_termine/product/provider/main_provider.dart';
import 'package:autowasch_termine/view/pages/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MainView());
}

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MainProvider(),
      child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Autowasch Termine",
          home: HomeView()),
    );
  }
}
