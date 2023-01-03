import 'package:flutter/material.dart';
import '../widgets/category_item.dart';
import '../widgets/meal_item.dart';

import '../dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {

  static const routeName = '/category-meals';

  // final String categoryId;
  // final String categoryTitle;
  
  // CategoryMealsScreen(this.categoryId,this.categoryTitle);


  @override
  Widget build(BuildContext context) {
    final routeArgs=
      ModalRoute.of(context).settings.arguments as Map<String,String>;
    final categoryTitle=routeArgs['title'];
    final categoryId=routeArgs['id'];
    final categroryMeals=DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx,index){
          return MealItem(
            id: categroryMeals[index].id,
            title: categroryMeals[index].title,
            imageURL: categroryMeals[index].imageUrl,
            duration: categroryMeals[index].duration,
            affordability: categroryMeals[index].affordability,
            complexity: categroryMeals[index].complexity,
          );
        },
        itemCount: categroryMeals.length,
      ),
    );
  }
}