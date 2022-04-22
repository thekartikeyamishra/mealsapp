import 'package:Meals/dummy_data.dart';
import 'package:Meals/screen/filters_screen.dart';
import 'package:Meals/screen/meal_detail_screen.dart';
import 'package:Meals/screen/tabs_screen.dart';
import 'package:flutter/material.dart';
import './screen/categories_screen.dart';
import './screen/category_meals_screen.dart';
import './screen/meal_detail_screen.dart';
import './screen/tabs_screen.dart';
import 'package:Meals/screen/filters_screen.dart';
import './dummy_data.dart';
import './models/meal.dart';


void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Map<String,bool>_filters =  {

    'gluten':false,
    'lactose':false,
    'vegan': false,
    'vegetarian':false,

  };

  List<Meal> _availableMeals = DUMMY_MEALS;

  void _setFilters(Map<String, bool> filterData){

    setState(() {
      _filters = filterData;


      _availableMeals = DUMMY_MEALS.where((meal){

        if(_filters['gluten']&& !meal.isGlutenFree){
          return false;
        }
         if(_filters['lactose']&& !meal.isLactoseFree){
          return false;
        }
         if(_filters['vegan']&& !meal.isVegan){
          return false;
        }
         if(_filters['vegetarian']&& !meal.isVegetarian){
          return false;
        }
        return true;
      }).toList();

  });
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      title: ' Seeve Meals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor:Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Railway',
        textTheme: ThemeData.light().textTheme.copyWith(

          body1: TextStyle(
            color:Color.fromRGBO(20, 51, 51, 1),
          ),
                    body2: TextStyle(
                      color:Color.fromRGBO(20, 51, 51, 1),
        ),

        title: TextStyle(
          fontSize: 20,
          fontFamily: 'RobotoCondensed',
          fontWeight: FontWeight.bold,
        ),),
      ),
      //home: CategoriesScreen(), //MyHomePage() entry page or  point of app
      //route map

      initialRoute: '/', //default  is  '/'

      routes: {

        '/' : (ctx) => TabsScreen(),   // for home
        CategoryMealsScreen.routeName:(ctx) => CategoryMealsScreen(_availableMeals), //builder function with context
        MealDetailScreen.routeName:(ctx) => MealDetailScreen(), //builder function with context
        FilterScreen.routeName:(ctx)=>FilterScreen(_filters,_setFilters), //builder function with context
      },

     // onGenerateRoute: (setting){
        //print (setting.arguments);
       // return MaterialPageRoute(builder:(ctx)=>CategoriesScreen(),);
      //},
      
      onUnknownRoute: (settings){
        return MaterialPageRoute(builder: (ctx)=> CategoriesScreen(),
        );
      },
    );
  }
}
// Category- meals (not intensiated), category-meals () (intensiated), :(ctx or context) is a builder class