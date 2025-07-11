import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/meal_model.dart';
import '../model/meal_detail_model.dart'; // tambahkan ini

class ApiService {
  static const String baseUrl = "https://www.themealdb.com/api/json/v1/1";

  static Future<List<Meal>> fetchMeals(String category) async {
    final response = await http.get(Uri.parse('$baseUrl/filter.php?c=$category'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List meals = data['meals'];
      return meals.map((json) => Meal.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load meals');
    }
  }

  // ⬇⬇⬇ Tambahkan method ini DI DALAM class ApiService ⬇⬇⬇
  static Future<MealDetail> fetchMealDetail(String id) async {
    final response = await http.get(Uri.parse('$baseUrl/lookup.php?i=$id'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final meal = data['meals'][0];
      return MealDetail.fromJson(meal);
    } else {
      throw Exception('Failed to load meal detail');
    }
  }
}
