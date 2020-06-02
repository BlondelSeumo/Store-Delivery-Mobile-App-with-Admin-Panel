import 'package:flutter/material.dart';

import '../../generated/l10n.dart';
import '../models/address.dart' as model;

// ignore: must_be_immutable
class DeliveryAddressesItemWidget extends StatelessWidget {
  String heroTag;
  model.Address address;
  ValueChanged<model.Address> onPressed;
  ValueChanged<model.Address> onLongPress;
  ValueChanged<model.Address> onDismissed;

  DeliveryAddressesItemWidget({Key key, this.address, this.onPressed, this.onLongPress, this.onDismissed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (onDismissed != null) {
      return Dismissible(
        key: Key(address.id),
        onDismissed: (direction) {
          this.onDismissed(address);
        },
        child: buildItem(context),
      );
    } else {
      return buildItem(context);
    }
  }

  InkWell buildItem(BuildContext context) {
    return InkWell(
      splashColor: Theme.of(context).accentColor,
      focusColor: Theme.of(context).accentColor,
      highlightColor: Theme.of(context).primaryColor,
      onTap: () {
        this.onPressed(address);
      },
      onLongPress: () {
        this.onLongPress(address);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor.withOpacity(0.9),
          boxShadow: [
            BoxShadow(color: Theme.of(context).focusColor.withOpacity(0.1), blurRadius: 5, offset: Offset(0, 2)),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 55,
              width: 55,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  color: address?.isDefault ?? false ? Theme.of(context).accentColor : Theme.of(context).focusColor),
              child: Icon(
                Icons.place,
                color: Theme.of(context).primaryColor,
                size: 38,
              ),
            ),
            SizedBox(width: 15),
            Flexible(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        address?.description != null
                            ? Text(
                                address.description,
                                overflow: TextOverflow.fade,
                                softWrap: false,
                                style: Theme.of(context).textTheme.subtitle1,
                              )
                            : SizedBox(height: 0),
                        Text(
                          address?.address ?? S.of(context).unknown,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: address?.description != null ? Theme.of(context).textTheme.caption : Theme.of(context).textTheme.subtitle1,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 8),
                  Icon(
                    Icons.keyboard_arrow_right,
                    color: Theme.of(context).focusColor,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
