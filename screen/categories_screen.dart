import 'dart:io';
import 'package:Meals/dummy_data.dart';
import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget{
@override
Widget build(BuildContext context){

  return  GridView(
      padding:const EdgeInsets.all(26),

  children: DUMMY_CATEGORIES.map((catData) =>CategoryItem(
    catData.id,
    catData.title, 
    catData.color,
    ),
   ).toList(), // using widget we created
  
  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
    maxCrossAxisExtent: 200,
    childAspectRatio: 3/2,
    crossAxisSpacing: 20,
    mainAxisSpacing: 20,
  ),
  
  );

 } //build

} //Stateless Widget