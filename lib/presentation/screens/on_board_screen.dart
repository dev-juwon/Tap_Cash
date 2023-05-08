import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tap_cash/core/components/navigator.dart';
import 'package:tap_cash/core/components/sized_box.dart';
import 'package:tap_cash/core/network/cache_helper.dart';
import 'package:tap_cash/core/components/size_config.dart';
import 'package:tap_cash/core/theme/app_color/app_color_light.dart';
import 'package:tap_cash/generated/assets.dart';
import 'package:tap_cash/model/on_board/on_board_model.dart';
import 'package:tap_cash/presentation/screens/sign_in_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var pageController = PageController();

  List<BoardingModel> boarding = [
    BoardingModel(
      image: Assets.imagesOnBoard1,
      title:
          '"Take control of your finances with our user-friendly dashboard and savings plans."',
    ),
    BoardingModel(
      image: Assets.imagesOnBoard2,
      title:
          '"Get a bird\'s-eye view of your accounts and transactions with our dashboard."',
    ),
    BoardingModel(
      image: Assets.imagesOnBoard3,
      title: '"Simplify your finances with our smart and secure e-wallet."',
    ),
    BoardingModel(
      image: Assets.imagesOnBoard4,
      title:
          '"Pay with ease and security using our smart card for online and in-store purchases."',
    ),
    BoardingModel(
      image: Assets.imagesOnBoard5,
      title:
          '"Teach your kids financial responsibility with our smart kids\' card and parental controls."',
    ),
  ];
  bool isLast = false;

  void submit() {
    CacheHelper.saveData(
      key: 'onBoarding',
      value: true,
    ).then((value) {
      if (value) {
        navigateAndFinish(context, const SignInScreen());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 10.h,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0).r,
            child: Align(
              alignment: Alignment.bottomRight,
              child: TextButton(
                onPressed: () {
                  submit();
                },
                child: Text(
                  isLast ? '' : 'skip',
                  style: GoogleFonts.poppins(
                    color: AppColors.primaryColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                  ),

                  // style: TextStyle(

                  // ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: PageView.builder(
                      physics: const BouncingScrollPhysics(),
                      onPageChanged: (int index) {
                        if (index == boarding.length - 1) {
                          setState(() {
                            isLast = true;
                          });
                        } else {
                          setState(() {
                            isLast = false;
                          });
                        }
                      },
                      controller: pageController,
                      itemBuilder: (context, index) =>
                          buildBoardingItem(boarding[index]),
                      itemCount: boarding.length,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          if (isLast) {
                            submit();
                          } else {
                            pageController.nextPage(
                              duration: const Duration(
                                milliseconds: 780,
                              ),
                              curve: Curves.ease,
                            );
                          }
                        },
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(
                                    horizontal: 35, vertical: 12)
                                .r,
                            width: 163,
                            height: 48,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(const Radius.circular(15).r),
                              color: AppColors.primaryColor,
                            ),
                            child: FittedBox(
                              child: Text(
                                isLast ? "Get Started" : 'Next',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Space(height: 40.h, width: 0),
                      SmoothPageIndicator(
                        textDirection: TextDirection.ltr,
                        controller: pageController,
                        count: boarding.length,
                        effect: const ExpandingDotsEffect(
                          dotWidth: 12.0,
                          dotHeight: 12.0,
                          dotColor: AppColors.dotsColor,
                          activeDotColor: AppColors.primaryColor,
                          radius: 20.0,
                          spacing: 17,
                          expansionFactor: 1.01,
                        ),
                      ),
                      Space(height: 48.h, width: 0),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildBoardingItem(BoardingModel model) => SingleChildScrollView(
        child: Column(
          children: [
            SvgPicture.asset(model.image),
            Space(height: 30.h, width: 0),
            Text(
              model.title,
              textAlign: TextAlign.start,
              style: GoogleFonts.poppins(
                fontSize: 22.sp,
                color: AppColors.titleColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      );
}
