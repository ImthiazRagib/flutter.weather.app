import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation>
    with SingleTickerProviderStateMixin {
  final List<String> locations = [
    'New York',
    'London',
    'Tokyo',
    'Sydney',
    'Paris',
  ];
  String? location;
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    location = locations.first; // Default selection
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _fadeAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _controller.forward(); // Start the fade-in animation
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose(); // Clean up the controller
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Choose Location',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue[400],
        elevation: 0,
      ),
      body: FadeTransition(
        opacity: _fadeAnimation,
        child: Center(
          child: Card(
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.location_on,
                    size: 60,
                    color: Colors.blueAccent,
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Select your city',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 24),
                  DropdownButtonFormField<String>(
                    value: location,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    items: locations
                        .map(
                          (location) => DropdownMenuItem(
                            value: location,
                            child: Text(location),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        location = value;
                      });
                    },
                  ),
                  const SizedBox(height: 32),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 12,
                      ),
                    ),
                    onPressed: () {
                      // Pop the current page and return the selected location
                      Navigator.pop(context, {"location": location});
                    },
                    icon: const Icon(Icons.check),
                    label: const Text('Confirm'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
