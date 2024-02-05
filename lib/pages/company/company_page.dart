import 'package:etqaan_real_estate/generated/l10n.dart';
import 'package:etqaan_real_estate/pages/base/custom_loader.dart';
import 'package:etqaan_real_estate/routes/route_helper.dart';
import 'package:etqaan_real_estate/utils/app_colors.dart';
import 'package:etqaan_real_estate/widgets/custom_big_text.dart';
import 'package:etqaan_real_estate/widgets/custom_expandable_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class CompanyPage extends StatefulWidget {
  CompanyPage({super.key});

  @override
  State<CompanyPage> createState() => _CompanyPageState();
}

class _CompanyPageState extends State<CompanyPage> {
  final List socialMediaAccounts = [
    {
      "url":
          "https://www.youtube.com/channel/UC1GadeE34FE17CbnHj4N_Qw/featured",
      "image": "assets/images/youtube.png",
      "app_name": "youtube",
    },
    {
      "url": "https://www.instagram.com/",
      "image": "assets/images/instagram.png",
      "app_name": "instagram",
    },
    {
      "url": "https://twitter.com/etqaan_sa",
      "image": "assets/images/twitter.png",
      "app_name": "twitter",
    },
    {
      "url":
          "https://api.whatsapp.com/send/?phone=966920001019&text&type=phone_number&app_absent=0",
      "image": "assets/images/whatsapp.png",
      "app_name": "whatsapp",
    },
    {
      "url": "https://www.facebook.com/etqaan.sa",
      "image": "assets/images/facebook.png",
      "app_name": "facebook",
    },
    {
      "url": "tel:920001019",
      "image": "assets/images/call.png",
      "app_name": "call",
    },
    {
      "url": "mailto:info@etqaan.sa",
      "image": "assets/images/email.png",
      "app_name": "email",
    },
    {
      "url": "sms:920001019",
      "image": "assets/images/sms.png",
      "app_name": "sms",
    },
  ];

  bool _isLoaded = false;

  Future<void> _launchToSocialMediaApp(
      {required url, required String appName}) async {
    var uri = Uri.parse(url);
    setState(() {
      _isLoaded = true;
    });
    if (await canLaunchUrl(uri)) {
      //await Future.delayed(Duration(seconds: 3), () {});
      await launchUrl(uri);
      setState(() {
        _isLoaded = false;
      });
    } else {
      throw Exception('Could not launch $appName');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.mainBackColor2,
        /*  appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.mainBackColor2,
          title: CustomBigText(
            text: S.of(context).company_name,
            fontSize: 18.sp,
            //textColor: AppColors.mainIconColor,
            fontFamily: 'GESSTwo',
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Get.toNamed(RouteHelper.getHomePage());
            },
            icon: Icon(
              Icons.arrow_back_rounded,
            ),
            iconSize: 30,
            color: AppColors.mainIconColor,
          ),
        ), */
        body: !_isLoaded
            ? SingleChildScrollView(
                //physics: BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // This is showing the company info card:
                      Container(
                        width: double.maxFinite,
                        height: 200.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.r),
                          image: DecorationImage(
                            colorFilter: ColorFilter.mode(
                              AppColors.bigTextColor,
                              BlendMode.multiply,
                            ),
                            fit: BoxFit.cover,
                            image: AssetImage('assets/images/new2.jpg'),
                          ),
                        ),
                        child: Stack(
                          children: [
                            // this is showing the back arrow:
                            Align(
                              alignment: Alignment.topRight,
                              child: Container(
                                margin: EdgeInsets.only(
                                  top: 10,
                                  right: 10,
                                ),
                                child: CircleAvatar(
                                  radius: 20.r,
                                  backgroundColor: AppColors.mainBackColor1,
                                  child: IconButton(
                                    onPressed: () {
                                      Get.toNamed(RouteHelper.getHomePage());
                                    },
                                    icon: Icon(
                                      Icons.arrow_back_rounded,
                                    ),
                                    iconSize: 30,
                                    color: AppColors.mainIconColor,
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  CircleAvatar(
                                    backgroundColor: AppColors.mainBackColor1,
                                    child: Image(
                                      width: 60.w,
                                      height: 60.h,
                                      image: AssetImage(
                                        'assets/images/etqaanLogoRem.png',
                                      ),
                                    ),
                                    radius: 40.r,
                                  ),
                                  CustomBigText(
                                    text: S.of(context).company_name_part1,
                                    fontFamily: 'GESSTwo',
                                    textColor: AppColors.mainBackColor1,
                                    fontSize: 14.sp,
                                  ),
                                  IntrinsicHeight(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            CustomBigText(
                                              text: '2000',
                                              //fontFamily: 'GESSTwo',
                                              textColor:
                                                  AppColors.mainBackColor1,
                                              fontSize: 14.sp,
                                            ),
                                            CustomBigText(
                                              text: S.of(context).project,
                                              fontFamily: 'GESSTwo',
                                              textColor:
                                                  AppColors.mainBackColor1,
                                              fontSize: 10.sp,
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          width: 20.w,
                                        ),
                                        VerticalDivider(
                                          width: 0,
                                          color: AppColors.mainBackColor1,
                                          thickness: 2,
                                        ),
                                        SizedBox(
                                          width: 20.w,
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            CustomBigText(
                                              text: '3000',
                                              //fontFamily: 'GESSTwo',
                                              textColor:
                                                  AppColors.mainBackColor1,
                                              fontSize: 14.sp,
                                            ),
                                            CustomBigText(
                                              text: S.of(context).auction,
                                              fontFamily: 'GESSTwo',
                                              textColor:
                                                  AppColors.mainBackColor1,
                                              fontSize: 10.sp,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      // This is showing the about section:
                      CustomBigText(
                        text: S.of(context).about_us,
                        fontFamily: 'GESSTwo',
                        fontSize: 14.sp,
                      ),
                      Container(
                        padding: EdgeInsets.only(
                          top: 10,
                          left: 20,
                          right: 20,
                          bottom: 10,
                        ),
                        decoration: BoxDecoration(
                          //color: Colors.white,
                          borderRadius: BorderRadius.circular(20.r),
                          border: Border.all(
                            color: AppColors.mainIconColor,
                            style: BorderStyle.solid,
                            width: 1.5,
                          ),
                        ),
                        child: CustomExpandableText(
                          text:
                              "نجحت شركة “إتقان العقارية في تسويق وبيع  مخطط مستودعات طريق الخرج التي تبلغ مساحتها بـ 600,000 متر مربع، وبأقل من 48 ساعة من تكليفها بالبيع والتسويق  بقيمة إجمالية بلغت الــ 280 ميلون ريال  لمجموعة من المستثمرين في أسرع صفقة تتسق مع التطور في السوق العقاري والنقلة النوعية  التي يشهدها الاقتصاد السعودي في ضوء مستهدفات رؤية 2030نجحت شركة “إتقان العقارية في تسويق وبيع  مخطط مستودعات طريق الخرج التي تبلغ مساحتها بـ 600,000 متر مربع، وبأقل من 48 ساعة من تكليفها بالبيع والتسويق  بقيمة إجمالية بلغت الــ 280 ميلون ريال  لمجموعة من المستثمرين في أسرع صفقة تتسق مع التطور في السوق العقاري والنقلة النوعية  التي يشهدها الاقتصاد السعودي في ضوء مستهدفات رؤية 2030نجحت شركة “إتقان العقارية في تسويق وبيع  مخطط مستودعات طريق الخرج التي تبلغ مساحتها بـ 600,000 متر مربع، وبأقل من 48 ساعة من تكليفها بالبيع والتسويق  بقيمة إجمالية بلغت الــ 280 ميلون ريال  لمجموعة من المستثمرين في أسرع صفقة تتسق مع التطور في السوق العقاري والنقلة النوعية  التي يشهدها الاقتصاد السعودي في ضوء مستهدفات رؤية 2030",
                          textHeight: 200.h,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      // This is showing the social media accounts:
                      CustomBigText(
                        text: S.of(context).social_media,
                        fontFamily: 'GESSTwo',
                        fontSize: 14.sp,
                      ),
                      Container(
                        width: double.maxFinite,
                        height: 60.h,
                        child: Center(
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            physics: BouncingScrollPhysics(),
                            itemCount: socialMediaAccounts.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  _launchToSocialMediaApp(
                                    url: socialMediaAccounts[index]['url'],
                                    appName: socialMediaAccounts[index]
                                        ['app_name'],
                                  );
                                },
                                child: Container(
                                  margin: EdgeInsets.all(5),
                                  padding: EdgeInsets.all(5),
                                  //width: 130.w,
                                  //height: 130.h,
                                  child: Image(
                                    width: 40.w,
                                    height: 40.h,
                                    image: AssetImage(
                                        socialMediaAccounts[index]['image']),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : Center(
                child: CustomLoader(),
              ),
      ),
    );
  }
}
