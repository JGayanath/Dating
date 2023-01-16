
import 'package:dating/utils/assets_path.dart';
import 'package:dating/utils/colors.dart';
import 'package:flutter/material.dart';



class HomeListView extends StatelessWidget {
  const HomeListView({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final List<String> imageList = [
      AssetsPath.profile1,
      AssetsPath.profile10,
      AssetsPath.profile8,
      AssetsPath.profile12,
      AssetsPath.profile5,
      AssetsPath.profile3,
      AssetsPath.profile11,
      AssetsPath.profile7,
      AssetsPath.profile9,
      AssetsPath.profile2,
      AssetsPath.profile4,
      AssetsPath.profile6,
    ];

    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: imageList.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              // handle on tap here
            },
            child: Padding(
              padding: const EdgeInsets.all(4.0),
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
                      image: AssetImage(imageList[index]),
                    )),
              ),
            ),
          );
        });
  }
}
