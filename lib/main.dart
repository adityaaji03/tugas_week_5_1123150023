import 'package:flutter/material.dart';

void main() {
  runApp(const AdityaApp());
}

class AdityaApp extends StatelessWidget {
  const AdityaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aplikasi latihan container',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static const List<Widget> _pages = <Widget>[
    SizedBox.shrink(),
    Center(child: Text('Profile Page')),
    Center(child: Text('Settings Page')),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // Widget container 
  Widget _sansContainer() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSansContainer(
          image: "assets/images/boxing.png",
          title: "boxing",
          borderColor: Colors.blue,
        ),
        Transform.rotate(
          angle: 38 * 3.14159 / 180,
          child: _buildSansContainer(
            image: "assets/images/pillates.png",
            title: "pillates",
            borderColor: Colors.blue,
          ),
        ),
        Transform.rotate(
          angle: -43 * 3.14159 / 180,
          child: _buildSansContainer(
            image: "assets/images/gym.png",
            title: "Gym",
            borderColor: Colors.blueAccent,
            gradient: const LinearGradient(
              colors: [Colors.yellow, Colors.greenAccent, Colors.blue],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSansContainer({
    required String image,
    required String title,
    required Color borderColor,
    Gradient? gradient,
  }) {
    return Container(
      width: 150,
      height: 150,
      margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
          colorFilter: gradient != null
              ? ColorFilter.mode(
                  Colors.black.withOpacity(0.1),
                  BlendMode.darken,
                )
              : null,
        ),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: borderColor, width: 2),
        gradient: gradient,

        boxShadow: [
    BoxShadow(
      color: Colors.black.withOpacity(0.25), 
      blurRadius: 10, 
      spreadRadius: 2,
      offset: const Offset(4, 4), 
    ),
  ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Olahraga",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white,),
          ),
          const Text(
            "Sehat",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white,),
          ),
          Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white,),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget homeContent = SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 30),
          _sansContainer(), // hanya tampilkan kontainer
        ],
      ),
    );

    return Scaffold(
      backgroundColor: const Color(0xFFE8F5E9),
      appBar: AppBar(
        backgroundColor: Colors.green[700],
        title: const Text('Aditya Aji App'),
      ),
      body: _selectedIndex == 0 ? homeContent : _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green[800],
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }
}
