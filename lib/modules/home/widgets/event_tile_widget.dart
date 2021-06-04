import 'package:flutter/material.dart';
import 'package:split_it/core/core.dart';
import 'package:split_it/modules/home/widgets/money_icon_widget.dart';
import 'package:split_it/modules/shared/models/event_model.dart';

class EventTileWidget extends StatelessWidget {
  final EventModel event;

  const EventTileWidget({
    Key? key,
    required this.event
  }) : super(key: key);

  MoneyIconType get type => event.value > 0 ? MoneyIconType.receive : MoneyIconType.send;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MoneyIconWidget(type: type),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: 16),
            child: Column(
              children: [
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(event.title, style: AppTextStyles.eventTileTitle),
                  subtitle: Text(event.date.toString(), style: AppTextStyles.eventTileSubtitle),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 2),
                      Text('R\$ ${event.value}0', style: AppTextStyles.infoCardTitle),
                      SizedBox(height: 5),
                      Text('${event.people} pessoa${event.people == 1 ? '' : 's'}', style: AppTextStyles.eventTileSubtitle)
                    ],
                  ),
                ),
                Divider(height: 2, thickness: 1)
              ],
            ),
          ),
        )
      ],
    );
  }
}
