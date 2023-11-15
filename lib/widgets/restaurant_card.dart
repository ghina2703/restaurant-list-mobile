import 'package:flutter/material.dart';
import 'package:restaurant_list/screens/item_list_page.dart';

class RestaurantItem {
  final String name;
  final IconData icon;
  final Color color;

  RestaurantItem(this.name, this.icon, this.color);
}

final List<RestaurantItem> items = [
  RestaurantItem(
      "Lihat Item", Icons.checklist, const Color.fromARGB(255, 165, 210, 231)),
  RestaurantItem("Tambah Item", Icons.add_shopping_cart,
      const Color.fromARGB(255, 167, 227, 169)),
  RestaurantItem(
      "Logout", Icons.logout, const Color.fromARGB(255, 172, 156, 236)),
];

class RestaurantCard extends StatelessWidget {
  final RestaurantItem item;
  final VoidCallback onItemTap; // Change the parameter type

  const RestaurantCard(this.item, {Key? key, required this.onItemTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: item.color,
      borderRadius: BorderRadius.circular(12.0), // Mengatur border radius
      child: InkWell(
        onTap: () {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("Kamu telah menekan tombol ${item.name}!")));
          if (item.name == "Lihat Produk") {
            // Navigate to the ItemsListPage when "Lihat Produk" is tapped
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const ItemsListPage(),
            ));
          } else {
            onItemTap(); // Call the callback function for navigation
          }
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
