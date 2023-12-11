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
    try {
      // 위치 서비스를 통해 사용자의 현재 위치 가져오기
      LocationData? locationData = await getCurrentLocation();

      double lat = locationData.latitude!;
      double lng = locationData.longitude!;

      final String serverUrl =
          'http://192.168.50.138:8000/get_nearby_experts/?lat=$lat&lng=$lng';
      final response = await http.get(Uri.parse(serverUrl));

      if (response.statusCode == 200) {
        setState(() {
          experts = json.decode(response.body)['recommendations'];
          isLoading = false;
        });
      } else {
        setState(() {
          isLoading = false;
        });
        throw Exception('Failed to load experts from server');
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      // Handle the error by showing an alert dialog or a snackbar
      showErrorDialog(e.toString());
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

  void showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: const Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
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
                    var expert = experts[index];
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: <Widget>[
                            Container(
                              width: 80.0,
                              height: 80.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                image: expert['photo'] != null
                                    ? DecorationImage(
                                        image: NetworkImage(expert['photo']),
                                        fit: BoxFit.contain,
                                      )
                                    : const DecorationImage(
                                        image: AssetImage(
                                            'assets/default-profile.jpg'),
                                        fit: BoxFit.cover,
                                      ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(expert['username'],
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)),
                                  const SizedBox(height: 10),
                                  Text(expert['profile'] ?? '프로필 없음',
                                      style: const TextStyle(fontSize: 16)),
                                  const SizedBox(height: 5),
                                  Text('${expert['distance']} km',
                                      style: const TextStyle(fontSize: 16)),
                                  const SizedBox(height: 5),
                                  Text(expert['qualification'] ?? '자격증 없음',
                                      style: const TextStyle(fontSize: 16)),
                                ],
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                // TODO: '이용' 버튼이 눌렸을 때의 액션 추가
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                              child: const Text('CALL'),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                )),
    );
  }
}
