import 'package:demo_app_1/featured/models/home_data_model.dart';
import 'package:flutter/material.dart';

class RecommendWidgets extends StatelessWidget {
  final DataModel dataModel;
  const RecommendWidgets({super.key, required this.dataModel});

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
                            image: NetworkImage(dataModel.imageUrl))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Text(
                    dataModel.title,
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
