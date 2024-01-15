import 'package:flutter/material.dart';

AppBar appBarWidget({required String title}) {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 2,
    shadowColor: Colors.grey.shade300,
    shape:
        OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade50)),
    centerTitle: true,
    title: Text(
      title,
      style: const TextStyle(fontWeight: FontWeight.bold),
    ),
  );
}
