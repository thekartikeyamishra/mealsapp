import 'package:Meals/screen/filters_screen.dart';
import 'package:flutter/material.dart';
import '../screen/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Widget buildListTile (String title, IconData icon, Function tapHandler){   //making widget builder method for redundent code
      return ListTile(

              leading: Icon(
                icon,     //dynamically generated icons
                size: 26,
            ),

            title: Text(
              title, //dynamically generated titles
              style:TextStyle(
                fontFamily: 'RobotoCondensed',
                fontSize: 24,
                fontWeight: FontWeight.bold,

              ),
            ),

            onTap: tapHandler,
            );
        }
            return Drawer(

      child: Column(
        children:<Widget>[ 

          Container(
          height:120,
          width:double.infinity,
          alignment:Alignment.centerLeft,
          color: Theme.of(context).accentColor,


          child: Text('Cookiing Up!',

          style: TextStyle(
            fontWeight:FontWeight.w900,
            fontSize:30,
            color: Theme.of(context).primaryColor,
          ), ),

          ),

          SizedBox
          (
            height:20,
          ),

          buildListTile(
            'Meals',
             Icons.restaurant,

             () {  //Anonm. function
               Navigator.of(context).pushReplacementNamed('/');
             }

             ), //inisating widget builder method which we made we can also make seprate widget

          buildListTile(
            'Settings',
             Icons.settings,

             (){ //Anonm. Function

             Navigator.of(context).pushReplacementNamed(FilterScreen.routeName);

             }

             ),

        ],
      ),
      
    );
  }
}