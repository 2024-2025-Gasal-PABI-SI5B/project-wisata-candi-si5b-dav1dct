import 'package:flutter/material.dart';
import '../data/favorite_data.dart';
import 'detail_screen.dart';

class FavoriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Candi Favorit')),
      body: favoriteCandies.isEmpty
          ? Center(child: Text('Belum ada candi favorit'))
          : ListView.builder(
              itemCount: favoriteCandies.length,
              itemBuilder: (context, index) {
                final candi = favoriteCandies[index];
                return ListTile(
                  leading: Image.asset(
                    candi.gallery[0],
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  title: Text(candi.name),
                  subtitle: Text(candi.location),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailScreen(candi: candi),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}
