import 'package:flutter/material.dart';
import '../../services/api_service.dart';
import '../../model/meal_detail_model.dart';

class DetailPage extends StatelessWidget {
  final String mealId;

  const DetailPage({Key? key, required this.mealId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Recipe Detail"),
        backgroundColor: Colors.deepOrange,
      ),
      body: FutureBuilder<MealDetail>(
        future: ApiService.fetchMealDetail(mealId), // Mengambil detail resep dari API
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator()); // Loading indicator
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final meal = snapshot.data!;
            return SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      meal.thumbnail,
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    meal.name,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "Description:",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(meal.instructions), // Instruksi memasak
                  const SizedBox(height: 16),
                  const Text(
                    "Ingredients:",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  ...meal.ingredients.map((ing) => Text('• $ing')), // Daftar bahan
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
