import 'package:flutter/material.dart';
import '../../services/api_service.dart';
import '../../model/meal_model.dart';
import 'detail_page.dart';
import 'recipe_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Meal>> _mealsFuture;

  @override
  void initState() {
    super.initState();
    _mealsFuture = ApiService.fetchMeals("Chicken"); // Memuat data resep dari API
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Simple Recipes"),
        backgroundColor: Colors.deepOrange,
        elevation: 0,
      ),
      body: FutureBuilder<List<Meal>>(
        future: _mealsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator()); // Tampilkan loading
          } else if (snapshot.hasError) {
            return Center(child: Text('Gagal memuat data: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Resep tidak ditemukan.'));
          } else {
            final meals = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: GridView.builder(
                itemCount: meals.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  childAspectRatio: 3 / 1.2,
                  mainAxisSpacing: 12,
                ),
                itemBuilder: (context, index) {
                  final meal = meals[index];
                  return RecipeCard(
                    meal: meal,
                    onTap: () {
                      // Navigasi ke halaman detail saat kartu ditekan
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailPage(mealId: meal.id),
                        ),
                      );
                    },
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
