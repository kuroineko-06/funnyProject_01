import 'package:demo_app_1/classes/language_constaits.dart';
import 'package:demo_app_1/data/categoris.dart';
import 'package:demo_app_1/featured/bloc/search_bloc.dart';
import 'package:demo_app_1/featured/models/categories_data_model.dart';
import 'package:demo_app_1/featured/pages/account.dart';
import 'package:demo_app_1/featured/widgets/home_categories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  void initState() {
    searchBloc.add(SearchInitialEvent());
    super.initState();
  }

  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
  final SearchBloc searchBloc = SearchBloc(CategoriesCourse());

  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    switch (index) {
      case 0:
        _navigatorKey.currentState?.pushReplacementNamed("home");
        Navigator.pop(context);
        break;
      case 1:
        _navigatorKey.currentState?.pushReplacementNamed("search");
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
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(translation(context).searchPage),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.notifications_none_outlined)),
          ),
        ],
      ),
      body: BlocConsumer<SearchBloc, SearchState>(
        bloc: searchBloc,
        listener: (context, state) {
          // TODO: implement listener
        },
        // listenWhen: (previous, current) => ,
        // buildWhen: (previous, current) => ,

        builder: (context, state) {
          switch (state.runtimeType) {
            case SearchSuccessState:
              final successState = state as SearchSuccessState;
              List<DataCategoriesModel> data_model = successState.dataItems;
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: translation(context).searchHint,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 25, left: 20),
                      child: Column(
                        children: <Widget>[
                          Container(
                            alignment: Alignment.topLeft,
                            margin: EdgeInsets.only(bottom: 10),
                            child: Text(
                              translation(context).categories,
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            child: Center(
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(right: 20.0, top: 20),
                                child: SizedBox(
                                  height: 500,
                                  width: 350,
                                  child: new ListView.builder(
                                      scrollDirection: Axis.vertical,
                                      // shrinkWrap: true,
                                      itemCount: data_model.length,
                                      itemBuilder: (context, index) {
                                        return CategoriesWidgets(
                                            dataCategoriesModel:
                                                data_model[index]);
                                      }),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );

            default:
              return SizedBox();
          }
        },
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
        // selectedIconTheme:
        //     IconThemeData(color: Colors.greenAccent, size: 30),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: _onItemTapped,
      ),
    );
  }
}
