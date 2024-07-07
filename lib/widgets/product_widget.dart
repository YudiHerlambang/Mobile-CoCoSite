import 'package:flutter/material.dart';

class ProductWidget extends StatefulWidget {
  const ProductWidget({super.key, required product});

  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  int _qtyProduct = 1;

  void _reduceQty() {
    setState(() {
      if(_qtyProduct > 1) {
      _qtyProduct--;
      }
    });
  }

  void _addQty() {
    setState(() {
      _qtyProduct++;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: _reduceQty,
          icon: const Icon(Icons.remove),
          iconSize: 24,
          color: Colors.black,
        ),
        Text("$_qtyProduct", style: const TextStyle(fontSize: 22, ),),
        IconButton(
          onPressed: _addQty,
          icon: const Icon(Icons.add),
          iconSize: 24,
          color: Colors.black,
        ),
      ],
    );
  }
}