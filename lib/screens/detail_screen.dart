import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:wisatacandi/models/candi.dart';

class DetailScreen extends StatelessWidget{
  final Candi candi;

  const DetailScreen ({super.key, required this.candi});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //Header
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal : 8),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    candi.imageAsset,
                    width: double.infinity,
                    height: 300,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              //Tombol Back Custom
              Padding(
                padding: const EdgeInsets.all(16),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.deepPurple[100]?.withOpacity(0.8),
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    onPressed: (){}, 
                    icon: const Icon(Icons.arrow_back)
                    ),
                ),
              ),
            ],
          ),
          // Deatil Info
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Info Atas
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      candi.name,
                      style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                      onPressed: (){}, 
                      icon: const Icon(Icons.favorite_border))
                  ],
                ),
                //Info Tengah
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.calendar_month, 
                      color: Colors.blue,
                    ),
                    const SizedBox(
                      width: 0,
                    ),
                    const SizedBox(
                      width: 70,
                      child: Text(
                        'Di bangun',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(': ${candi.built}')
                  ],
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.house, 
                      color: Colors.green,
                    ),
                    const SizedBox(
                      width: 0,
                    ),
                    const SizedBox(
                      width: 70,
                      child: Text(
                        'Tipe',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(': ${candi.type}')
                  ],
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.place, 
                      color: Colors.red,
                    ),
                    const SizedBox(
                      width: 0,
                    ),
                    const SizedBox(
                      width: 70,
                      child: Text(
                        'Lokasi',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(': ${candi.location}')
                  ],
                ),
                //pemisah
                const SizedBox(
                  height: 16,
                ),
                Divider(
                  color: Colors.deepPurple.shade100,
                ),
                const SizedBox(
                  height: 16,
                ),
                //Info Bawah
                const Text(
                  'Deskripsi',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                  ),
                ),
                const SizedBox(height: 16,),
                Text(
                  candi.description,
                )
              ],
            )
          ),
          // GALLERY
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 8,
                ),
                Divider(color: Colors.deepPurple.shade100,
                ),
                const SizedBox(
                  height: 16,
                ),
                const Text(
                  'Galeri',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  ),
                const SizedBox(
                  height: 10,
                  ),
                  SizedBox(
                    height: 100,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: candi.imageUrls.length,
                      itemBuilder: (context, index){
                        return Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: GestureDetector(
                            onTap: (){},
                        child: Container(
                          decoration: BoxDecoration(),
                          child: CachedNetworkImage(
                            imageUrl: candi.imageUrls[index]),
                            ),
                          )
                        );
                      },
                    ),
                  ),
                const SizedBox(
                  height: 4,
                ),
                const Text(
                  'Tap untuk memperbesar', 
                  style: TextStyle(fontSize: 12,color: Colors.black54)
                  ),
              ],
            ) 
          )
        ],
      ),
    );
  }

  
}