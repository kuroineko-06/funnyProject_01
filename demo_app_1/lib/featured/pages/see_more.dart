import 'package:demo_app_1/classes/language_constaits.dart';
import 'package:demo_app_1/data/categoris.dart';
import 'package:demo_app_1/featured/bloc/see_more_bloc.dart';
import 'package:demo_app_1/featured/models/categories_data_model.dart';
import 'package:demo_app_1/featured/pages/account.dart';
import 'package:demo_app_1/featured/widgets/home_categories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SeeMore extends StatefulWidget {
  const SeeMore({super.key});

  @override
  State<SeeMore> createState() => _SeeMoreState();
}

class _SeeMoreState extends State<SeeMore> {
  void initState() {
    seeMoreBloc.add(SeeMoreInitialEvent());
    super.initState();
  }

  final SeeMoreBloc seeMoreBloc = SeeMoreBloc(CategoriesCourse());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(translation(context).seeMoreBtn),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
          ),
        ],
      ),
      body: BlocConsumer<SeeMoreBloc, SeeMoreState>(
        bloc: seeMoreBloc,
        listener: (context, state) {},
        builder: (context, state) {
          switch (state.runtimeType) {
            case SeeMoreSuccessState:
              final successState = state as SeeMoreSuccessState;
              List<DataCategoriesModel> data_model = successState.dataItems;
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Column(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 20),
                            alignment: Alignment.topLeft,
                            child: Text(
                              translation(context).recommend,
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            margin: EdgeInsets.only(bottom: 20),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.only(right: 20.0),
                                child: SizedBox(
                                  height: 700,
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
    );
  }
}
