import 'package:etqaan_real_estate/generated/l10n.dart';
import 'package:etqaan_real_estate/routes/route_helper.dart';
import 'package:etqaan_real_estate/utils/app_colors.dart';
import 'package:etqaan_real_estate/utils/dimensions.dart';
import 'package:etqaan_real_estate/widgets/custom_big_text.dart';
import 'package:etqaan_real_estate/widgets/custom_clipper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialMediaPage extends StatelessWidget {
  SocialMediaPage({super.key});

  final List socialMediaAccounts = [
    {
      "url":
          "https://www.youtube.com/channel/UC1GadeE34FE17CbnHj4N_Qw/featured",
      "image": FontAwesomeIcons.youtube,
      "user_name": "etqaan_sa@/",
      "app_name": "youtube",
      "color": Color(0xffff3d00),
    },
    {
      "url": "https://etqaansiteapp.azurewebsites.net",
      "image": FontAwesomeIcons.e,
      "user_name": "WWW.Etqaan.sa",
      "app_name": "etqaan",
      "color": Colors.grey,
    },
    {
      "url": "https://twitter.com/etqaan_sa",
      "image": FontAwesomeIcons.xTwitter,
      "user_name": "etqaan_sa/",
      "app_name": "x",
      "color": Colors.black,
    },
    {
      "url": "https://www.instagram.com/",
      "image": FontAwesomeIcons.instagram,
      "user_name": "etqaan_sa/",
      "app_name": "instagram",
      "color": Color(0xffcd3aa1),
    },
    {
      "url": "https://www.facebook.com/etqaan.sa",
      "image": FontAwesomeIcons.facebookF,
      "user_name": "etqaan.sa/",
      "app_name": "facebook",
      "color": Color(0xff3f51b5),
    },
    {
      "url":
          "https://api.whatsapp.com/send/?phone=966920001019&text&type=phone_number&app_absent=0",
      "image": FontAwesomeIcons.whatsapp,
      "user_name": "+966 55 005 2000",
      "app_name": "whatsapp",
      "color": Color(0xff40c351),
    },
    {
      "url": "mailto:info@etqaan.sa",
      "image": Icons.email,
      "user_name": "info@etqaan.sa",
      "app_name": "email",
      "color": Colors.grey,
    },
    {
      "url": "tel:920001019",
      "image": FontAwesomeIcons.phone,
      "user_name": "920001019",
      "app_name": "call",
      "color": Color(0xff21ce6d),
    },
    {
      "url": "sms:920001019",
      "image": Icons.sms,
      "user_name": "sms",
      "app_name": "sms",
      "color": Color(0xff0d9be6),
    },
  ];

  Future<void> _launchToSocialMediaApp(
      {required url, required String appName}) async {
    var uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      //await Future.delayed(Duration(seconds: 3), () {});
      await launchUrl(uri);
    } else {
      throw Exception('Could not launch $appName');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          // this is constant must change:
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.symmetric(
                  vertical: Dimensions.marginH10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomBigText(
                      text: S.of(context).browse_social,
                      fontSize: Dimensions.fontSize16,
                    ),
                    IconButton(
                      onPressed: () {
                        Get.toNamed(RouteHelper.getHomePage());
                      },
                      color: AppColors.mainIconColor,
                      iconSize: Dimensions.iconSize30,
                      icon: Icon(Icons.close),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: socialMediaAccounts.length,
                  itemBuilder: (context, index) {
                    return AnimationConfiguration.staggeredList(
                      position: index,
                      child: SlideAnimation(
                        duration: Duration(milliseconds: 2500),
                        curve: Curves.fastLinearToSlowEaseIn,
                        child: FadeInAnimation(
                          curve: Curves.fastLinearToSlowEaseIn,
                          duration: Duration(milliseconds: 2500),
                          child: GestureDetector(
                            onTap: () {
                              _launchToSocialMediaApp(
                                url: socialMediaAccounts[index]['url'],
                                appName: socialMediaAccounts[index]['app_name'],
                              );
                            },
                            child: Container(
                              margin: EdgeInsets.only(
                                bottom: Dimensions.marginH20,
                              ),
                              width: double.maxFinite,
                              height: Dimensions.height30 * 2,
                              //color: Colors.amber,
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: Alignment.center,
                                    child: CustomSocialClipper(
                                      width: Dimensions.screenWidth * 0.9,
                                      height: Dimensions.height30 + 10,
                                      points: [
                                        Offset(0, 0),
                                        Offset(0, (Dimensions.height30 + 10)),
                                        Offset((Dimensions.screenWidth * 0.9),
                                            (Dimensions.height30 + 10)),
                                        Offset(
                                            (Dimensions.screenWidth * 0.9), 0),
                                      ],
                                      color: Colors.grey[300]!,
                                      widget: CustomBigText(
                                        text: socialMediaAccounts[index]
                                            ['user_name'],
                                        textColor: socialMediaAccounts[index]
                                            ['color'],
                                      ),
                                      /*decoration: BoxDecoration(
                                        border: Border.all(
                                          style: BorderStyle.solid,
                                          width: 1.0,
                                          color: socialMediaAccounts[index]
                                              ['color'],
                                        ),
                                        color: Colors.grey[300],
                                        borderRadius: BorderRadius.circular(
                                            Dimensions.radius30),
                                      ),
                                      child: Center(
                                        child: CustomBigText(
                                          text: socialMediaAccounts[index]
                                              ['user_name'],
                                          textColor: socialMediaAccounts[index]
                                              ['color'],
                                        ),
                                      ),*/
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      right: Dimensions.paddingW20,
                                    ),
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: CustomSocialClipper(
                                        width: Dimensions.width30 * 2,
                                        height: Dimensions.height30 * 2,
                                        points: [
                                          Offset(0, 0),
                                          Offset(0, Dimensions.height30 * 2),
                                          Offset((Dimensions.width30 * 2) / 2,
                                              (Dimensions.height30 * 2) - 10),
                                          Offset((Dimensions.width30 * 2),
                                              (Dimensions.height30 * 2)),
                                          Offset((Dimensions.width30 * 2), 0),
                                        ],
                                        color: socialMediaAccounts[index]
                                            ['color'],
                                        widget: Icon(
                                          socialMediaAccounts[index]['image'],
                                          size: Dimensions.iconSize30,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              /*Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      _launchToSocialMediaApp(
                                        url: socialMediaAccounts[index]['url'],
                                        appName: socialMediaAccounts[index]['app_name'],
                                      );
                                    },
                                    child: Container(
                                      width: Dimensions.width30 * 2,
                                      height: Dimensions.height30 * 2,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                            Dimensions.radius10 * 3),
                                        color: socialMediaAccounts[index]['color'],
                                      ),
                                      child: Center(
                                        child: Icon(
                                          socialMediaAccounts[index]['image'],
                                          size: Dimensions.iconSize30,
                                          color: Colors.white,
                                        ),
                                      ),
                                    )
                                        .animate()
                                        .fadeIn()
                                        .scale()
                                        .move(delay: 300.ms, duration: 600.ms),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      _launchToSocialMediaApp(
                                        url: socialMediaAccounts[index]['url'],
                                        appName: socialMediaAccounts[index]['app_name'],
                                      );
                                    },
                                    child: Container(
                                      width: Dimensions.screenWidth * 0.7,
                                      height: Dimensions.height30 * 2,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(Dimensions.radius30),
                                        color: Colors.grey[300],
                                      ),
                                      child: Center(
                                        child: CustomBigText(
                                          text: socialMediaAccounts[index]
                                              ['user_name'],
                                          textColor: socialMediaAccounts[index]
                                              ['color'],
                                        ),
                                      ),
                                    ),
                                  ).animate().moveX(delay: 300.ms, duration: 600.ms),
                                ],
                              ),*/
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


/*  Row(
                        children: [
                          Expanded(
                            child: Container(
                              color: socialMediaAccounts[index]['color'],
                              child: Center(
                                child: Image.asset(
                                    socialMediaAccounts[index]['image']),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: Dimensions.width10,
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              //color: Colors.red,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomSocialClipper(
                                    widget: CustomBigText(
                                      text: S.of(context).browse_social,
                                      fontSize: Dimensions.fontSize12,
                                      textColor: Colors.white,
                                    ),
                                    color: socialMediaAccounts[index]['color'],
                                    points: [
                                      Offset(30, 0),
                                      Offset(0, 40),
                                      Offset(200, 40),
                                      Offset(200, 0),
                                    ],
                                    width: 200,
                                    height: (Dimensions.screenHeight * 0.1)*0.1,
                                  ),
                                  /*Container(
                                    width: 180,
                                    height: 50,
                                    color: Colors.blue,
                                  ),*/
                                  SizedBox(
                                    height: 6,
                                  ),
                                  CustomSocialClipper(
                                    width: (Dimensions.screenHeight * 0.1)*0.2,
                                    height: 60,
                                    color: socialMediaAccounts[index]['color'],
                                    widget: CustomBigText(
                                      text: socialMediaAccounts[index]
                                          ['app_name'],
                                      textColor: Colors.white,
                                    ),
                                    points: [
                                      Offset(30, 0),
                                      Offset(0, 30),
                                      Offset(30, 60),
                                      Offset(260, 60),
                                      Offset(260, 0),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
 */
/*child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              //height: Dimensions.screenHeight * 0.1,
                              color: Colors.green,
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Column(
                              children: [
                                CustomSocialClipper(
                                  width: double.maxFinite,
                                  height: 50,
                                  color: Colors.red,
                                  points: [
                                    Offset(0, 0),
                                    Offset(0, 30),
                                    Offset(20, 0),
                                  ],
                                  image: socialMediaAccounts[index]['image'],
                                ),
                                Container(),
                                Container(
                                  width: double.maxFinite,
                                  height: 76,
                                  color: Colors.black,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ), */

/* 
Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: Dimensions.marginW10,
                        vertical: Dimensions.marginH10,
                      ),

                      height: Dimensions.height30 * 3,
                      width: double.maxFinite,
                      //color: Colors.red,
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Container(
                              width: double.maxFinite,
                              height: Dimensions.height20 * 2.8,
                              decoration: BoxDecoration(
                                color: socialMediaAccounts[index]['color'],
                                borderRadius: BorderRadius.circular(
                                    Dimensions.radius20 - 5),
                              ),
                              child: Center(
                                child: CustomBigText(
                                  text: "Etqaan Real Estate",
                                  textColor: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: Dimensions.paddingW20,
                            ),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: CustomSocialClipper(
                                color: socialMediaAccounts[index]['color'],
                                image: socialMediaAccounts[index]['image'],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );

*/

/*
Container(
                color: Colors.amber,
                child: Stack(
                  children: [
                    Container(
                      width: Dimensions.screenWidth * 0.8,
                      height: Dimensions.height20 * 4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(Dimensions.radius20),
                          topLeft: Radius.circular(Dimensions.radius20),
                        ),
                        color: AppColors.mainIconColor,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        width: 100,
                        height: 100,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ), 
*/
/*
 AnimationLimiter(
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: socialMediaAccounts.length,
                      itemBuilder: (context, index) {
                        return AnimationConfiguration.staggeredList(
                          position: index,
                          child: SlideAnimation(
                            duration: Duration(milliseconds: 2500),
                            curve: Curves.fastLinearToSlowEaseIn,
                            child: FadeInAnimation(
                              curve: Curves.fastLinearToSlowEaseIn,
                              duration: Duration(milliseconds: 2500),
                              child: GestureDetector(
                                onTap: () => _launchToSocialMediaApp(
                                  url: socialMediaAccounts[index]['url'],
                                  appName: socialMediaAccounts[index]
                                      ['app_name'],
                                ),
                                child: Container(
                                  margin: EdgeInsets.only(
                                      bottom: Dimensions.marginH10),
                                  // this is a static value must change:;
                                  padding: EdgeInsets.all(10),
                                  width: double.maxFinite,
                                  height: Dimensions.height20 * 8,
                                  decoration: BoxDecoration(
                                    //color: Color.fromARGB(127, 10, 125, 148),
                                    borderRadius: BorderRadius.circular(
                                        Dimensions.radius20),
                                  ),
                                  child: Stack(
                                    children: [
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: CustomBigText(
                                          text: socialMediaAccounts[index]
                                              ['app_name'],
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Container(
                                          width: Dimensions.width10 * 12,
                                          height: Dimensions.width10 * 12,
                                          decoration: BoxDecoration(
                                            //color: Colors.red,
                                            image: DecorationImage(
                                              fit: BoxFit.contain,
                                              image: AssetImage(
                                                socialMediaAccounts[index]
                                                    ['image'],
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
                      },
                    ),
                  ),

 */
