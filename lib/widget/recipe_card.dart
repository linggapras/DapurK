import 'package:flutter/material.dart';
import '../model/meal_model.dart';

class RecipeCard extends StatelessWidget {
  final Meal meal;
  final VoidCallback onTap;

  const RecipeCard({Key? key, required this.meal, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Menangani aksi saat kartu ditekan
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 4,
        margin: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.horizontal(left: Radius.circular(12)),
              child: Image.network(
                meal.thumbnail, // Menampilkan gambar dari URL
                width: 120,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      meal.name, // Nama resep
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 6),
                    Text(
                      "Tap untuk melihat detail resep", // Deskripsi pendek
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
