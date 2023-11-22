import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class CookieReq {
  bool loggedIn = false;

  Future<Map<String, dynamic>> register(
      String url, Map<String, String> data) async {
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(data),
      );

      if (response.statusCode == 200) {
        // Set loggedIn to true upon successful registration
        loggedIn = true;

        return jsonDecode(utf8.decode(response.bodyBytes));
      } else {
        throw Exception('Failed to register');
      }
    } catch (error) {
      throw Exception('Failed to register: $error');
    }
  }
}

class RegisterPage extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final request = context.read<CookieReq>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
        backgroundColor: Colors.pink,
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                labelText: 'Username',
              ),
            ),
            const SizedBox(height: 12.0),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            const SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () async {
                String username = _usernameController.text;
                String password = _passwordController.text;

                // Registrasi akun
                final response = await request.register(
                  "https://ghina-nabila21-tugas.pbp.cs.ui.ac.id/auth/register/",
                  {
                    'username': username,
                    'password': password,
                  },
                );

                if (request.loggedIn) {
                  String message = response['message'];
                  String uname = response['username'];
                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(SnackBar(
                        content: Text("$message Selamat datang, $uname.")));

                  // Kembali ke halaman sebelumnya (misalnya halaman login)
                  Navigator.pop(context);
                } else {
                  // Menampilkan pesan kesalahan jika registrasi gagal
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Registrasi Gagal'),
                      content: Text(response['message']),
                      actions: [
                        TextButton(
                          child: const Text('OK'),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  );
                }
              },
              child: const Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
