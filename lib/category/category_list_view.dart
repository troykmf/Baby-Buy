import 'package:baby_buy/services/cloud/cloud_category.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

typedef CategoryCallBack = void Function(CloudCategory categories);

class CategoryListView extends StatelessWidget {
  const CategoryListView({
    Key? key,
    required this.category,
    required this.onDeleteCategory,
    required this.onTap,
  }) : super(key: key);

  final Iterable<CloudCategory> category;
  final CategoryCallBack onDeleteCategory;
  final CategoryCallBack onTap;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: category.length,
      separatorBuilder: (context, index) {
        return const Divider(
          indent: 1.0,
          endIndent: 1.0,
        );
      },
      itemBuilder: (context, index) {
        final category_ = category.elementAt(index);
        return ListTile(
          onTap: () {
            onTap(category_);
          },
          title: Text(
            category_.title,
            maxLines: 1,
            softWrap: true,
            overflow: TextOverflow.ellipsis,
          ),
          subtitle: Text(
            category_.description,
            maxLines: 1,
            softWrap: true,
            overflow: TextOverflow.ellipsis,
          ),
          trailing: IconButton(
            onPressed: () {
              onDeleteCategory(category_);
            },
            icon: const Icon(CupertinoIcons.delete),
          ),
        );
      },
    );
  }
}
