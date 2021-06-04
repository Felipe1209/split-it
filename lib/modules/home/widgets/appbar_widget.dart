import 'package:flutter/material.dart';
import 'package:split_it/core/core.dart';
import 'package:split_it/modules/login/models/user_model.dart';

import 'info_card_widget.dart';
import 'money_icon_widget.dart';

class AppBarWidget extends PreferredSize {
  final UserModel user;
  final VoidCallback onTap;

  AppBarWidget({required this.user, required this.onTap})
      : super(
          preferredSize: Size.fromHeight(310),
          child: Stack(
            children: [
              Container(
                color: AppColors.greenPrimary,
                height: 244,
              ),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 62),
                    child: ListTile(
                      leading: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(user.photoUrl!)),
                      title:
                          Text(user.name!, style: AppTextStyles.appBar),
                      trailing: GestureDetector(
                        child: Container(
                            height: 62,
                            width: 60,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(width: 1, color: AppColors.white)),
                            child:
                                Icon(Icons.add, color: AppColors.white)),
                        onTap: onTap,
                      ),
                    ),
                  ),
                  SizedBox(height: 36),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InfoCardWidget(
                          type: MoneyIconType.receive,
                          label: 'A receber',
                          value: '145,00',
                          textStyle: AppTextStyles.infoCardReceive
                      ),
                      InfoCardWidget(
                          type: MoneyIconType.send,
                          label: 'A pagar',
                          value: '81,50',
                          textStyle: AppTextStyles.infoCardGive
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        );
}
