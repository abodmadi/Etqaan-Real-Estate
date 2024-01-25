import 'dart:async';

import 'package:etqaan_real_estate/generated/l10n.dart';
import 'package:etqaan_real_estate/routes/route_helper.dart';
import 'package:etqaan_real_estate/utils/app_colors.dart';
import 'package:etqaan_real_estate/utils/dimensions.dart';
import 'package:etqaan_real_estate/widgets/custom_big_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // This controller manage the open and close panel:
  PanelController _panelController = PanelController();
  PageController _pageController = PageController(initialPage: 0);
  Timer? _timer;

  var newsList = [
    {
      'title':
          'رئيس مجلس إدارة إتقان العقارية: ما تَحقق في ميزانية المملكة تتويج لجهود القيادة',
      'image': 'assets/images/633570-584x564.jpg',
    },
    {
      'title':
          'إتقان العقارية تطلق حملتها التسويقية لبوابة التحلية بجدة بفرص استثمارية متنوعة',
      'image': 'assets/images/tahlia-1920x800.jpg',
    },
    {
      'title':
          'نوه بمخطط درب الحرمين كواجهة حضارية متميزة بجدة … وزير الشؤون البلدية والقروية يوجه بطراز معماري موحد لمخطط درب الحرمين بقلب جدة.',
      'image': 'assets/images/darb-1280x800.jpg',
    },
    {
      'title':
          'عبد العزيز الرشيد: رئاسة المملكة لـ مجموعة العشرين تأكيد الريادة العالمية.',
      'image': 'assets/images/G20.jpg',
    },
  ];

  _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 4), (timer) {
      if (_pageController.page == newsList.length - 1) {
        _pageController.animateToPage(
          0,
          duration: Duration(milliseconds: 500),
          curve: Curves.easeIn,
        );
      } else {
        _pageController.nextPage(
          duration: Duration(milliseconds: 500),
          curve: Curves.easeIn,
        );
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    print("Screen Width: " + Dimensions.screenWidth.toString());
    print("Screen Height: " + Dimensions.screenHeight.toString());

    print("Run Type: " + S.of(context).about_us.runtimeType.toString());
    var servicesList = [
      {
        "title": S.of(context).real_estates,
        "supTitle": S.of(context).real_estate,
        "image": "assets/images/real_estate.png",
      },
      {
        "title": S.of(context).auctions,
        "supTitle": S.of(context).auction,
        "image": "assets/images/actuion.png",
      },
      {
        "title": S.of(context).projects,
        "supTitle": S.of(context).project,
        "image": "assets/images/project.png",
      },
    ];
    return Scaffold(
      backgroundColor: AppColors.mainBackColor2,
      appBar: AppBar(
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
          onPressed: () {},
          icon: Icon(
            Icons.menu_rounded,
          ),
          iconSize: 30,
          color: AppColors.mainIconColor,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications_none_rounded,
            ),
            iconSize: 30,
            color: AppColors.mainIconColor,
          ),
        ],
      ),
      // This is showing the body content:
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.maxFinite,
                height: 200.h,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/new2.jpg'),
                  ),
                ),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Row(
                        children: [
                          Shimmer.fromColors(
                            baseColor: AppColors.mainBackColor2,
                            highlightColor: AppColors.mainBackColor1,
                            child: GestureDetector(
                              onTap: () {
                                Get.toNamed(RouteHelper.getCompanyPage());
                              },
                              child: Container(
                                padding: EdgeInsets.all(10),
                                margin: EdgeInsets.all(10),
                                height: 50,
                                //width: 100.w,
                                //width: double.maxFinite,
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(100, 0, 0, 0),
                                  borderRadius: BorderRadius.circular(30.r),
                                ),
                                child: Center(
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        Icons.info_outline,
                                        color: Colors.white,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      CustomBigText(
                                        text: S.of(context).about_us,
                                        fontFamily: 'GESSTwo',
                                        fontSize: 8.sp,
                                        textColor: Colors.white,
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
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              // This is showing news slider:
              CustomBigText(
                text: S.of(context).news,
                fontSize: 14.sp,
                fontFamily: 'GESSTwo',
              ),
              Stack(
                children: [
                  SizedBox(
                    width: double.maxFinite,
                    height: 160.h,
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: newsList.length,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Container(
                          //width: double.maxFinite,
                          //height: 150.h,
                          margin: EdgeInsets.only(
                            top: 10,
                          ),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.35),
                            image: DecorationImage(
                              colorFilter: ColorFilter.mode(
                                Colors.black.withOpacity(0.35),
                                BlendMode.multiply,
                              ),
                              fit: BoxFit.contain,
                              image: AssetImage(
                                newsList[index]['image']!,
                              ),
                            ),
                          ),
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: CustomBigText(
                                  text: newsList[index]['title']!,
                                  fontFamily: 'GESSTwo',
                                  textColor: Colors.white,
                                  fontSize: 8.sp,
                                  backColor: AppColors.mainIconColor,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
              // This is showing the page Indicator:
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SmoothPageIndicator(
                    controller: _pageController, // PageController
                    count: newsList.length,
                    effect: ExpandingDotsEffect(
                      activeDotColor: AppColors.mainIconColor,
                    ),
                    onDotClicked: (index) {
                      _pageController.animateToPage(
                        index,
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                      );
                    }, // your preferred effect
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              // This is showing our services section:
              CustomBigText(
                text: S.of(context).our_services,
                fontSize: 14.sp,
                fontFamily: 'GESSTwo',
              ),
              Container(
                width: double.maxFinite,
                height: 140.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  itemCount: servicesList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        //color: Colors.red,
                        borderRadius: BorderRadius.circular(20.r),
                        border: Border.all(
                          style: BorderStyle.solid,
                          color: AppColors.mainIconColor,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image(
                            width: 80.w,
                            height: 50.h,
                            image: AssetImage(
                              servicesList[index]['image']!,
                            ),
                          ),
                          CustomBigText(
                            text: servicesList[index]['title']!,
                            fontSize: 14.sp,
                            fontFamily: 'GESSTwo',
                          ),
                          Row(
                            children: [
                              CustomBigText(
                                text: '1000',
                                fontSize: 8.sp,
                                textColor: AppColors.smallTextColor,
                                //fontFamily: 'GESSTwo',
                              ),
                              CustomBigText(
                                text: ' ${servicesList[index]['supTitle']}',
                                fontSize: 8.sp,
                                textColor: AppColors.smallTextColor,
                                fontFamily: 'GESSTwo',
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/*
CustomContainer(
                    padding: EdgeInsets.all(10),
                    width: 130.w,
                    height: 100.h,
                    color: null,
                    border: Border.all(
                      style: BorderStyle.solid,
                      color: AppColors.smallTextColor,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          CupertinoIcons.house_alt,
                          color: AppColors.smallTextColor,
                          size: 60,
                        ),
                        CustomBigText(text: S.of(context).projects),
                        //CustomBigText(text: '200' + ' ' + S.of(context).projects),
                      ],
                    ),
                  )
 */
/*
Scaffold(
      
      body: SafeArea(
        child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            leading: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.menu_rounded,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.notifications_none_rounded,
                ),
              ),
            ],
          ),
          // This is showing the body content:
          body: SlidingUpPanel(
            maxHeight: 450.h,
            minHeight: 300.h,
            parallaxOffset: 0.5,
            color: Colors.transparent,
            parallaxEnabled: true,
            controller: _panelController,
            // This is showing the body of Sliding Up Show:
            body: Image(
              image: AssetImage('assets/images/new-2-removebg-preview.png'),
            ),

            // This is showing the panel Builder :
            panelBuilder: (ScrollController scrollController) {
              return Column(
                children: [
                  // This is showing the projects and clients content:
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 10,
                      bottom: 10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            CustomBigText(
                              text: '2000',
                              fontSize: 12.sp,
                              textColor: AppColors.smallTextColor,
                            ),
                            CustomBigText(
                              text: S.of(context).projects,
                              fontFamily: 'GESSTwo',
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            CustomBigText(
                              text: '200',
                              fontSize: 12.sp,
                              textColor: AppColors.smallTextColor,
                            ),
                            CustomBigText(
                              text: S.of(context).clients,
                              fontFamily: 'GESSTwo',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  // This is showing the menu app content:
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.r),
                          topRight: Radius.circular(30.r),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Projects
                              CustomContainer(
                                widget: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CustomBigText(
                                      text: S.of(context).projects,
                                    ),
                                  ],
                                ),
                              ),
                              // real_estate
                              CustomContainer(
                                widget: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CustomBigText(
                                      text: S.of(context).real_estate,
                                    ),
                                  ],
                                ),
                              ),
                              // auction
                              CustomContainer(
                                widget: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CustomBigText(
                                      text: S.of(context).auction,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // news
                              CustomContainer(
                                widget: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CustomBigText(
                                      text: S.of(context).news,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    )
 */
/* 
Container(
          padding: EdgeInsets.all(15),
          margin: EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/images/new-2-removebg-preview.png',
              ),
              SizedBox(
                height: 30,
              ),
              CustomBigText(
                text: S.of(context).company_name,
                fontFamily: 'GESSTwo',
              ),
              CustomBigText(
                text: S.of(context).about_us,
                fontFamily: 'GESSTwo',
              ),
            ],
          ),
        )
*/
