import 'package:flutter/material.dart';

import '../widget/out_boarding_content.dart';
import '../widget/out_boarding_indicator.dart';

class Out extends StatefulWidget {
  const Out({Key? key}) : super(key: key);

  @override
  State<Out> createState() => _OutState();
}

class _OutState extends State<Out> {
  late PageController _pageController; //وحدة تحكم للصفحة
  int _currentPage = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController();
    //
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _pageController.dispose();
    super.dispose();
    //قلي لو سمحت اي كونتولر بتعرفو يتحكم بعنصر في ال يو اي لازم تسكر ال كونتولر
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              // if (_currentPage !=2)

              Align(
                alignment: AlignmentDirectional.topEnd,
                child: Visibility(
                  visible: _currentPage < 2,
                  child: TextButton(
                    onPressed: () {
                      _pageController.animateToPage(2,
                          duration: Duration(seconds: 1),
                          curve: Curves.easeInCirc);
                    },
                    child: Text('SKIP'),
                    style: ButtonStyle(),
                  ),
                  replacement: TextButton(
                    onPressed: () {},
                    child: Text('START'),
                  ),
                ),
              ),
              Expanded(
                child: PageView(
                  controller: _pageController,
                  // scrollDirection: Axis.vertical,// بتحرك بالاتجاه العمودي
                  scrollDirection: Axis.horizontal, // بتحرك بالاتجاه الافقي
                  onPageChanged: (int page) {
                    setState(() {
                      _currentPage = page;
                    });
                  },
                  children: const [
                    OutBoardingContent(
                      images: 'images/boarding1.png',
                      title: 'Destination ',
                      subtitle:
                          'Purchasing Process As Easy As Possible For You. For That Reason We Have Created A Few Buying Guides To Help Guide You Before Making You',
                    ),
                    OutBoardingContent(
                      images: 'images/boarding2.png',
                      title: 'Video 360°',
                      subtitle:
                          'Purchasing Process As Easy As Possible For You. For That Reason We Have Created A Few Buying Guides To Help Guide You Before Making You',
                    ),
                    OutBoardingContent(
                      images: 'images/boarding3.png',
                      title: 'Enjoy Your Holiday',
                      subtitle:
                          'Purchasing Process As Easy As Possible For You. For That Reason We Have Created A Few Buying Guides To Help Guide You Before Making You',
                    ),
                  ],
                ),
              ),
              // TabPageSelector(),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     TabPageSelectorIndicator(
              //       backgroundColor:
              //           _currentPage == 0 ? Colors.blue : Colors.grey.shade400,
              //       borderColor: Colors.orange,
              //       size: 10,
              //     ),
              //     TabPageSelectorIndicator(
              //       backgroundColor:
              //           _currentPage == 1 ? Colors.blue : Colors.grey.shade400,
              //       borderColor: Colors.orange,
              //       size: 10,
              //     ),
              //     TabPageSelectorIndicator(
              //       backgroundColor:
              //           _currentPage == 2 ? Colors.blue : Colors.grey.shade400,
              //       borderColor: Colors.orange,
              //       size: 10,
              //     ),
              //   ],
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutBoardingIndicator(
                    marginEnd: 14,
                    selected: _currentPage == 0,
                  ),
                  OutBoardingIndicator(
                    marginEnd: 14,
                    selected: _currentPage == 1,
                  ),
                  OutBoardingIndicator(
                    selected: _currentPage == 2,
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Visibility(
                    visible: _currentPage != 0,
                    maintainAnimation: true,
                    maintainSize: true,
                    maintainState: true,
                    child: IconButton(
                      onPressed: () {
                        _pageController.previousPage(
                          duration: Duration(seconds: 1),
                          curve: Curves.easeInCirc,
                        );
                      },
                      icon: Icon(
                        Icons.arrow_back_ios_rounded,
                      ),
                    ),
                  ),
                  Visibility(
                    visible: _currentPage != 2,
                    maintainAnimation: true,
                    maintainSize: true,
                    maintainState: true,
                    child: IconButton(
                      onPressed: () {
                        _pageController.nextPage(
                            duration: Duration(seconds: 1),
                            curve: Curves.easeInCirc);
                      },
                      icon: Icon(
                        Icons.arrow_forward_ios_rounded,
                      ),
                      color: _currentPage == 2 ? Colors.grey : Colors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Visibility(
                  visible: _currentPage == 2,
                  maintainAnimation: true,
                  maintainSize: true,
                  maintainState: true,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('START'),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(150, 45),
                    ),
                  )),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ));
  }
}
