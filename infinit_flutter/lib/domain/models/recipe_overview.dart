import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe_overview.freezed.dart';

@freezed
class RecipeOverview with _$RecipeOverview {
  const factory RecipeOverview({
    required String id,
    required String title,
    String? imageUrl,
    required List<String> tags,
  }) = _RecipeOverview;
}
