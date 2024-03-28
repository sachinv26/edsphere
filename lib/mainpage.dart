import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schoolapp/Blocs/auth_bloc/login_bloc.dart';
import 'package:schoolapp/Blocs/auth_bloc/login_state.dart';
import 'package:schoolapp/screens/chat_page.dart';
import 'package:schoolapp/screens/home_page.dart';
import 'package:schoolapp/screens/mainfees.dart';
import 'package:schoolapp/screens/profile_page.dart';
import 'package:schoolapp/services/loginpage.dart';
import 'package:schoolapp/data/apiClient/getfee.dart';
class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        if (state is AuthenticationAuthenticatedState) {
          return Scaffold(
            body: _buildCurrentPage(state),
            bottomNavigationBar: MyBottomNavigationBar(
              currentIndex: 0, // Set the default index as needed
              onTabTapped: (int index) {
                if(index==1){
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>ProfilePage()));
                }
                else if(index==2){
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>MainFees(itemIds: FeeApi.itemIds,)));
                }
                else if(index==3){
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>ChatPage()));
                }
              },
            ),
          );
        } else {
          // Redirect to the login page or handle unauthenticated state
          return LoginPage();
        }
      },
    );
  }

  Widget _buildCurrentPage(AuthenticationAuthenticatedState state) {
    switch (state.currentPage) {
      case CurrentPage.home:
        return LoginPage();
      case CurrentPage.payFees:
        return ProfilePage();
      case CurrentPage.settings:
        return MainFees(itemIds: FeeApi.itemIds,);
      case CurrentPage.chat:
        return ChatPage();
      default:
        return LoginPage(); // Default to the home page
    }
  }
}

enum CurrentPage {
  home,
  payFees,
  settings,
  chat,
}



class MyBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTabTapped;

  MyBottomNavigationBar({
    required this.currentIndex,
    required this.onTabTapped,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      currentIndex: currentIndex,
      onTap: onTabTapped,
      items: [
        _bottomNavItem(Icons.home, 'Home', 0),
        _bottomNavItem(Icons.account_circle, 'Profile', 1),
        _bottomNavItem(Icons.credit_card, 'Fees', 2),
        _bottomNavItem(Icons.chat_bubble, 'Whatsapp', 3),
      ],
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      showUnselectedLabels: true,
    );
  }

  BottomNavigationBarItem _bottomNavItem(
      IconData icon, String label, int index) {
    return BottomNavigationBarItem(
      icon: Icon(
        icon,
        color: currentIndex == index ? Colors.blue : Colors.grey,
      ),
      label: label,
    );
  }
}
