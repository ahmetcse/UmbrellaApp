import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    Text('Home Page'),
    Text('Favorites'),
    Text('Library'),
    Text('Messages'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Bottom Navbar'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30), // Sol üst köşe yuvarlak
          topRight: Radius.circular(30), // Sağ üst köşe yuvarlak
        ),
        child: Container(
          color: const Color.fromARGB(255, 77, 29, 29), // Arka plan rengi
          child: BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: _selectedIndex == 0
                    ? Container(
                        padding: const EdgeInsets.all(8),
                        decoration: const BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle, // Seçili öğe
                        ),
                        child: const Icon(
                          Icons.home,
                          color: Colors.white,
                        ),
                      )
                    : const Icon(Icons.home),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: _selectedIndex == 1
                    ? Container(
                        padding: const EdgeInsets.all(8),
                        decoration: const BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle, // Seçili öğe
                        ),
                        child: const Icon(
                          Icons.favorite,
                          color: Colors.white,
                        ),
                      )
                    : const Icon(Icons.favorite),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color:
                        _selectedIndex == 2 ? Colors.green : Colors.transparent,
                    shape: BoxShape.circle, // Seçili öğe
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      'assets/images/images.png', // Resmin yolu
                      width: 32, // İkon boyutu
                      height: 32,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: _selectedIndex == 3
                    ? Container(
                        padding: const EdgeInsets.all(8),
                        decoration: const BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle, // Seçili öğe
                        ),
                        child: const Icon(
                          Icons.message,
                          color: Colors.white,
                        ),
                      )
                    : const Icon(Icons.message),
                label: '',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.green,
            unselectedItemColor: Colors.grey,
            onTap: _onItemTapped,
            type: BottomNavigationBarType.fixed,
          ),
        ),
      ),
    );
  }
}
