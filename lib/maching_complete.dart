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

  @override
  void initState() {
    super.initState();
    fetchExperts();
  }

  Future<void> fetchExperts() async {
    // 위치 서비스를 통해 사용자의 현재 위치 가져오기
    LocationData? locationData = await _getUserLocation();

    if (locationData != null) {
      double lat = locationData.latitude!;
      double lng = locationData.longitude!;

      // 서버에 사용자 위치를 보내서 주변 사용자 검색
      final String serverUrl =
          'http://localhost:8000//get_nearby_experts/?lat=37.12345&lng=-122.67890';
      final response = await http.get(Uri.parse(serverUrl));

      if (response.statusCode == 200) {
        print('Response data: ${response.body}');
        setState(() {
          experts = json.decode(response.body)['recommendations'];
        });
      } else {
        print('Error occurred with status code: ${response.statusCode}');
        print('Error occurred: ${response.body}');
        throw Exception('Failed to get experts');
      }
    } else {
      // 위치 정보를 가져오지 못한 경우 처리
      // 예: 사용자가 위치 서비스 또는 권한을 거부한 경우
    }
  }

  Future<LocationData?> _getUserLocation() async {
    // 위치 서비스 초기화 및 권한 요청
    Location location = Location();
    bool serviceEnabled;
    PermissionStatus permissionGranted;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return null;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return null;
      }
    }

    return await location.getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: const Text("Matching Complete"),
      ),
      body: experts.isEmpty
          ? Center(child: Text('주변에 전문가가 없습니다.'))
          : ListView.builder(
              itemCount: experts.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(experts[index]['username']),
                  subtitle: Text(
                      "Distance: ${experts[index]['distance'].toString()} km"),
                );
              },
            ),
    );
  }
}
