import 'package:equatable/equatable.dart';

class NutritionalInfo extends Equatable {
  final int calories;
  final double fat;
  final double carbohydrates;
  final double protein;

  const NutritionalInfo({
    required this.calories,
    required this.fat,
    required this.carbohydrates,
    required this.protein,
  });

  @override
  List<Object?> get props => [calories, fat, carbohydrates, protein];

  factory NutritionalInfo.fromJson(Map<String, dynamic> json) {
    return NutritionalInfo(
      calories: json['calories'],
      fat: json['fat'].toDouble(),
      carbohydrates: json['carbohydrates'].toDouble(),
      protein: json['protein'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'calories': calories,
      'fat': fat,
      'carbohydrates': carbohydrates,
      'protein': protein,
    };
  }
}