import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:location/location.dart';
import 'dart:convert';

class MatchingCompletePage extends StatefulWidget {
  const MatchingCompletePage({Key? key}) : super(key: key);

  @override
  _MatchingCompletePageState createState() => _MatchingCompletePageState();
}

class _MatchingCompletePageState extends State<MatchingCompletePage> {
  List experts = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchExperts();
  }

  Future<void> fetchExperts() async {
    // 위치 서비스를 통해 사용자의 현재 위치 가져오기
    LocationData? locationData = await getCurrentLocation();

    double lat = locationData.latitude!;
    double lng = locationData.longitude!;

    final String serverUrl =
        'http://localhost:8000/get_nearby_experts/?lat=$lat&lng=$lng';
    final response = await http.get(Uri.parse(serverUrl));

    if (response.statusCode == 200) {
      setState(() {
        experts = json.decode(response.body)['recommendations'];
        isLoading = false;
      });
    } else {
      throw Exception('Failed to get experts');
    }
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: const Text("Matching Complete"),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : (experts.isEmpty
              ? const Center(child: Text('주변에 전문가가 없습니다.'))
              : ListView.builder(
                  itemCount: experts.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(experts[index]['username']),
                      subtitle: Text(
                          "Distance: ${experts[index]['distance'].toString()} km"),
                    );
                  },
                )),
    );
  }
}
