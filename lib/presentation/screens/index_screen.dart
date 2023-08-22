// ignore_for_file: prefer_const_constructors
import 'package:colch_stat_app/presentation/widgets/side_menu.dart';
import 'package:flutter/material.dart';

class IndexScreen extends StatelessWidget {
  const IndexScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          /// Así aliemos este row al final
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            CircleAvatar(
              backgroundImage: AssetImage('assets/images/logo.png'),
            ),
            Padding(
              /// de esta forma damos padding horizontal a un widget
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text("Colch Star"),
            )
          ],
        ),
      ),
      body: const Center(
        child: DashboardView(),
      ),
      drawer: SideMenu(navDrawerIndex: 0),
    );
  }
}

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  @override
  Widget build(BuildContext context) {
    return Text("Dashboard");
  }
}
