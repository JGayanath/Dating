import 'package:dating/components/custom_text.dart';
import 'package:dating/screens/home_page/image_list.dart';
import 'package:dating/utils/assets_path.dart';
import 'package:dating/utils/colors.dart';
import 'package:dating/utils/util_functions.dart';
import 'package:flutter/material.dart';

import 'bottom_bar.dart';
import 'drawer.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //-- draver open access key
  var scaffoldKey = GlobalKey<ScaffoldState>();

  // state chnage variable
  String imageRference = AssetsPath.profile7;

  @override
  Widget build(BuildContext context) {
    //----------context size
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        endDrawer: Drawer_Page(),
        bottomNavigationBar: Padding(
          padding:
              const EdgeInsets.only(left: 20.0, right: 20, top: 10, bottom: 10),
          child: BottomBar(),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Container(
              width: size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Custom_Text("Discover",fontSize: 30,fontWeight: FontWeight.bold,),
                      InkWell(
                        onTap: () => scaffoldKey.currentState!.openEndDrawer(),
                        child: CircleAvatar(
                          backgroundImage:NetworkImage('https://media.licdn.com/dms/image/D5603AQEtRqLUmKbH_Q/profile-displayphoto-shrink_800_800/0/1667525906093?e=1679529600&v=beta&t=B3mFp_YAP9bugXpNriP6hZzeu9g2tldJEwIMSh7noJU'),
                          radius: 30.0,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 430,
                        height: 50,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                            color: AppColors.appColor,
                          ),
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(32)),
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.search,
                              color: AppColors.appColor,
                            ),
                            border: InputBorder.none,
                            hintText: 'Find Your Friens',
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    height: 100,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: Image_List.imageList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  imageRference = Image_List.imageList[index].toString();
                                });
                              },
                              child: Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 3,
                                      color: AppColors.appColor,
                                    ),
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(Image_List.imageList[index]),
                                    )),
                              ),
                            ),
                          );
                        }),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Custom_Text("NEAR YOU",
                              fontSize: 25, fontWeight: FontWeight.bold),
                          Custom_Text(
                            "View all",
                            fontSize: 20,
                            color: AppColors.appColor,
                            fontWeight: FontWeight.bold,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 20),
                        width: size.width,
                        height: 600,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(32)),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(imageRference.toString()),
                          ),
                          color: AppColors.appColor,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}



