import 'package:flutter/material.dart';
import 'package:restaurant_list/screens/restaurantlist_form.dart';
import 'package:restaurant_list/screens/item_list_page.dart';
import 'package:restaurant_list/widgets/restaurant_card.dart';
import 'package:restaurant_list/widgets/left_drawer.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  void navigateToShopFormPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RestaurantFormPage(),
      ),
    );
  }

  void navigateToProductPage(BuildContext context) {
    // Route menu ke halaman produk
    Navigator.push(
      context,
      // MaterialPageRoute(builder: (context) => ProductPage()),
      MaterialPageRoute(builder: (context) => ItemsListPage()),
    );
  }

  // Tambahkan fungsi untuk menavigasi ke halaman List of Items
  void navigateToItemsListPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ItemsListPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Restaurant List',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Text(
                  'Ghina2703 Shop',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              GridView.count(
                primary: true,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                shrinkWrap: true,
                children: items.map((RestaurantItem item) {
                  return RestaurantCard(
                    item,
                    onItemTap: () {
                      if (item.name == "Lihat Item Mobile") {
                        navigateToProductPage(context);
                      } else if (item.name == "Tambah Item") {
                        navigateToShopFormPage(context);
                      }
                    },
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
