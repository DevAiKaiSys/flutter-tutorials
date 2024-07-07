import 'package:fitness_dashboard_ui/widgets/dashboard_widget.dart';
import 'package:fitness_dashboard_ui/widgets/side_menu_widget.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          const Expanded(
            flex: 2,
            child: SideMenuWidget(),
          ),
          const Expanded(
            flex: 7,
            child: DashboardWidget(),
          ),
          Expanded(
            flex: 3,
            child: Container(color: Colors.green),
          ),
        ],
      ),
    );
  }
}
