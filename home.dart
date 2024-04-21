import 'package:flutter/material.dart';

void main() {
  runApp(const LoginApp());
}

class LoginApp extends StatelessWidget {
  // ignore: use_super_parameters
  const LoginApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home Page',
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 102, 123, 240),
        scaffoldBackgroundColor: Colors.grey[200], // Warna latar belakang body
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: Colors.black87, // Warna teks utama
              fontFamily: 'Roboto', // Jenis font
            ),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  // ignore: use_super_parameters
  const HomePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isOn = true; // Status tombol on/off
  bool isRefreshing = false; // Status efek refresh

  @override
  Widget build(BuildContext context) {
    // Mengambil warna latar belakang halaman dari tema
    Color backgroundColor = Theme.of(context).scaffoldBackgroundColor;

    return Scaffold(
      appBar: AppBar(
        title:
            const Text('Home', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    isRefreshing = true;
                  });
                  Future.delayed(const Duration(milliseconds: 500), () {
                    setState(() {
                      isRefreshing = false;
                    });
                  });
                },
                child: SizedBox(
                  height: 200,
                  child: isRefreshing
                      // ignore: prefer_const_constructors
                      ? CircularProgressIndicator()
                      : Image.asset(
                          'assets/images/mobil.png',
                          fit: BoxFit.cover,
                        ),
                ),
              ),
              const SizedBox(height: 20.0),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isRefreshing = true;
                  });
                  Future.delayed(const Duration(milliseconds: 500), () {
                    setState(() {
                      isRefreshing = false;
                    });
                  });
                },
                // ignore: prefer_const_constructors
                child: Text(
                  'Toyota RV4',
                  style: const TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildInfoCard(
                    title: 'Battery Level',
                    value: '79%',
                    icon: Icons.battery_full,
                    backgroundColor: backgroundColor,
                    iconColor: const Color.fromARGB(255, 46, 74, 233),
                  ),
                  _buildInfoCard(
                    title: 'Range',
                    value: '200 KM',
                    icon: Icons.directions_car,
                    backgroundColor: backgroundColor,
                    iconColor: const Color.fromARGB(255, 46, 74, 233),
                  ),
                  _buildInfoCard(
                    title: 'Degrees',
                    value: '28°',
                    icon: Icons.thermostat,
                    backgroundColor: backgroundColor,
                    iconColor: const Color.fromARGB(255, 46, 74, 233),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildFeatureButton(
                    title: 'Car Location',
                    value: 'TMMIN',
                    icon: Icons.location_on,
                    backgroundColor: backgroundColor,
                    iconColor: const Color.fromARGB(255, 46, 74, 233),
                  ),
                  _buildFeatureButton(
                    title: 'Tire Pressure',
                    value: '32 PSI',
                    icon: Icons.settings,
                    backgroundColor: backgroundColor,
                    iconColor: const Color.fromARGB(255, 46, 74, 233),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildControlButton(
                    title: 'Lock',
                    icon: Icons.lock,
                    backgroundColor: const Color.fromARGB(255, 114, 190, 252),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Car locked'),
                          duration: Duration(seconds: 1),
                        ),
                      );
                    },
                  ),
                  _buildControlButton(
                    title: 'Power',
                    icon: isOn ? Icons.power_settings_new : Icons.power_off,
                    backgroundColor: isOn ? Colors.green : Colors.red,
                    onPressed: () {
                      setState(() {
                        isOn = !isOn; // Ubah status on/off
                      });
                    },
                  ),
                  _buildControlButton(
                    title: 'Unlock',
                    icon: Icons.lock_open,
                    backgroundColor: const Color.fromARGB(255, 114, 190, 252),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Car unlocked'),
                          duration: Duration(seconds: 1),
                        ),
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoCard({
    required String title,
    required String value,
    required IconData icon,
    required Color backgroundColor,
    required Color iconColor,
  }) {
    return Container(
      width: 120,
      height: 100,
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: backgroundColor.withOpacity(0.8),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(icon, size: 40, color: iconColor),
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureButton({
    required String title,
    required String value,
    required IconData icon,
    required Color backgroundColor,
    required Color iconColor,
  }) {
    return Container(
      width: 150,
      height: 100,
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(icon, size: 40, color: iconColor),
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildControlButton({
    required String title,
    required IconData icon,
    required Color backgroundColor,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon),
      label: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      ),
    );
  }
}
