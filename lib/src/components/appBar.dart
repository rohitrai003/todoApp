// This is the appbar for the app.
import 'package:flutter/material.dart';
import 'package:todo_list_app/src/Constant/Color.dart';

customAppBar(BuildContext context, String title) => AppBar(
    backgroundColor: kPrimaryColor,
    elevation: 0.0,
    title: Text(
      title,
      style: TextStyle(
          color: kSecondaryColor,
          fontFamily: 'MagnoliaScript',
          fontSize: 25,
          letterSpacing: 1),
    ),
    centerTitle: true,
    leading: Builder(
        builder: (context) => // Ensure Scaffold is in context
            IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {},
            )
        // onPressed: () => Scaffold.of(context).openDrawer()),
        ));
