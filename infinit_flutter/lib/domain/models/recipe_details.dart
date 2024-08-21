import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe_details.freezed.dart';

@freezed
class RecipeDetails with _$RecipeDetails {
  const factory RecipeDetails({
    required String id,
    required String title,
    String? imageUrl,
    required List<String> tags,
    required String description,
    required List<Ingeredient> ingredients,
  }) = _RecipeDetails;
}

@freezed
class Ingeredient with _$Ingeredient {
  const factory Ingeredient({
    required String name,
    required String measure,
  }) = _Ingeredient;
}
