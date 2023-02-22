import 'dart:developer';
import 'dart:ui';

import 'package:business_empire/services/auth.dart';
import 'package:business_empire/utils/strings.dart';
import 'package:business_empire/utils/utils.dart';
import 'package:business_empire/widgets/dot_indicator.dart';
import 'package:business_empire/widgets/get_started.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentPage = 0;
  final pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          CachedNetworkImage(
            imageUrl: newRelease[currentPage],
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
              ),
            ),
          ),
          PageView(
            controller: pageController,
            children: <Widget>[
              _buildPageContent(
                context,
                'Reviews of All Games',
                'Find the best games and read reviews from ReviewTherapist.',
                newRelease[0],
              ),
              _buildPageContent(
                context,
                'Game Updations',
                'Get the latest updates of your favorite games.',
                newRelease[1],
              ),
              _buildPageContent(
                context,
                'Review Therapist',
                'Get the latest updates of your favorite games.',
                newRelease[2],
              ),
              _lastPage()
            ],
            onPageChanged: (int page) {
              setState(() {
                currentPage = page;
              });
            },
          ),
          Positioned(
            bottom: 20.0,
            left: 10.0,
            right: 0.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Center(
                  child: DotsIndicator(
                    dotsCount: 4,
                    position: currentPage,
                  ),
                ),
                Center(
                  child: currentPage == 3
                      // ? TextButton(
                      //     onPressed: () {
                      //       // Navigator.pushReplacement(
                      //       //     context,
                      //       //     MaterialPageRoute(
                      //       //         builder: (context) => const LoginPage()));
                      //     },
                      //     child: const Text(
                      //       '',
                      //       style: TextStyle(color: Colors.red),
                      //     ),
                      //   )
                      ? Container()
                      : TextButton(
                          onPressed: () {
                            pageController.nextPage(
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.ease);
                          },
                          child: const Text(
                            'Skip',
                            style: TextStyle(color: Colors.red),
                          )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPageContent(
    BuildContext context,
    String title,
    String description,
    String image,
  ) {
    return Container(
      decoration: const BoxDecoration(),
      child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: CachedNetworkImage(
                  imageUrl: image,
                  imageBuilder: (context, imageProvider) => Container(
                        height: 450.0,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
                              offset: Offset(0.0, 15.0),
                              blurRadius: 15.0,
                            ),
                            BoxShadow(
                              color: Colors.black12,
                              offset: Offset(0.0, -10.0),
                              blurRadius: 10.0,
                            ),
                          ],
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                  placeholder: (context, url) => Container(
                        height: 450.0,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
                              offset: Offset(0.0, 15.0),
                              blurRadius: 15.0,
                            ),
                            BoxShadow(
                              color: Colors.black12,
                              offset: Offset(0.0, -10.0),
                              blurRadius: 10.0,
                            ),
                          ],
                        ),
                      )),
            ),
            const SizedBox(
              height: 40.0,
            ),
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32.0,
                color: Colors.white,
              ),
            ),
            // const SizedBox(
            //   height: 20.0,
            // ),
            Text(
              description,
              style: const TextStyle(
                fontSize: 18.0,
                height: 1.5,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _lastPage() {
    return Container(
      decoration: const BoxDecoration(),
      child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: 40.0,
            ),
            const Text(
              'Review Therapist',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32.0,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            const Text(
              'Get the latest updates of your favorite games.',
              style: TextStyle(
                fontSize: 18.0,
                height: 1.5,
                color: Colors.white,
              ),
            ),
            const Spacer(),
            const Text("Let's Get Started with",
                style: TextStyle(
                  fontSize: 18.0,
                  height: 1.5,
                  color: Colors.white,
                )),
            AppSize().height20,
            GetStartedWidget(
              text: "Get started with Google",
              icon: LineIcons.googleLogo,
              onTap: () {
                log('Google');
                context.read<FirebaseAuthMethods>().signInWithGoogle(context);
              },
            ),
            AppSize().height20,
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
