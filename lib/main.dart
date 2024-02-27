import 'package:etqaan_real_estate/controllers/auction_controller.dart';
import 'package:etqaan_real_estate/controllers/favorite_controller.dart';
import 'package:etqaan_real_estate/controllers/location_controller.dart';
import 'package:etqaan_real_estate/controllers/news_controller.dart';
import 'package:etqaan_real_estate/controllers/project_controller.dart';
import 'package:etqaan_real_estate/controllers/real_estate_controller.dart';
import 'package:etqaan_real_estate/generated/l10n.dart';
import 'package:etqaan_real_estate/pages/maps/project_map_page.dart';
import 'package:etqaan_real_estate/pages/maps/maps_page.dart';
import 'package:etqaan_real_estate/routes/route_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'helper/dependencies.dart' as deb;
import 'pages/social-media/social_media_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await deb.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: GetBuilder<RealEstateController>(builder: (_) {
        return GetBuilder<NewsController>(builder: (_) {
          return GetBuilder<AuctionController>(builder: (_) {
            return GetBuilder<ProjectController>(
              builder: (_) {
                return GetBuilder<LocationController>(builder: (_) {
                  return GetBuilder<FavoriteController>(builder: (_) {
                    return GetMaterialApp(
                      locale: Locale('ar', ''),
                      localizationsDelegates: const [
                        S.delegate,
                        GlobalMaterialLocalizations.delegate,
                        GlobalWidgetsLocalizations.delegate,
                        GlobalCupertinoLocalizations.delegate,
                      ],
                      supportedLocales: S.delegate.supportedLocales,
                      title: 'Etqaan Real Estate Demo',
                      debugShowCheckedModeBanner: false,
                      theme: ThemeData(
                        // This is the theme of your application.
                        //
                        // TRY THIS: Try running your application with "flutter run". You'll see
                        // the application has a purple toolbar. Then, without quitting the app,
                        // try changing the seedColor in the colorScheme below to Colors.green
                        // and then invoke "hot reload" (save your changes or press the "hot
                        // reload" button in a Flutter-supported IDE, or press "r" if you used
                        // the command line to start the app).
                        //
                        // Notice that the counter didn't reset back to zero; the application
                        // state is not lost during the reload. To reset the state, use hot
                        // restart instead.
                        //
                        // This works for code too, not just values: Most code changes can be
                        // tested with just a hot reload.
                        colorScheme:
                            ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                        useMaterial3: true,
                      ),
                      //home: SocialMediaPage(),
                      initialRoute: RouteHelper.getSplashPage(),
                      getPages: RouteHelper.routes,
                    );
                  });
                });
              },
            );
          });
        });
      }),
    );
  }
}
