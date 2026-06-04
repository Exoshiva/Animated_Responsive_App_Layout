import 'package:animated_responsive_layout/theme/app_theme.dart';
import 'package:flutter/material.dart';


import 'animations.dart';
import 'models/data.dart' as data;
import 'models/models.dart';
import 'transitions/list_detail_transition.dart';
import 'widgets/animated_floating_action_button.dart';
import 'widgets/disappearing_bottom_navigation_bar.dart'; // Add import
import 'widgets/disappearing_navigation_rail.dart'; // Add import
import 'widgets/email_list_view.dart';
import 'widgets/reply_list_view.dart';


void main() {
  runApp(const MainApp());
}

// MARK: - MainApp Entry Point (Jetzt als Stateful Widget!)
class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  ThemeMode _themeMode = ThemeMode.system;

  void toggleTheme() {
    setState(() {
      _themeMode = _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: _themeMode,
      home: Feed(
        currentUser: data.user_0,
        onThemeToggle: toggleTheme, 
      ),
    );
  }
}



// MARK: - Feed Widget (UI Frame)
class Feed extends StatefulWidget {
  const Feed({
    super.key, 
    required this.currentUser,
    required this.onThemeToggle, 
  });

  final User currentUser;
  final VoidCallback onThemeToggle; 

  @override
  State<Feed> createState() => _FeedState();
}

// MARK: Feed State & Layout
class _FeedState extends State<Feed> with SingleTickerProviderStateMixin {
  late final _colorScheme = Theme.of(context).colorScheme;
  late final _backgroundColor = Color.alphaBlend(
    _colorScheme.primary.withAlpha(36),
    _colorScheme.surface,
  );

  late final _controller = AnimationController(
    duration: const Duration(milliseconds: 1000),
    reverseDuration: const Duration(milliseconds: 1250),
    value: 0,
    vsync: this,
  );
  late final _railAnimation = RailAnimation(parent: _controller);
  late final _railFabAnimation = RailFabAnimation(parent: _controller);
  late final _barAnimation = BarAnimation(parent: _controller);

  int selectedIndex = 0;
  bool controllerInitialized = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final double width = MediaQuery.of(context).size.width;
    
    final AnimationStatus status = _controller.status;
    if( width > 600) {
      if (status != AnimationStatus.forward &&
          status != AnimationStatus.completed) {
        _controller.forward();
      }
    } else {
      if (status != AnimationStatus.reverse &&
          status != AnimationStatus.dismissed) {
        _controller.reverse();
      }
    }
    if (!controllerInitialized) {
      controllerInitialized= true;
      _controller.value = width > 600 ? 1 :0;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

// MARK: - Layout Config
  @override
  Widget build(BuildContext context) {

    return AnimatedBuilder(
      animation: _controller, 
      builder: (context, _) {
        return Scaffold(
          body: Row(
            children: [
              DisappearingNavigationRail(
                railAnimation: _railAnimation,
                railFabAnimation: _railFabAnimation,
                selectedIndex: selectedIndex,
                backgroundColor: _backgroundColor, 
                onDestinationSelected: (index) {
                  setState(() {
                    selectedIndex = index;
                  });
                },
              ),
            Expanded(
              child: Container(
                color: _backgroundColor,

                  child: ListDetailTransition(
                    animation: _railAnimation,  
                  
                  one:EmailListView(
                    selectedIndex: selectedIndex,
                  onSelected: (index) {
                    setState (() {
                      selectedIndex = index;
                    });
                  },
                  currentUser: widget.currentUser
                ),
                two: const ReplyListView(),
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: AnimatedFloatingActionButton(
            animation: _barAnimation,
            onPressed: () {},
            child: const Icon(Icons.add),
          ),
          bottomNavigationBar: DisappearingBottomNavigationBar(
            barAnimation: _barAnimation,
            selectedIndex: selectedIndex,
            onDestinationSelected: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
          ),
        );
      },
    );
  }
}