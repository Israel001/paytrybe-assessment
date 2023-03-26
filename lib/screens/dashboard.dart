import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:paytrybe/screens/home.dart';

class Dashboard extends ConsumerStatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  ConsumerState<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends ConsumerState<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(247, 249, 253, 1),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Image.asset("assets/home.png"),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/transactions.png"),
            label: 'Transactions',
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/card.png"),
            label: 'Card',
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/settings.png"),
            label: 'Settings',
          ),
        ],
        currentIndex: 0,
        selectedItemColor: const Color.fromRGBO(0, 124, 255, 1),
        unselectedItemColor: const Color.fromRGBO(142, 152, 168, 1),
        showUnselectedLabels: true,
      ),
      body: PageView(
        children: const [Home(key: Key("home"))],
      ),
    );
  }
}
