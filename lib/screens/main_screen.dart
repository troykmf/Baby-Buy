import 'package:baby_buy/category/category_list_view.dart';
import 'package:baby_buy/services/auth/auth_service.dart';
import 'package:baby_buy/services/cloud/cloud_category.dart';
import 'package:baby_buy/services/cloud/firebase_cloud_category_storage.dart';
import 'package:baby_buy/widgets/drawer_list_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../constants/routes.dart';
import '../widgets/elevated_button_widget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  CloudCategory? category__;
  late final GlobalKey<ScaffoldState> _scaffoldKey;
  late final FirebaseCloudCategoryStorage _categoryService;

  String get userId => AuthService.firebase().currentUser!.id;

  @override
  void initState() {
    _categoryService = FirebaseCloudCategoryStorage();
    _scaffoldKey = GlobalKey<ScaffoldState>();
    super.initState();
  }

  void _openDrawer() {
    _scaffoldKey.currentState!.openDrawer();
  }

  void _closeDrawer() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        drawerEnableOpenDragGesture: true,
        drawer: Drawer(
          backgroundColor: const Color(0xFF00687B),
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 20.0, right: 8.0),
            child: ListView(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CircleAvatar(
                      radius: 50.0,
                      child: Icon(CupertinoIcons.person_alt),
                    ),
                    IconButton(
                      onPressed: () {
                        _closeDrawer();
                      },
                      icon: const Icon(
                        CupertinoIcons.clear_circled,
                        size: 30.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                DrawerListTileWidget(
                  onTap: () {},
                  title: 'Profile',
                  leading: CupertinoIcons.person,
                ),
                DrawerListTileWidget(
                  onTap: () {},
                  title: 'Settings',
                  leading: CupertinoIcons.settings,
                ),
                DrawerListTileWidget(
                  onTap: () {},
                  title: 'About',
                  leading: CupertinoIcons.slowmo,
                ),
                DrawerListTileWidget(
                  onTap: () {},
                  title: 'Support',
                  leading: CupertinoIcons.checkmark_shield_fill,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: ElevatedButtonWidget(
                    text: 'Logout',
                    textStyleColor: Colors.black,
                    onPressed: () async {
                      await AuthService.firebase().logOut();
                      Navigator.of(context).pushNamed(loginRoute);
                    },
                    backgroundColor: const Color(0xFFCEE7EF),
                    borderSideColor: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pushNamed(
              categoryFabRoute,
            );
          },
          backgroundColor: const Color(0xFFCEE7EF),
          child: const Icon(
            CupertinoIcons.add,
            color: Colors.black,
          ),
        ),
        body: StreamBuilder(
          stream: _categoryService.allCategories(ownerUserId: userId),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
              case ConnectionState.active:
                if (snapshot.hasData) {
                  final category1 = category__;
                  final allCategory = snapshot.data as Iterable<CloudCategory>;
                  return ListView(
                    children: [
                      Center(
                        child: TextButton(
                          onPressed: () {
                            _openDrawer();
                          },
                          child: const Text('Open'),
                        ),
                      ),
                      SizedBox(
                        height: 300,
                        // width: double.infinity,
                        //             child: Container(
                        //             child: Column(
                        //
                        //             children: [
                        //               Text(category1!.title)
                        // ],
                        //             ),
                        //             )
                        child: CategoryListView(
                            category: allCategory,
                            onDeleteCategory: (category) async {
                              await _categoryService.deleteCategory(
                                documentId: category.documentId,
                              );
                            },
                            onTap: (category) {
                              Navigator.of(context).pushNamed(
                                categoryFabRoute,
                                arguments: category,
                              );
                            }),
                      ),
                    ],
                  );
                } else {
                  return const CircularProgressIndicator();
                }
              default:
                return const CircularProgressIndicator();
            }
          },
        ));
  }
}
