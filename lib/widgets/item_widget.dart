import 'package:flutter/material.dart';
import 'package:tedx/Speakers/catalog.dart';

class ItemWidget extends StatelessWidget {
  final Item item;

  const ItemWidget({super.key, required this.item});

  

  
 

  @override
  Widget build(BuildContext context) {
    return Card(
      
      child: ListTile(
        leading: Image.network(item.image),
        title: Text(item.name),
        subtitle: Text(item.desc),
      ),
    );
  }
}