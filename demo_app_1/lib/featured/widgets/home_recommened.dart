import 'package:demo_app_1/featured/models/categories_data_model.dart';
import 'package:flutter/material.dart';

class RecommendWidgets extends StatelessWidget {
  final DataCategoriesModel dataCategoriesModel;
  const RecommendWidgets({super.key, required this.dataCategoriesModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: SizedBox(
          width: 240,
          height: 180,
          child: Card(
            elevation: 8,
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  child: Container(
                    height: 80,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(
                                dataCategoriesModel.ImageURL as String))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Text(
                    dataCategoriesModel.CourseName as String,
                    style: TextStyle(
                        overflow: TextOverflow.clip,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
