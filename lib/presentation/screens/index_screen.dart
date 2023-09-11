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
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        DashboardBox(label: 'Clientes', icon: Icons.people, total: 0),
        SizedBox(height: 20),
        DashboardBox(label: 'Ventas', icon: Icons.attach_money, total: 0),
      ],
    ));
  }
}

class DashboardBox extends StatelessWidget {
  final String label;
  final IconData icon;
  final int total;

  const DashboardBox({
    Key? key,
    required this.label,
    required this.icon,
    required this.total,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 130,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 40,
            color: Colors.white,
          ),
          SizedBox(height: 5),
          Text(
            label,
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          SizedBox(height: 5),
          Text(
            'Total: $total',
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
