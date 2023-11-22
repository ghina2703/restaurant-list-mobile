import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_list/screens/item_list_page.dart';
import 'package:restaurant_list/screens/list_product.dart';
import 'package:restaurant_list/screens/login.dart';

class RestaurantItem {
  final String name;
  final IconData icon;
  final Color color;

  RestaurantItem(this.name, this.icon, this.color);
}

final List<RestaurantItem> items = [
  RestaurantItem("Lihat Item Web", Icons.checklist,
      const Color.fromARGB(255, 165, 210, 231)),
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
    final request = context.watch<CookieRequest>();

    return Material(
      color: item.color,
      borderRadius: BorderRadius.circular(12.0), // Mengatur border radius
      child: InkWell(
        onTap: () async {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("Kamu telah menekan tombol ${item.name}!")));
          // if (item.name == "Lihat Produk") {
          //   // Navigate to the ItemsListPage when "Lihat Produk" is tapped
          //   Navigator.of(context).push(MaterialPageRoute(
          //     builder: (context) => const ItemsListPage(),
          //   ));
          if (item.name == "Lihat Item Web") {
            // Navigate to the ItemsListPage when "Lihat Produk" is tapped
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const ProductPage(),
            ));
          } else if (item.name == "Logout") {
            final response = await request.logout(
                // TODO: Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
                "https://ghina-nabila21-tugas.pbp.cs.ui.ac.id/auth/logout/");
            String message = response["message"];
            if (response['status']) {
              String uname = response["username"];
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("$message Sampai jumpa, $uname."),
              ));
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("$message"),
              ));
            }
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
