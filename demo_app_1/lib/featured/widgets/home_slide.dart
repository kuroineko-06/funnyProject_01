import 'package:demo_app_1/featured/models/categories_data_model.dart';
import 'package:flutter/material.dart';

class SlideWidgets extends StatelessWidget {
  final DataCategoriesModel dataSliderModel;
  const SlideWidgets({super.key, required this.dataSliderModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: SizedBox(
        width: 360,
        height: 200,
        child: Card(
          elevation: 5,
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  height: 200,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              dataSliderModel.ImageURL as String))),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        Center(
                          child: Text(
                            dataSliderModel.CourseName as String,
                            textAlign: TextAlign.justify,
                            style: const TextStyle(
                              height: 2,
                              backgroundColor: Color.fromARGB(255, 73, 73, 73),
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: Color.fromARGB(255, 255, 154, 154),
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          margin: EdgeInsets.only(left: 20, top: 30),
                          child: SizedBox(
                            width: 500,
                            height: 90,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  dataSliderModel.Content as String,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 3,
                                  textAlign: TextAlign.left,
                                  style: const TextStyle(
                                      backgroundColor: Colors.white,
                                      color: Color.fromARGB(255, 15, 56, 89),
                                      fontSize: 19,
                                      fontWeight: FontWeight.w800),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 38,
                          child: Container(
                            padding: EdgeInsets.all(8),
                            alignment: Alignment.bottomRight,
                            child: Text(
                                "Price: \$" + dataSliderModel.Price.toString(),
                                style: TextStyle(
                                    backgroundColor: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromARGB(255, 16, 17, 15))),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
