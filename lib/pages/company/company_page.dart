import 'package:etqaan_real_estate/widgets/custom_big_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class CompanyPage extends StatelessWidget {
  CompanyPage({super.key});
  final List socialMediaAccounts = [
    {
      "url":
          "https://www.youtube.com/channel/UC1GadeE34FE17CbnHj4N_Qw/featured",
      "image": "assets/images/youtube.png",
    },
    {
      "url": "https://www.instagram.com/",
      "image": "assets/images/instagram.png",
    },
    {
      "url": "https://twitter.com/etqaan_sa",
      "image": "assets/images/twitter.png",
    },
    {
      "url":
          "https://api.whatsapp.com/send/?phone=966920001019&text&type=phone_number&app_absent=0",
      "image": "assets/images/whatsapp.png",
    },
    {
      "url": "https://www.facebook.com/etqaan.sa",
      "image": "assets/images/facebook.png",
    },
    {
      "url": "mailto:info@etqaan.sa",
      "image": "assets/images/email.png",
    },
    {
      "url": "tel:920001019",
      "image": "assets/images/telephone.png",
    },
    {
      "url": "sms:920001019",
      "image": "assets/images/sms.png",
    },
  ];
  Future<void> _launchToSocialMediaApp({required url}) async {
    var uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw Exception('Could not launch $uri');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              width: 200,
              height: 200,
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: socialMediaAccounts.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      _launchToSocialMediaApp(
                        url: socialMediaAccounts[index]['url'],
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(10),
                      width: 130.w,
                      height: 130.h,
                      child: Image(
                        width: 96.w,
                        height: 96.h,
                        image: AssetImage(socialMediaAccounts[index]['image']),
                      ),
                    ),
                  );
                },
              ),
            ),
            CustomBigText(
              text: 'Company Page',
            ),
          ],
        ),
      ),
    );
  }
}
