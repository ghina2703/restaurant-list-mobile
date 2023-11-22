// item_detail_page.dart
import 'package:flutter/material.dart';
import 'package:restaurant_list/screens/item_list_page.dart';
import 'package:restaurant_list/screens/list_product.dart';

class ItemDetailPage extends StatelessWidget {
  final Item item;

  const ItemDetailPage({required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Items Mobile Detail',
            style: TextStyle(color: Colors.white), // Warna teks
          ),
        ),
        backgroundColor: Colors.pink, // Warna latar belakang
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item.name,
              style: const TextStyle(
                color: Colors.indigo,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Amount: ${item.amount}',
              style: const TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Price: ${item.price}',
              style: const TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Description: ${item.description}',
              style: const TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
