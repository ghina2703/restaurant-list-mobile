import 'package:flutter/material.dart';

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
  const ItemsListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List of Items'),
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
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Amount: ${item.amount}",
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
                Text(
                  "Price: ${item.price}",
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
                Text(
                  "Description: ${item.description}",
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
