 import 'dart:io';

import 'package:flutter/material.dart';

class ContainerItems extends StatelessWidget {
  final String imageUrl;
  final VoidCallback onTap;
  const ContainerItems({super.key, required this.imageUrl, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return 
    GestureDetector(
      onTap: onTap,
      child: Container(
        clipBehavior: Clip.antiAlias,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(fit: BoxFit.cover, 
          image: FileImage(File(imageUrl))),
        ),
      ),
    );
  }
}
