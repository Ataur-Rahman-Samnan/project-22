import 'package:flutter/material.dart';

void main() {
  runApp(const BloodDonationApp());
}

class BloodDonationApp extends StatelessWidget {
  const BloodDonationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.grey[100],
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
        ),
      ),
      home: const BloodDonationHome(),
    );
  }
}

class BloodDonationHome extends StatefulWidget {
  const BloodDonationHome({super.key});

  @override
  _BloodDonationHomeState createState() => _BloodDonationHomeState();
}

class _BloodDonationHomeState extends State<BloodDonationHome> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    const HomeScreen(),
    const DonorListScreen(),
    const ProfileScreen(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Blood Donation'),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Donor List'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Welcome',
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue)),
    );
  }
}

class DonorListScreen extends StatelessWidget {
  const DonorListScreen({super.key});

  final List<String> donors = const [
    'Razin',
    'Nahar',
    'Rahat',
    'Ataur',
    'Tabib'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Donor List')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemCount: donors.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        DonorDetailsScreen(donorName: donors[index]),
                  ),
                );
              },
              child: Card(
                color: Colors.blue.shade100,
                elevation: 6,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                child: Center(
                  child: Text(
                    donors[index],
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class DonorDetailsScreen extends StatelessWidget {
  final String donorName;

  const DonorDetailsScreen({super.key, required this.donorName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Donor Details')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: $donorName',
                style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue)),
            const SizedBox(height: 10),
            const Text('Mobile: 01762839212',
                style: TextStyle(fontSize: 18, color: Colors.black87)),
            const SizedBox(height: 10),
            const Text('Address: 682/9, Kafrul, Dhaka',
                style: TextStyle(fontSize: 18, color: Colors.black87)),
          ],
        ),
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Profile',
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue)),
    );
  }
}
