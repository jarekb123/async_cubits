import 'package:infinit_flutter/api_client/meal_db_api.dart';
import 'package:infinit_flutter/domain/models/recipe_details.dart';
import 'package:infinit_flutter/domain/models/recipe_overview.dart';

abstract interface class RecipeRepository {
  Future<List<RecipeOverview>> searchRecipes({
    String? query,
  });

  Future<RecipeDetails> getRecipeById({
    required String id,
  });
}

class ApiRecipeRepository implements RecipeRepository {
  final MealDbApi _mealDbApi;

  ApiRecipeRepository(this._mealDbApi);

  @override
  Future<RecipeDetails> getRecipeById({required String id}) async {
    final result = await _mealDbApi.lookup(id: id);

    final meal = result.meals.firstOrNull;

    if (meal == null) {
      throw Exception('Recipe $id not found');
    }

    return RecipeDetails(
      id: meal.idMeal,
      title: meal.strMeal,
      imageUrl: meal.strMealThumb,
      tags: meal.strTags?.split(',') ?? [],
      description: meal.strInstructions ?? '',
      ingredients: [
        if (meal.strIngredient1 != null)
          Ingeredient(
            name: meal.strIngredient1 ?? '',
            measure: meal.strMeasure1 ?? '',
          ),
        if (meal.strIngredient2 != null)
          Ingeredient(
            name: meal.strIngredient2 ?? '',
            measure: meal.strMeasure2 ?? '',
          ),
        if (meal.strIngredient3 != null)
          Ingeredient(
            name: meal.strIngredient3 ?? '',
            measure: meal.strMeasure3 ?? '',
          ),
        if (meal.strIngredient4 != null)
          Ingeredient(
            name: meal.strIngredient4 ?? '',
            measure: meal.strMeasure4 ?? '',
          ),
        if (meal.strIngredient5 != null)
          Ingeredient(
            name: meal.strIngredient5 ?? '',
            measure: meal.strMeasure5 ?? '',
          ),
        if (meal.strIngredient6 != null)
          Ingeredient(
            name: meal.strIngredient6 ?? '',
            measure: meal.strMeasure6 ?? '',
          ),
        if (meal.strIngredient7 != null)
          Ingeredient(
            name: meal.strIngredient7 ?? '',
            measure: meal.strMeasure7 ?? '',
          ),
        if (meal.strIngredient8 != null)
          Ingeredient(
            name: meal.strIngredient8 ?? '',
            measure: meal.strMeasure8 ?? '',
          ),
        if (meal.strIngredient9 != null)
          Ingeredient(
            name: meal.strIngredient9 ?? '',
            measure: meal.strMeasure9 ?? '',
          ),
        if (meal.strIngredient10 != null)
          Ingeredient(
            name: meal.strIngredient10 ?? '',
            measure: meal.strMeasure10 ?? '',
          ),
        if (meal.strIngredient11 != null)
          Ingeredient(
            name: meal.strIngredient11 ?? '',
            measure: meal.strMeasure11 ?? '',
          ),
        if (meal.strIngredient12 != null)
          Ingeredient(
            name: meal.strIngredient12 ?? '',
            measure: meal.strMeasure12 ?? '',
          ),
        if (meal.strIngredient13 != null)
          Ingeredient(
            name: meal.strIngredient13 ?? '',
            measure: meal.strMeasure13 ?? '',
          ),
        if (meal.strIngredient14 != null)
          Ingeredient(
            name: meal.strIngredient14 ?? '',
            measure: meal.strMeasure14 ?? '',
          ),
        if (meal.strIngredient15 != null)
          Ingeredient(
            name: meal.strIngredient15 ?? '',
            measure: meal.strMeasure15 ?? '',
          ),
        if (meal.strIngredient16 != null)
          Ingeredient(
            name: meal.strIngredient16 ?? '',
            measure: meal.strMeasure16 ?? '',
          ),
        if (meal.strIngredient17 != null)
          Ingeredient(
            name: meal.strIngredient17 ?? '',
            measure: meal.strMeasure17 ?? '',
          ),
        if (meal.strIngredient18 != null)
          Ingeredient(
            name: meal.strIngredient18 ?? '',
            measure: meal.strMeasure18 ?? '',
          ),
        if (meal.strIngredient19 != null)
          Ingeredient(
            name: meal.strIngredient19 ?? '',
            measure: meal.strMeasure19 ?? '',
          ),
        if (meal.strIngredient20 != null)
          Ingeredient(
            name: meal.strIngredient20 ?? '',
            measure: meal.strMeasure20 ?? '',
          ),
      ],
    );
  }

  @override
  Future<List<RecipeOverview>> searchRecipes({String? query}) async {
    final result = await _mealDbApi.search(query: query ?? '');

    return result.meals
        .map(
          (e) => RecipeOverview(
            id: e.idMeal,
            title: e.strMeal,
            imageUrl: e.strMealThumb,
            tags: e.strTags?.split(',') ?? [],
          ),
        )
        .toList();
  }
}
