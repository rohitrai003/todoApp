// This is the appbar for the app.
import 'package:flutter/material.dart';
import 'package:todo_list_app/src/Constant/Color.dart';

customAppBar(String title) => AppBar(
      backgroundColor: kPrimaryColor,
      elevation: 0.0,
      title: Text(
        title,
        style: TextStyle(
          color: kSecondaryColor,
        ),
      ),
      centerTitle: true,
      leading: DrawerButton(
        onPressed: () {},
      ),
    );
