import 'package:flutter/material.dart';
// MARK: -Star Button Config
class StarButton extends StatefulWidget {
  const StarButton({super.key});

  @override
  State<StarButton> createState() => _StarButtonState();
}

class _StarButtonState extends State<StarButton> {
  bool state = false;
  late final ColorScheme _colorScheme = Theme.of(context).colorScheme;

  Icon get icon {
    final IconData iconData = state ? Icons.star : Icons.star_outline;

    return Icon(iconData, color: const Color.fromARGB(255, 255, 208, 0), size: 20);
  }

  void _toggle() {
    setState(() {
      state = !state;
    });
  }

  double get turns => state ? 1 : 0;

  @override
  Widget build(BuildContext context) {
    return AnimatedRotation(
      turns: turns,
      curve: Curves.decelerate,
      duration: const Duration(milliseconds: 300),
      child: FloatingActionButton(
        elevation: 0,
        shape: const CircleBorder(),
        backgroundColor: _colorScheme.surface,
        onPressed: () => _toggle(),
        child: Padding(padding: const EdgeInsets.all(10.0), child: icon),
      ),
    );
  }
}