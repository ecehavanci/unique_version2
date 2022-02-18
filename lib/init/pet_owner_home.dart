import 'package:flutter/material.dart';
import 'package:unique_version2/colors.dart';
import 'package:unique_version2/widgets/custom_text_button.dart';
import 'package:unique_version2/widgets/pet_selector_container.dart';
import 'package:unique_version2/widgets/profile_pic_shower.dart';

import '../widgets/my_pets_cards.dart';

class HomePage extends StatefulWidget {
  final String uid;

  const HomePage({Key? key, required this.uid}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.apps),
          iconSize: 20,
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: ProfileIcon(),
            iconSize: 50,
            onPressed: () {},
          ),
        ],
        title: Center(
          child: Column(
            children: [
              Text(
                "Location",
                style: textTheme.subtitle1!.copyWith(fontSize: 12, color: AppColors.mediumGray),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.location_on,
                    color: AppColors.darkblue2,
                  ),
                  Text(
                    "myLocationData",
                    style: textTheme.subtitle1!.copyWith(fontSize: 13, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
        ),
        elevation: 0,
        toolbarHeight: height * 0.12,
        flexibleSpace: Container(
          color: AppColors.lightblue2,
        ),
      ),
      body: Container(
        color: AppColors.lightblue2,
        child: Padding(
          padding: EdgeInsets.only(top: 10),
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) => Center(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      width: width,
                      height: height * 0.70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(50), topRight: Radius.circular(50)),
                        color: AppColors.white,
                      ),
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.only(left: width * 0.05, right: width * 0.05),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.search,
                                    color: AppColors.orange,
                                  ),
                                  CustomTextButton(
                                    title: 'Look for Pet Sitter',
                                    onPressed: () {},
                                    style: textTheme.subtitle1!
                                        .copyWith(fontSize: 13, fontWeight: FontWeight.bold, color: AppColors.orange2),
                                  ),
                                ],
                              ),
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("Add Your Pets"),
                                ),
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: SizedBox(
                                      height: height * 0.16,
                                      width: width * 0.4,
                                      child: ListView(
                                        scrollDirection: Axis.horizontal,
                                        shrinkWrap: true,
                                        children: [
                                          PetSelectorContainer(
                                            onPressed: () {
                                              print("d");
                                            },
                                            iconAsset: "asset/bird_icon.png",
                                            width: 50,
                                            height: 50,
                                            animalTitle: "Bird",
                                          ),
                                          PetSelectorContainer(
                                            onPressed: () {
                                              print("d");
                                            },
                                            iconAsset: "asset/cat_icon2.png",
                                            width: 50,
                                            height: 50,
                                            animalTitle: "Cat",
                                          ),
                                          PetSelectorContainer(
                                            onPressed: () {
                                              print("d");
                                            },
                                            iconAsset: "asset/dog_icon.png",
                                            width: 50,
                                            height: 50,
                                            animalTitle: "Dog",
                                          ),
                                          PetSelectorContainer(
                                            onPressed: () {
                                              print("d");
                                            },
                                            iconAsset: "asset/bunny_icon.png",
                                            width: 50,
                                            height: 50,
                                            animalTitle: "Bunny",
                                          ),
                                          PetSelectorContainer(
                                            onPressed: () {
                                              print("d");
                                            },
                                            iconAsset: "asset/fish_icon.png",
                                            width: 50,
                                            height: 50,
                                            animalTitle: "Fish",
                                          ),
                                          PetSelectorContainer(
                                            onPressed: () {
                                              print("d");
                                            },
                                            iconAsset: "asset/mouse_icon.png",
                                            width: 50,
                                            height: 50,
                                            animalTitle: "Hamster",
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("My Pets"),
                                ),
                              ),
                              Column(
                                children: [
                                  PetCard(
                                    url:
                                        'https://i.picsum.photos/id/137/200/200.jpg?hmac=qhNK8PzcRQJaCJlGEj1q5ceRIkKkfPmVuOwE5ZInXA8',
                                    petName: "name",
                                    petAge: "12",
                                    petBreed: "malesian",
                                    screenHeight: height,
                                    screenWidth: width,
                                  ),
                                  PetCard(
                                    url:
                                        'https://i.picsum.photos/id/137/200/200.jpg?hmac=qhNK8PzcRQJaCJlGEj1q5ceRIkKkfPmVuOwE5ZInXA8',
                                    petName: "name",
                                    petAge: "12",
                                    petBreed: "malesian",
                                    screenHeight: height,
                                    screenWidth: width,
                                  ),
                                  PetCard(
                                    url:
                                        'https://i.picsum.photos/id/137/200/200.jpg?hmac=qhNK8PzcRQJaCJlGEj1q5ceRIkKkfPmVuOwE5ZInXA8',
                                    petName: "name",
                                    petAge: "12",
                                    petBreed: "malesian",
                                    screenHeight: height,
                                    screenWidth: width,
                                  ),
                                  PetCard(
                                    url:
                                        'https://i.picsum.photos/id/137/200/200.jpg?hmac=qhNK8PzcRQJaCJlGEj1q5ceRIkKkfPmVuOwE5ZInXA8',
                                    petName: "name",
                                    petAge: "12",
                                    petBreed: "malesian",
                                    screenHeight: height,
                                    screenWidth: width,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
