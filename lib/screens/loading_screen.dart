import 'package:flutter/material.dart';
import '../services/location.dart';
import 'package:http/http.dart' as http;

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getLocation();
    getData();
  }

  void getLocation() async {
    Location location = Location();

    await location.getCurrentLocation();

    print(location.longitude);
    print(location.latitude);
  }

  void getData() async {
    final client = http.Client();

    var url = Uri.http(
        'https://api.openweathermap.org/data/2.5/weather?lat=37.3292&lon=-121.889&appid=dde46d07224f389c0a58b77a6334998a');
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      print("333");
      String data = response.body;
      print(data);
    } else {
      print("666");
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () {
            //Get the current location
          },
          child: const Text('Get Location'),
        ),
      ),
    );
  }
}
