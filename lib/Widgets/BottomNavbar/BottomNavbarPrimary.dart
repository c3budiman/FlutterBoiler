import 'package:flutter/material.dart';
import 'package:flutterboiler/Configs/Colors.dart';

class BottomNavbarPrimary extends StatelessWidget {
  const BottomNavbarPrimary({required this.activeBar, required this.onTap});
  final int activeBar;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black,
            blurRadius: 5,
          ),
        ],
      ),
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          onTap(index);
        },
        elevation: 10,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              activeBar == 1 ? Icons.local_play : Icons.local_play_outlined,
            ),
            label: 'Examples',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              activeBar == 2 ? Icons.person : Icons.person_outline,
            ),
            label: 'Profil',
          ),
        ],
        selectedItemColor: Theme.of(context).colorScheme.blueOldTheme,
        currentIndex: activeBar,
      ),
    );
  }
}
