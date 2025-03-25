import 'package:flutter/material.dart';
import 'package:imc_calculator/data/notifiers.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    void _changeTheme() {
      isDarkThemeNotifier.value = !isDarkThemeNotifier.value;
    }

    return ValueListenableBuilder(
      valueListenable: isDarkThemeNotifier,
      builder:
          (context, isDarkTheme, child) => AppBar(
            title: Center(
              child: Text(
                "IMC Calculator",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            backgroundColor: Theme.of(context).primaryColor,
            actions: [
              IconButton(
                onPressed: _changeTheme,
                icon: Icon(isDarkTheme ? Icons.light_mode : Icons.dark_mode),
              ),
            ],
          ),
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, 70);
}
