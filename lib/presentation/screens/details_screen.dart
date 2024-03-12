import 'package:colch_stat_app/infrastruture/models/sale_model.dart';
import 'package:flutter/material.dart';

const titleOrderStyle = TextStyle(fontWeight: FontWeight.bold, color: Colors.black);
const textOrderStyle = TextStyle(fontSize: 17,  color: Colors.black);


class OrderDetailsScreen extends StatelessWidget {
  final List<OrderDetailModel> orderDetailsList;

  const OrderDetailsScreen({Key? key, required this.orderDetailsList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF252432),
        title: Text(
          'Detalles de la orden',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: orderDetailsList.map((detail) {
            return _CardOrderDetail(
              quantity: detail.quantity,
              description: detail.description,
              size: detail.size,
              color: detail.color,
              productName: detail.productName,
            );
          }).toList(),
        ),
      ),
    );
  }
}

class _CardOrderDetail extends StatefulWidget {
  final int quantity;
  final String description;
  final String size;
  final String color;
  final String productName;

  const _CardOrderDetail({
    required this.quantity,
    required this.description,
    required this.size,
    required this.color,
    required this.productName,
  });

  @override
  State<_CardOrderDetail> createState() => _CardOrderDetailState();
}

class _CardOrderDetailState extends State<_CardOrderDetail> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Producto: ${widget.productName}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('Cantidad: ${widget.quantity}', style: TextStyle(fontSize: 16)),
            SizedBox(height: 8),
            Text('Description: ${widget.description}', style: TextStyle(fontSize: 16)),
            SizedBox(height: 8),
            Text('Talla: ${widget.size}', style: TextStyle(fontSize: 16)),
            SizedBox(height: 8),
            Text('Color: ${widget.color}', style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}