// lib/screens/profile_screen.dart
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login_screen.dart';
import 'dart:async';

class ProfileScreen extends StatelessWidget {
  Future<void> _logout(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('username');
    await prefs.remove('password');
    await prefs.remove('loginTime');
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );

     Future<Map<String, dynamic>> _getUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? username = prefs.getString('username');
    String? profileImage = prefs.getString('profileImage'); // Asumsikan ada path gambar
    String? loginTimeString = prefs.getString('loginTime');
    DateTime? loginTime = loginTimeString != null
        ? DateTime.tryParse(loginTimeString)
        : null;
    return {
      'username': username,
      'profileImage': profileImage,
      'loginTime': loginTime,
    };
  }
  String _getLoginDuration(DateTime? loginTime) {
    if (loginTime == null) return 'Waktu login tidak tersedia';
    final duration = DateTime.now().difference(loginTime);
    final hours = duration.inHours;
    final minutes = duration.inMinutes % 60;
    return '$hours jam $minutes menit';
  }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Logout berhasil.')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profil Pengguna')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Selamat datang di profil Anda!"),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _logout(context),
              child: Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
