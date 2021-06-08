import 'package:flutter/material.dart';
import 'package:split_it/core/core.dart';

enum Person{add, remove}

class PersonTileWidget extends StatelessWidget {
  final String name;
  final bool isRemovable;

  const PersonTileWidget({
    Key? key,
    required this.name,
    this.isRemovable = false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(AppImages.emoji)),
      title: Text('Nome da pessoa'),
      trailing: isRemovable ?
        IconButton(
          icon: Icon(Icons.remove),
          color: AppColors.redPrimary,
          onPressed: () {  }
        ) :
      IconButton(
          icon: Icon(Icons.add),
          color: AppColors.greenPrimary,
          onPressed: () {  }
      )
    );
  }
}
