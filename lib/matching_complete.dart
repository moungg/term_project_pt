import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:location/location.dart';

class MatchingCompletePage extends StatefulWidget {
  const MatchingCompletePage({super.key});

  @override
  _MatchingCompletePageState createState() => _MatchingCompletePageState();
}

class _MatchingCompletePageState extends State<MatchingCompletePage> {
  List experts = [];

  @override
  void initState() {
    super.initState();
    fetchExperts();
  }

  Future<LocationData> getCurrentLocation() async {
    var locationService = Location();
    PermissionStatus permission = await locationService.requestPermission();
    if (permission == PermissionStatus.granted) {
      return await locationService.getLocation();
    } else {
      throw Exception('Location permission not granted');
    }
  }

  Future<void> fetchExperts() async {
    final location = await getCurrentLocation();
    double? lat = location.latitude;
    double? lng = location.longitude;
    final String url =
        'http://localhost:8000/get_nearby_experts?lat=$lat&lng=$lng';
    final response = await http.get(Uri.parse(url));
    try {
      if (response.statusCode == 200) {
        setState(() {
          experts = json.decode(response.body)['recommendations'];
        });
      } else {
        throw Exception('Failed to get experts');
      }
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: const Text("Matching Complete"),
      ),
      body: ListView.builder(
        itemCount: experts.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(experts[index]['username']),
            subtitle:
                Text("Distance: ${experts[index]['distance'].toString()} km"),
          );
        },
      ),
    );
  }
}
