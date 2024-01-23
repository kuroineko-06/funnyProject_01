import 'package:demo_app_1/classes/language_constaits.dart';
import 'package:demo_app_1/data/detail_course.dart';
import 'package:demo_app_1/featured/models/categories_data_model.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class DetailScreen extends StatefulWidget {
  final String id;
  final String URL;

  DetailScreen({required this.id, required this.URL});

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late Future<DataCategoriesModel> futureDetail;
  late final VideoPlayerController videoPlayerController;

  @override
  void initState() {
    super.initState();
    futureDetail = DetailCourse().getDetailById(widget.id);

    videoPlayerController =
        VideoPlayerController.networkUrl(Uri.parse(widget.URL))
          ..initialize().then((_) {
            videoPlayerController.play();
            // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
            setState(() {});
          });
  }

  void dispose() {
    videoPlayerController.dispose();
    //    widget.videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(translation(context).coursePage),
        backgroundColor: Colors.orangeAccent,
      ),
      body: FutureBuilder<DataCategoriesModel>(
        future: futureDetail,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error.toString()}'),
            );
          } else {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 10),
                    SizedBox(
                      width: double.maxFinite,
                      height: 300,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 225, 222, 222)),
                        child: ListView(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 17, right: 23),
                              width: 350,
                              height: 300,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                          snapshot.data!.ImageURL as String))),
                            ),
                            Container(
                                margin: EdgeInsets.only(right: 20),
                                width: 355,
                                height: 300,
                                child: videoPlayerController.value.isInitialized
                                    ? AspectRatio(
                                        aspectRatio: videoPlayerController
                                            .value.aspectRatio,
                                        child:
                                            VideoPlayer(videoPlayerController),
                                      )
                                    : Center(child: Text("No video found"))),
                          ],
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          videoPlayerController.value.isPlaying
                              ? videoPlayerController.pause()
                              : videoPlayerController.play();
                        });
                      },
                      child: Icon(
                        videoPlayerController.value.isPlaying
                            ? Icons.pause
                            : Icons.play_arrow,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 20),
                      width: 400,
                      child: Text('Name: ${snapshot.data!.CourseName}',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                        color: Colors.grey,
                        width: 1,
                      )),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                      padding: EdgeInsets.all(8),
                      height: 200,
                      width: 400,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 150, 203, 246),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          border: Border.all(
                            color: Colors.grey,
                            width: 1,
                          )),
                      child: SingleChildScrollView(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              RichText(
                                text: TextSpan(
                                  children: [
                                    const TextSpan(
                                      text: "Level: ",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                      ),
                                    ),
                                    TextSpan(
                                        text: snapshot.data!.SkillLevel,
                                        style: TextStyle(
                                            height: -0.2,
                                            fontSize: 18,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w700)),
                                  ],
                                ),
                              ),
                              SizedBox(height: 13),
                              RichText(
                                text: TextSpan(
                                  children: [
                                    const TextSpan(
                                      text: "Traning Program: ",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                      ),
                                    ),
                                    TextSpan(
                                        text: snapshot.data!.TrainingProgram,
                                        style: TextStyle(
                                            height: -0.2,
                                            fontSize: 18,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w700)),
                                  ],
                                ),
                              ),
                              SizedBox(height: 13),
                              RichText(
                                text: TextSpan(
                                  children: [
                                    const TextSpan(
                                      text: "Certification Type: ",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                      ),
                                    ),
                                    TextSpan(
                                        text: snapshot.data!.CertificationType,
                                        style: TextStyle(
                                            height: -0.2,
                                            fontSize: 18,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w700)),
                                  ],
                                ),
                              ),
                              SizedBox(height: 13),
                              RichText(
                                text: TextSpan(
                                  children: [
                                    const TextSpan(
                                      text: "Duration: ",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                      ),
                                    ),
                                    TextSpan(
                                        text: snapshot.data!.Duration,
                                        style: TextStyle(
                                            height: -0.2,
                                            fontSize: 18,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w700)),
                                  ],
                                ),
                              ),
                              SizedBox(height: 13),
                              RichText(
                                text: TextSpan(
                                  children: [
                                    const TextSpan(
                                      text: "Price: ",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                      ),
                                    ),
                                    TextSpan(
                                      text: "\$",
                                      style: TextStyle(
                                          height: -0.2,
                                          fontSize: 18,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    TextSpan(
                                        text: snapshot.data!.Price,
                                        style: TextStyle(
                                            height: -0.2,
                                            fontSize: 18,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w700)),
                                  ],
                                ),
                              ),
                              SizedBox(height: 13),
                            ]),
                      ),
                    ),
                    SizedBox(height: 13),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "Description: ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                              fontSize: 16,
                            ),
                          ),
                          TextSpan(
                              text: snapshot.data!.Content,
                              style: TextStyle(
                                fontSize: 16,
                                fontStyle: FontStyle.italic,
                              )),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
