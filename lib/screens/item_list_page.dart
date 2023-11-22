import 'package:flutter/material.dart';
import 'package:restaurant_list/screens/item_detail_page.dart';

class Item {
  final String name;
  final int amount;
  final int price;
  final String description;

  Item(this.name, this.amount, this.price, this.description);
}

class ItemRepository {
  List<Item> items = [];

  static final ItemRepository _instance = ItemRepository._internal();

  factory ItemRepository() {
    return _instance;
  }

  ItemRepository._internal();
}

final itemRepository = ItemRepository();

class ItemsListPage extends StatelessWidget {
  const ItemsListPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Items Mobile List',
            style: TextStyle(color: Colors.white), // Warna teks
          ),
        ),
        backgroundColor: Colors.pink, // Warna latar belakang
      ),
      body: ListView.builder(
        itemCount: itemRepository.items.length,
        itemBuilder: (context, index) {
          final item = itemRepository.items[index];
          return ListTile(
            title: Text(
              item.name,
              style: const TextStyle(
                color: Colors.indigo,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ItemDetailPage(item: item),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
