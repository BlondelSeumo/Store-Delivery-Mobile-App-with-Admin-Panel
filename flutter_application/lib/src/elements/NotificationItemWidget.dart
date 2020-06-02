import 'package:flutter/material.dart';
import 'package:intl/intl.dart' show DateFormat;

import '../helpers/helper.dart';
import '../models/notification.dart' as model;

class NotificationItemWidget extends StatelessWidget {
  final model.Notification notification;

  NotificationItemWidget({Key key, this.notification}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Stack(
          children: <Widget>[
            Container(
              width: 75,
              height: 75,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(begin: Alignment.bottomLeft, end: Alignment.topRight, colors: [
                    Theme.of(context).focusColor.withOpacity(0.7),
                    Theme.of(context).focusColor.withOpacity(0.05),
                  ])),
              child: Icon(
                Icons.notifications,
                color: Theme.of(context).scaffoldBackgroundColor,
                size: 40,
              ),
            ),
            Positioned(
              right: -30,
              bottom: -50,
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(150),
                ),
              ),
            ),
            Positioned(
              left: -20,
              top: -50,
              child: Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(150),
                ),
              ),
            )
          ],
        ),
        SizedBox(width: 15),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(
                Helper.of(context).trans(notification.type),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: Theme.of(context).textTheme.bodyText1,
              ),
              Text(
                DateFormat('yyyy-MM-dd - HH:mm').format(notification.createdAt),
                style: Theme.of(context).textTheme.caption,
              )
            ],
          ),
        )
      ],
    );
  }
}
