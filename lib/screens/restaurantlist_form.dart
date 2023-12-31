import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_list/screens/item_list_page.dart';
import 'package:restaurant_list/screens/menu.dart';
import 'package:restaurant_list/widgets/left_drawer.dart';

class RestaurantFormPage extends StatefulWidget {
  const RestaurantFormPage({Key? key});

  @override
  State<RestaurantFormPage> createState() => _RestaurantFormPageState();
}

class _RestaurantFormPageState extends State<RestaurantFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = "";
  int _amount = 0;
  int _price = 0;
  String _description = "";

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Form Tambah Item Mobile',
            style: TextStyle(color: Colors.white), // Warna teks
          ),
        ),
        backgroundColor: Colors.pink, // Warna latar belakang
      ),
      drawer: const LeftDrawer(), // Tambahkan drawer yang sudah dibuat di sini
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Nama Item",
                    labelText: "Nama Item",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _name = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Nama tidak boleh kosong!";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Amount",
                    labelText: "Amount",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    final parsedValue = int.tryParse(value ?? "");
                    if (parsedValue != null && parsedValue >= 0) {
                      setState(() {
                        _amount = parsedValue;
                      });
                    }
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Amount tidak boleh kosong!";
                    }

                    final parsedValue = int.tryParse(value);
                    if (parsedValue == null) {
                      return "Amount harus berupa angka!";
                    }

                    if (parsedValue < 0) {
                      return "Amount harus >= 0!";
                    }

                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Price",
                    labelText: "Price",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    final parsedValue = int.tryParse(value ?? "");
                    if (parsedValue != null && parsedValue >= 0) {
                      setState(() {
                        _price = parsedValue;
                      });
                    }
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Price tidak boleh kosong!";
                    }

                    final parsedValue = int.tryParse(value);
                    if (parsedValue == null) {
                      return "Price harus berupa angka!";
                    }

                    if (parsedValue < 0) {
                      return "Price harus >= 0!";
                    }

                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Description",
                    labelText: "Description",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _description = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Description tidak boleh kosong!";
                    }
                    return null;
                  },
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.indigo),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Simpan data ke ItemRepository
                        itemRepository.items.add(
                          Item(_name, _amount, _price, _description),
                        );

                        // Reset inputan pengguna
                        _formKey.currentState!.reset();

                        // Tampilkan dialog "Item berhasil tersimpan"
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Item berhasil tersimpan'),
                              content: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Nama: $_name'),
                                    Text('Amount: $_amount'),
                                    Text('Price: $_price'),
                                    Text('Deskripsi: $_description'),
                                    // Tambahkan value lainnya jika ada
                                  ],
                                ),
                              ),
                              actions: [
                                TextButton(
                                  child: const Text('OK'),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                    child: const Text(
                      "Save",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
