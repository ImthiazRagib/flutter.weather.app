import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String location = 'San Francisco';
  String time = 'Monday, 10:00 AM';
  String temperature = '22°';
  String weatherDescription = 'Sunny';
  String windSpeed = '12 km/h';
  String humidity = '78%';
  String rain = '0 mm';

  @override
  Widget build(BuildContext context) {

    // Check if arguments are passed from Navigator.pop and update state
    final args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    if (args != null) {
      location = args['location'] ?? location;
      time = args['time'] ?? time;
      temperature = args['temperature'] ?? temperature;
      weatherDescription = args['weatherDescription'] ?? weatherDescription;
      windSpeed = args['windSpeed'] ?? windSpeed;
      humidity = args['humidity'] ?? humidity;
      rain = args['rain'] ?? rain;
    }
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blue[400],
        title: const Text(
          'Weather App',
          style: TextStyle(
            fontSize: 26,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.9),
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: Colors.blue.withOpacity(0.2),
                blurRadius: 16,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.wb_sunny_rounded, size: 80, color: Colors.amber[700]),
              const SizedBox(height: 16),
              TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.blueAccent,
                  padding: EdgeInsets.zero,
                  minimumSize: Size(0, 0),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  shadowColor: Colors.transparent,
                  elevation: 0,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/chooselocation');
                },
                child: Text(
                  location,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(time, style: TextStyle(fontSize: 16, color: Colors.grey)),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    temperature,
                    style: TextStyle(
                      fontSize: 64,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(width: 8),
                  Text(
                    'C',
                    style: TextStyle(fontSize: 32, color: Colors.black54),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                weatherDescription,
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.amber,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Icon(Icons.air, color: Colors.blue, size: 28),
                      SizedBox(height: 4),
                      Text('Wind', style: TextStyle(color: Colors.black54)),
                      Text(
                        windSpeed,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Icons.opacity, color: Colors.blue, size: 28),
                      SizedBox(height: 4),
                      Text('Humidity', style: TextStyle(color: Colors.black54)),
                      Text(
                        humidity,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Icons.umbrella, color: Colors.blue, size: 28),
                      SizedBox(height: 4),
                      Text('Rain', style: TextStyle(color: Colors.black54)),
                      Text(rain, style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
