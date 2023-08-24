import 'package:colch_stat_app/presentation/widgets/app_bar.dart';
import 'package:colch_stat_app/presentation/widgets/side_menu.dart';
import 'package:flutter/material.dart';
import 'customers_create.dart';

//* Para no tener que definer tantas veses las tarjas solo una ves
const cards = <Map<String,dynamic>>[
  {'elevation': 0.0, 'label': 'Cliente 0'},
  {'elevation': 1.0, 'label': 'Cliente 1'},
  {'elevation': 2.0, 'label': 'Cliente 2'},
  {'elevation': 3.0, 'label': 'Cliente 3'},
  {'elevation': 4.0, 'label': 'Cliente 4'},
  {'elevation': 5.0, 'label': 'Cliente 5'},
];


class CustomersScreen extends StatefulWidget {
  const CustomersScreen({super.key});

  @override
  State<CustomersScreen> createState() => _CustomersScreenState();
}

class _CustomersScreenState extends State<CustomersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: AppBarColch()),
        body: _CustomerView(),

        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CustomersCreate()),
              );
            }),
        drawer: SideMenu(navDrawerIndex: 2));
  }
}

class _CustomerView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ...cards.map(( card ) => _CardType1(elevation: card['elevation'], label: card['label'])),
          ...cards.map(( card ) => _CardType1(elevation: card['elevation'], label: card['label']))
    
        ],
      ),
    );
  }
}

class _CardType1 extends StatelessWidget {

  final String label;
  final double elevation;
  const _CardType1({required this.label, required this.elevation});

  @override
  Widget build(BuildContext context) {
    return Card(elevation: elevation,
    child: Padding(padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
      child: Column(children: [
        Align(
          alignment: Alignment.topRight,
          child: IconButton( 
            icon: const Icon(Icons.more_vert_outlined),
            onPressed: (){},
          )),
          Align(
            alignment: Alignment.bottomLeft,
            child: Text(label),
          )
      ]),
    ),
      
    );
  }
}

