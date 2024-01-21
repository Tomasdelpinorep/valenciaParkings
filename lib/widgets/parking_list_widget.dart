import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:parkings/models/parking_list_response/parking_list_response.dart';
import 'package:http/http.dart' as http;
import 'package:parkings/widgets/parking_list_item.dart';

Future<ParkingListResponse> fetchParking() async {
  final response = await http
      .get(Uri.parse('https://valencia.opendatasoft.com/api/explore/v2.1/catalog/datasets/parkings/records'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return ParkingListResponse.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load parking list.');
  }
}

class ParkingListWidget extends StatefulWidget {
  const ParkingListWidget({super.key});

  @override
  State<ParkingListWidget> createState() => _ParkingListWidgetState();
}

class _ParkingListWidgetState extends State<ParkingListWidget> {

  late Future<ParkingListResponse> futureParkingList;

  @override
  void initState() {
    super.initState();
    futureParkingList = fetchParking();
  }


  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ParkingListResponse>(
  future: futureParkingList,
  builder: (context, snapshot) {
    if (snapshot.hasData) {
      return ParkingListItem(parkingList : snapshot.data!.results);

    } else if (snapshot.hasError) {
      return Text('${snapshot.error}');
    }

    // By default, show a loading spinner.
    return const CircularProgressIndicator();
  },
);
  }
}