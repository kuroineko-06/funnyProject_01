import 'package:demo_app_1/featured/bloc/home_bloc.dart';
import 'package:demo_app_1/featured/pages/account.dart';
import 'package:demo_app_1/featured/pages/details.dart';
import 'package:demo_app_1/featured/pages/search.dart';
import 'package:demo_app_1/featured/widgets/home_categories.dart';
import 'package:demo_app_1/featured/widgets/home_recommened.dart';
import 'package:demo_app_1/featured/widgets/home_slide.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }

  final HomeBloc homeBloc = HomeBloc();
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    switch (index) {
      case 0:
        _navigatorKey.currentState?.pushReplacementNamed("home");
        break;
      case 1:
        _navigatorKey.currentState?.pushReplacementNamed("search");
        // Get.to(() => Search());
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Search()),
        );
        break;
      case 2:
        _navigatorKey.currentState?.pushReplacementNamed("play");
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Account()),
        );
        break;
      case 3:
        _navigatorKey.currentState?.pushReplacementNamed("message");
        break;
      case 4:
        _navigatorKey.currentState?.pushReplacementNamed("profile");
        break;
    }
    return setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      // listenWhen: (previous, current) => current is HomeActionState,
      // buildWhen: (previous, current) => current is !HomeActionState,
      listener: (context, state) {},

      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoadingState:
            return Scaffold(
                body: Center(
              child: CircularProgressIndicator(),
            ));

          case HomeLoadedSuccessState:
            final successState = state as HomeLoadedSuccessState;
            return Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                backgroundColor: Colors.white,
                centerTitle: true,
                title: Text('influencer.'),
                leading: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: IconButton(
                    icon: const Icon(Icons.person_2),
                    tooltip: 'Menu Icon',
                    onPressed: () {
                      homeBloc.add(HomeNavigateToAccountEvent());
                    },
                  ),
                ),
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: IconButton(
                        onPressed: () {
                          homeBloc.add(HomeNavigateToNotificationEvent());
                        },
                        icon: Icon(Icons.notifications_none_outlined)),
                  ),
                ],
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, top: 10),
                      child: SizedBox(
                        height: 210.0,
                        child: ListView.builder(
                            itemCount: successState.data.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return SlideWidgets(
                                  dataModel: successState.data[index]);
                            }),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 25, left: 10),
                      child: Column(
                        children: <Widget>[
                          Container(
                            alignment: Alignment.topLeft,
                            margin: EdgeInsets.only(bottom: 10),
                            child: Text(
                              'Categories',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            height: 150,
                            child: new ListView.builder(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemCount: successState.data.length,
                              itemBuilder: (context, index) {
                                return TextButton(
                                  style: TextButton.styleFrom(
                                      foregroundColor: Colors.white),
                                  onPressed: () {
                                    Get.to(() => Details());
                                  },
                                  child: CategoriesWidgets(
                                      dataModel: successState.data[index]),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 25, left: 10),
                      child: Column(
                        children: <Widget>[
                          Container(
                            alignment: Alignment.bottomCenter,
                            margin: EdgeInsets.only(bottom: 10, top: 10),
                            child: Row(
                              children: <Widget>[
                                Text(
                                  'Recommended',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                Spacer(),
                                TextButton(
                                  style: ButtonStyle(
                                    foregroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.blue),
                                  ),
                                  onPressed: () {},
                                  child: Text('See more'),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 200,
                            child: new ListView.builder(
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemCount: successState.data.length,
                                itemBuilder: (context, index) {
                                  return RecommendWidgets(
                                      dataModel: successState.data[index]);
                                }),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              bottomNavigationBar: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                currentIndex: _selectedIndex,
                backgroundColor: Colors.black,
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home_filled),
                    label: 'home',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.search_outlined),
                    label: 'search',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.play_arrow_outlined),
                    label: 'play',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.mark_chat_unread_outlined),
                    label: 'message',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person),
                    label: 'profile',
                  ),
                ],
                selectedFontSize: 10,
                selectedItemColor: Colors.white,
                unselectedItemColor: Colors.white,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                onTap: _onItemTapped,
              ),
            );

          case HomeErrorState:
            return Scaffold(
              body: Center(
                child: Text("Error!"),
              ),
            );
          default:
            return SizedBox();
        }
      },
    );
  }
}
