import 'package:flutter/material.dart';

import '../models/parking_list_response/result.dart';

class ParkingListItem extends StatelessWidget {
  const ParkingListItem({super.key, this.parkingList});

  final List<Result>? parkingList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: parkingList!.length,
      prototypeItem: const ListTile(
        title: Text('Title'),
      ),
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(parkingList![index].nombre.toString()),
        );
      },
    );
  }
}
