import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';
import '../dummy_data.dart';
// import '../model/meal.dart';
class CategoryMealScreen extends StatelessWidget {
  static const routeName = '/category-meals';
  // final String categoryId;
  // final String categoryTitle;

  // CategoryMealScreen(this.categoryId,this.categoryTitle);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
      ModalRoute.of(context).settings.arguments as Map<String, String>;
      final  categoryId = routeArgs['id'];
      final  categoryTitle = routeArgs['title'];
      final  categoryMeals = DUMMY_MEALS.where((meal){
        return meal.categories.contains(categoryId);
      }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body:ListView.builder(
        itemBuilder: (ctx, index)
        {
          return MealItem(
            title: categoryMeals[index].title,
            imageUrl: categoryMeals[index].imageUrl,
            duration: categoryMeals[index].duration,
            complexity: categoryMeals[index].complexity,
            affordability: categoryMeals[index].affordability,
          );
      },
      itemCount:categoryMeals.length ,),
    );
  }
}