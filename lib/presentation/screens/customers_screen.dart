import 'package:colch_stat_app/presentation/widgets/app_bar.dart';
import 'package:colch_stat_app/presentation/widgets/side_menu.dart';
import 'package:flutter/material.dart';
import 'customers_create.dart';

//* Para no tener que definer tantas beses las tarjas solo una ves
const cards = <Map<String, dynamic>>[
  {
    'elevation': 4.0,
    'name': 'Jesús',
    'lastName': 'Cochero',
    'phone': '32341231',
    'email': 'jesus@gmail.com',
    'address': 'Calle 20 # 80-20',
    'state': true,
  },
  {
    'elevation': 4.0,
    'name': 'Briana',
    'lastName': 'Dispareja',
    'phone': '32341231',
    'email': 'Briana@gmail.com',
    'address': 'Calle 20 # 80-20',
    'state': true,
  },
  {
    'elevation': 4.0,
    'name': 'Herlyn',
    'lastName': 'Jose',
    'phone': '32341231',
    'email': 'herlyn@gmail.com',
    'address': 'Calle 20 # 80-20',
    'state': false,
  },
  {
    'elevation': 4.0,
    'name': 'Tomas',
    'lastName': 'Sanchez',
    'phone': '32341231',
    'email': 'tomas@gmail.com',
    'address': 'Calle 20 # 80-20',
    'state': true,
  },
  {
    'elevation': 4.0,
    'name': 'Brian',
    'lastName': 'Pareja',
    'phone': '32341231',
    'email': 'brian@gmail.com',
    'address': 'Calle 20 # 80-20',
    'state': false,
  },
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
            child: const Icon(Icons.person_add_outlined),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const CustomersCreate()),
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
          const Padding(
            padding: EdgeInsets.all(17.0),
            child: Text(
              "Lista de clientes",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
            ),
          ),
          ...cards.map((card) => _CardCustomer(
                elevation: card['elevation'],
                name: card['name'],
                lastName: card['lastName'],
                phone: card['phone'],
                email: card["email"],
                address: card['address'],
                state: card['state'],
              ))
        ],
      ),
    );
  }
}

const textCardStyle = TextStyle(fontSize: 17);
const labelCardStyle = TextStyle(
  fontSize: 20,
);

class _CardCustomer extends StatefulWidget {
  final String name;
  final String? lastName;
  final String phone;
  final String email;
  final String address;
  bool state;
  final double elevation;

  _CardCustomer(
      {required this.name,
      required this.elevation,
      this.lastName,
      required this.phone,
      required this.email,
      required this.address,
      required this.state});

  @override
  State<_CardCustomer> createState() => _CardCustomerState();
}

class _CardCustomerState extends State<_CardCustomer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 10),
      child: Card(
        // ignore: prefer_const_constructors
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            side: BorderSide(color: Colors.black)),
        elevation: widget.elevation,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
          child: Column(children: [
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Center(
                    child: Text(
                  '${widget.name} ${widget.lastName}',
                  style: labelCardStyle,
                )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Teléfono: ${widget.phone}',
                  style: textCardStyle,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Email: : ${widget.email}',
                  style: textCardStyle,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Dirección: : ${widget.address}',
                  style: textCardStyle,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.edit_sharp,
                    color: Color.fromARGB(255, 7, 135, 194),
                  ),
                  onPressed: () {},
                ),
                const SizedBox(
                  width: 100,
                ),
                IconButton(
                  icon: widget.state
                      ? const Icon(
                          Icons.toggle_off,
                          color: Color.fromARGB(255, 7, 135, 194),
                        )
                      : const Icon(Icons.toggle_off,
                          color: Color.fromARGB(255, 194, 29, 7)),
                  onPressed: () {
                    setState(() {
                      widget.state = !widget.state;
                    });
                  },
                ),

                // SwitchListTile(value: true, onChanged: (value) {})
              ],
            ),
          ]),
        ),
      ),
    );
  }
}

// class _CardType1 extends StatelessWidget {
//   final String label;
//   final double elevation;
//   const _CardType1({required this.label, required this.elevation});

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: elevation,
//       child: Padding(
//         padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
//         child: Column(children: [
//           Align(
//               alignment: Alignment.topRight,
//               child: IconButton(
//                 icon: const Icon(Icons.more_vert_outlined),
//                 onPressed: () {},
//               )),
//           Align(
//             alignment: Alignment.bottomLeft,
//             child: Text(label),
//           )
//         ]),
//       ),
//     );
//   }
// }
