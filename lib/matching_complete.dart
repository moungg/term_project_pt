import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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

  Future<Map<String, dynamic>> getCurrentLocation() async {
    const String url =
        'https://www.googleapis.com/geolocation/v1/geolocate?key=YOUR_API_KEY';
    final response = await http.post(Uri.parse(url));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to get location');
    }
  }

  Future<void> fetchExperts() async {
    final location = await getCurrentLocation();
    double lat = location['location']['lat'];
    double lng = location['location']['lng'];

    final String url =
        'http://localhost:8000/get_nearby_experts?lat=$lat&lng=$lng';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      setState(() {
        experts = json.decode(response.body)['recommendations'];
      });
    } else {
      throw Exception('Failed to get experts');
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
