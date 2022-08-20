// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/controllers/home_controller.dart';
import 'package:task/ui/home/home_widget.dart';
import '../../models/user_model.dart';

class HomeList extends StatefulWidget {
  const HomeList({Key? key}) : super(key: key);

  @override
  State<HomeList> createState() => _HomeListState();
}

class _HomeListState extends State<HomeList> {
  HomeController homeController = HomeController.to;

  @override
  void initState() {
    homeController.fetchAllusersList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Home'),
        automaticallyImplyLeading: false,
        actions: const [],
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 35,
            child: Align(
              alignment: Alignment.centerRight,
              child: Container(
                width: 60,
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.08),
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(8),
                        topLeft: Radius.circular(8))),
                child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: BorderSide.none,
                    ),
                    onPressed: () {
                      Get.bottomSheet(Container(
                        padding: EdgeInsets.only(top: 20, left: 10, right: 10),
                        height: 250,
                        color: Colors.white,
                        child: Column(
                          children: [
                            ListTile(
                              leading: Text('Sort by Name'),
                              onTap: () {
                                setState(() {
                                  homeController.sortString = 'name';
                                });
                                Get.back();
                              },
                            ),
                            ListTile(
                              leading: Text('Sort by Age'),
                              onTap: () {
                                setState(() {
                                  homeController.sortString = 'age';
                                });
                                Get.back();
                              },
                            ),
                            ListTile(
                              leading: Text('Sort by City'),
                              onTap: () {
                                setState(() {
                                  homeController.sortString = 'city';
                                });
                                Get.back();
                              },
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      homeController.sortString = '';
                                    });
                                    Get.back();
                                  },
                                  child: Text('Clear')),
                            )
                          ],
                        ),
                      ));
                    },
                    child: const Icon(
                      Icons.filter_list,
                      color: Colors.black,
                    )),
              ),
            ),
          ),
          FutureBuilder(
            future: homeController.sortString == ''
                ? homeController.fetchAllusers()
                : (homeController.sortString == 'name'
                    ? homeController.sortUsersByName()
                    : (homeController.sortString == 'age'
                        ? homeController.sortUsersByAge()
                        : homeController.sortUsersByCity())),
            builder: (context, AsyncSnapshot<List<UserModel>>? snapshot) {
              if (!snapshot!.hasData) {
                return const Center(child: CircularProgressIndicator());
              } else {
                final List<UserModel>? doc = snapshot.data;
                return Expanded(
                  child: ListView.builder(
                    itemCount: doc?.length,
                    itemBuilder: (context, index) {
                      return HomeWidget(
                        userModel: doc![index],
                      );
                    },
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
