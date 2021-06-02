import 'package:flutter/material.dart';
import 'package:split_it/core/core.dart';
import 'package:split_it/modules/login/models/user_model.dart';

class AppBarWidget extends PreferredSize{
  final UserModel user;
  final VoidCallback onTap;

  AppBarWidget({required this.user, required this.onTap}) : super(
    preferredSize: Size.fromHeight(244),
    child: Container(
      height: 244,
      decoration: BoxDecoration(
          color: AppColors.greenPrimary
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 62),
        child: Column(
          children: [
            ListTile(
              leading: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(user.photoUrl!)),
              title: Text(user.name!, style: AppTextStyles.appBar),
              trailing: GestureDetector(
                child: Container(
                    height: 62,
                    width: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(width: 1, color: AppColors.white)
                    ),
                    child: Icon(Icons.add, color: AppColors.white)
                ),
                onTap: onTap,
              ),
            )
          ],
        ),
      ),
    ),
  );

}

/*
Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                        height: 62,
                        width: 62,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(user.photoUrl!)
                    )),
                    SizedBox(width: 10),
                    Text(user.name!, style: AppTextStyles.appBar),
                  ]),
                GestureDetector(
                  child: Container(
                    height: 62,
                    width: 62,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(width: 2, color: AppColors.white)
                    ),
                    child: Icon(Icons.add, color: AppColors.white)
                  ),
                  onTap: (){},
                )
              ],
            ),
 */
