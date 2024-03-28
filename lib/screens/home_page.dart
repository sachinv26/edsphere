import 'package:flutter/material.dart';
import 'package:schoolapp/core/utils/size_utils.dart';
import 'package:schoolapp/data/apiClient/getbirthdays.dart';
import 'package:schoolapp/data/apiClient/getfee.dart';
import 'package:schoolapp/screens/birthday_page.dart';
import 'package:schoolapp/screens/homework_page.dart';
import 'package:schoolapp/screens/marksscreen.dart';
import 'package:schoolapp/screens/event_page.dart';
import 'package:schoolapp/screens/mainfees.dart';
import 'package:schoolapp/screens/profile_page.dart';
import 'package:schoolapp/screens/study_material.dart';
import 'package:schoolapp/screens/yearly_attendance.dart';
import 'package:schoolapp/theme/app_decoration.dart';
import 'package:schoolapp/theme/custom_text_style.dart';
import 'package:schoolapp/data/models/student_model.dart';
import '../theme/theme_helper.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatefulWidget {

  final String name;
  final String fname;
  final String mname;
  final String classs;
  final String address;
  final String number;
  final String admissionDate;
  final String admissionNo;
  final String dob;
  final String email;
  final String gender;

  const HomePage({Key? key, required this.name, required this.fname, required this.mname, required this.classs, required this.address, required this.number, required this.admissionDate, required this.admissionNo, required this.dob, required this.email, required this.gender}) : super(key: key);


  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CarouselController carouselController = CarouselController();
  int currentindex = 0;
  List<MenuDetail> menus = [];





  List<String> iconNames = [
    'Profile',
    'Event',
    'Attendance',
    'Pay Fee',
    'Birthday',
    'Result',
    'E-Material',
    'Home Work'
  ];

  List imagelist = [
    {
      "id": 1,
      "image_path": "https://images.pexels.com/photos/2982449/pexels-photo-2982449.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
    },
    {
      "id": 2,
      "image_path": "https://images.pexels.com/photos/2982449/pexels-photo-2982449.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
    },
    {
      "id": 3,
      "image_path": "https://images.pexels.com/photos/2982449/pexels-photo-2982449.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
    },
    {
      "id": 4,
      "image_path": "https://images.pexels.com/photos/2982449/pexels-photo-2982449.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
    },
    {
      "id": 5,
      "image_path": "https://images.pexels.com/photos/2982449/pexels-photo-2982449.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
    },
  ];

  List<String> iconAssetPaths = [
    'assets/icons/1.png',
    'assets/icons/2.png',
    'assets/icons/3.png',
    'assets/icons/4.png',
    'assets/icons/8.png',
    'assets/icons/9.png',
    'assets/icons/10.png',
    'assets/icons/7.png',
  ];

  List<Widget> pages = [
    ProfilePage(),
    EventPage(
    ),
    YearlyPage(),
    MainFees(
      itemIds: FeeApi.itemIds,
    ),
    BirthdayPage(
      birthdays: Birthdays.birthdays,
    ),
    MarksScreen(),
    StudyMaterial(),
    HomeWorkPage(),
  ];

  List<Widget> menupages = [
    ProfilePage(),
    EventPage(
    ),
    YearlyPage(),
    MainFees(
      itemIds: FeeApi.itemIds,
    ),
    BirthdayPage(
      birthdays: Birthdays.birthdays,
    ),
    MarksScreen(),
    StudyMaterial(),
    HomeWorkPage(),
  ];

  List<String> iconColors = [
    '#46C0EF',
    '#1C5D9E',
    '#742775',
    '#1BD491',
    '#FE9D00',
    '#057E89',
    '#FA312F',
    '#000000',
    '#722774',
  ];

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        drawer: Drawer(
          child: Column(
            children: [
              Container(
                height: 40.h,
                color: Color(0xFF0C1D3B),
              ),
              Container(
                width: double.maxFinite,
                padding: EdgeInsets.all(1.h),
                color: const Color(0xFF0C1D3B),
                height: 80.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircleAvatar(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Container(
                          child: Image.asset("assets/icons/childlogo.png"),
                        ),
                      ),
                      radius: 30,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Text(
                            'Edsphere',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                        Container(
                          child: Text(
                            'Edsphere solutions',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Container(
                          child: Text(
                            '9026634459',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              ElevatedButton(
                  onPressed: () {

                  },
                  child: Text('Logout')),
            ],
          ),
        ),
        appBar: AppBar(
          centerTitle: false,
          elevation: 0,
          leadingWidth: 36.h,
          title: Text(
            "Main Menu",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          flexibleSpace: Container(
            padding: EdgeInsets.symmetric(vertical: 15.v),
            decoration: BoxDecoration(
              color: Color(0xFF46C0EF),
            ),
          ),
        ),
        backgroundColor: appTheme.gray100,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                _buildFrame(context),
                Container(
                  decoration: ShapeDecoration(
                    color: const Color(0xFFF3F3F3),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: GridView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 1,
                    ),
                    itemCount: pages.length,
                    // Inside the GridView.builder, wrap specific icons with a Stack
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          // Navigate to the corresponding page when tapped
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => pages[index]),
                          );
                        },
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(int.parse(
                                        iconColors[index].substring(1, 7),
                                        radix: 16) +
                                    0xFF000000),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0x33212121),
                                    blurRadius: 2,
                                    offset: Offset(2, 2),
                                    spreadRadius: 0,
                                  ),
                                ],
                              ),
                              width: 60.h,
                              child: Image.asset(
                                iconAssetPaths[index],
                                fit: BoxFit.scaleDown,
                                color: Colors.white,
                              ),
                            ),
                            Expanded(
                              child: Container(
                                child: Text(
                                  iconNames[index],
                                  style: TextStyle(
                                    fontSize: 11.h,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 60.h,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  margin: EdgeInsets.all(10),
                  height: 200.h,
                  width: double.maxFinite,
                  child: Stack(
                    children: [
                      InkWell(
                        onTap: () {
                          print(currentindex);
                        },
                        child: CarouselSlider(
                          items: imagelist
                              .map(
                                (item) => Image.network(
                                  item['image_path'],
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                ),
                              )
                              .toList(),
                          carouselController: carouselController,
                          options: CarouselOptions(
                              scrollPhysics: const BouncingScrollPhysics(),
                              autoPlay: true,
                              aspectRatio: 2,
                              viewportFraction: 1,
                              onPageChanged: (index, reason) {
                                setState(() {
                                  currentindex = index;
                                });
                              }),
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        left: 0,
                        right: 0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: imagelist.asMap().entries.map((entry) {
                            return GestureDetector(
                              onTap: () =>
                                  carouselController.animateToPage(entry.key),
                              child: Container(
                                width: currentindex == entry.key ? 17 : 7,
                                height: 7.0,
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 3.0,
                                ),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: currentindex == entry.key
                                        ? Colors.red
                                        : Colors.blue),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFrame(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15.v),
      decoration: AppDecoration.gradientLightBlueToLightBlue,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10.h),
            padding: EdgeInsets.all(10.h),
            decoration: AppDecoration.outlineBluegray10001.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder12,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: CircleAvatar(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Container(),
                        ),
                        radius: 30,
                        // backgroundImage: CachedNetworkImage(,imageUrl:'${studentBirthday?.photo}' ),
                      ),
                      height: 64.adaptSize,
                      width: 64.adaptSize,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          8.h,
                        ),
                      ),
                      margin: EdgeInsets.only(bottom: 9.v),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: 10.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.name,
                              style: CustomTextStyles.titleMediumBold,
                            ),
                            SizedBox(height: 5.v),
                            Row(
                              children: [
                                Text(
                                  "Father: ",
                                  style: CustomTextStyles.labelLargeBlack900,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 2.h),
                                  child: Text(
                                    widget.fname,
                                    style: theme.textTheme.bodySmall,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 4.v),
                            Padding(
                              padding: EdgeInsets.only(right: 1.h),
                              child: Row(
                                children: [
                                  Text(
                                    'Class- ' +
                                        widget.classs +
                                        "Section- " +
                                        'A',
                                    style: CustomTextStyles.labelLargeMedium,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: 1.v,
                                      bottom: 1.v,
                                    ),
                                    child: Text(
                                      "Roll No- " + '201b225',
                                      style: CustomTextStyles.labelLargeMedium,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4.v),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
