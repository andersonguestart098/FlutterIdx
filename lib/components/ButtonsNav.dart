import 'package:flutter/material.dart';

class ButtonNav extends StatefulWidget {
  final Function(int)? onTap;
  final int currentIndex;

  const ButtonNav({
    super.key,
    required this.currentIndex,
  required this.onTap,});

  @override
  _ButtonNavState createState() => _ButtonNavState();
}

class _ButtonNavState extends State<ButtonNav> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: widget.currentIndex,
      onTap: widget.onTap,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add_circle_outline),
          label: 'Adicionar',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Perfil',
        ),
      ],
    );
  }
}
