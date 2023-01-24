import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:list/AppText.dart';
import 'package:list/ghj.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Main(),
    );
  }
}

class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);

  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              'assets/images/14.jpg',
            ),
            const Text(
              AppText.jomoktor,
              style: TextStyle(fontSize: 40, color: Color(0xFF3169FA)),
            ),
            ListView.builder(
              physics: const ScrollPhysics(),
              shrinkWrap: true,
              itemCount: appText.length,
              prototypeItem: ListTile(
                title: Text(appText.first),
              ),
              itemBuilder: (BuildContext context, index) {
                return ListTile(
                  title: GestureDetector(
                    onDoubleTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Ghj(),
                        ),
                      );
                    },
                    child: Text(
                      appText[index],
                      style: const TextStyle(
                        fontSize: 20,
                        color: Color(0xFF0E5EA3),
                      ),
                    ),
                  ),
                  subtitle: const Divider(
                    thickness: 1,
                    color: Colors.black,
                    height: 50,
                  ),
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: true,
        showUnselectedLabels: true,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        fixedColor: const Color(0xFF0E5EA3),
        unselectedItemColor: const Color(0xFF0E5EA3),
        items: [
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(
              "assets/svg/Home.svg",
              color: Colors.green,
            ),
            icon: SvgPicture.asset(
              "assets/svg/Home.svg",
            ),
            label: 'Үй',
          ),
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(
              "assets/svg/Vecto1r.svg",
              color: const Color.fromARGB(255, 71, 192, 75),
            ),
            icon: SvgPicture.asset(
              "assets/svg/Vecto1r.svg",
            ),
            label: 'Категориялар',
          ),
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(
              "assets/svg/Vector.svg",
              color: Colors.green,
            ),
            icon: SvgPicture.asset(
              "assets/svg/Vector.svg",
            ),
            label: 'Жомоктор',
          ),
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(
              "assets/svg/Provil.svg",
              color: Colors.green,
            ),
            icon: SvgPicture.asset(
              "assets/svg/Provil.svg",
            ),
            label: 'Профиль',
          ),
        ],
      ),
    );
  }
}
