import 'package:flutter/material.dart';

import '../../generated/l10n.dart';
import '../elements/SearchWidget.dart';

class SearchBarWidget extends StatelessWidget {
  final ValueChanged onClickFilter;

  const SearchBarWidget({Key key, this.onClickFilter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(SearchModal());
      },
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(
              color: Theme.of(context).focusColor.withOpacity(0.2),
            ),
            borderRadius: BorderRadius.circular(4)),
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 12, left: 0),
              child: Icon(Icons.search, color: Theme.of(context).accentColor),
            ),
            Expanded(
              child: Text(
                S.of(context).search_for_markets_or_products,
                maxLines: 1,
                style: Theme.of(context).textTheme.caption.merge(TextStyle(fontSize: 14)),
              ),
            ),
            InkWell(
              onTap: () {
                onClickFilter('e');
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 5, left: 5, top: 3, bottom: 3),
                child: Icon(Icons.filter_list, color: Theme.of(context).accentColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
