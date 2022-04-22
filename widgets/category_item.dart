import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../screen/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  CategoryItem(this.id,this.title,this.color);

  void selectCategory(BuildContext ctx){      //important 
    Navigator.of(ctx)
    .pushNamed( 
      CategoryMealsScreen.routeName,
      arguments: {
        'id':id,
        'title':title
        },); // creating map with id and title (key value pair)
  }

  @override
  Widget build(BuildContext context){

    return InkWell(

      onTap: () => selectCategory(context) ,
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15), //should match to card border radius


          child: Container(
        padding: const EdgeInsets.all(16),
        child: Text( title,
          style: Theme.of(context).textTheme.title,
        ),
        decoration: BoxDecoration(gradient: LinearGradient(
          colors:[
            color.withOpacity(0.7),
            color,
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}