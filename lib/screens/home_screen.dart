import 'package:flutter/material.dart';
import 'package:parkings/widgets/parking_list_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.all(8),
        child: ParkingListWidget(),
      ),
    );
  }
}
