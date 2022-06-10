import 'dart:typed_data';

import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:quotes_app/quotes_category/english.dart';
import 'package:quotes_app/quotes_category/gujarati.dart';
import 'package:quotes_app/quotes_category/hindi.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share/share.dart';

class GujaratiQuotes extends StatefulWidget {
  const GujaratiQuotes({Key? key}) : super(key: key);

  @override
  _GujaratiQuotesState createState() => _GujaratiQuotesState();
}

class _GujaratiQuotesState extends State<GujaratiQuotes> {
  Uint8List? bytes;

  final _controller = ScreenshotController();

  List<Color> colors = [];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    for (int i = 0; i <= gujaratiQuotes.length; i = i + 5) {
      colors.add(Colors.teal.shade400);
      colors.add(Colors.red.shade400);
      colors.add(Colors.purple.shade400);
      colors.add(Colors.yellow.shade700);
      colors.add(Colors.pink.shade400);
    }
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        titleSpacing: 0,
        title: Text("Life and Inspirational Quotes"),
        backgroundColor: Colors.yellow.shade700,
        toolbarHeight: size.height * 0.08,
      ),
      body: Theme(
        data: Theme.of(context).copyWith(
          scrollbarTheme: ScrollbarThemeData(
            radius: Radius.circular(10),
            thickness: MaterialStateProperty.all(7),
            minThumbLength: 100,
            thumbColor: MaterialStateProperty.all(Colors.yellow.shade800),
          ),
        ),
        child: Scrollbar(
          child: ListView.builder(
            itemCount: gujaratiQuotes.length,
            itemBuilder: (context, index) {
              return Stack(
                overflow: Overflow.visible,
                children: [
                  Card(
                    elevation: 10,
                    margin: EdgeInsets.symmetric(horizontal: 8, vertical: 20),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    color: colors[index],
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 60),
                      child: SelectableText(
                        "${gujaratiQuotes[index]}",
                        style: TextStyle(
                            //fontStyle: FontStyle.italic,
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () async {
                            final image =
                                await _controller.captureFromWidget(Material(
                              child: Card(
                                elevation: 10,
                                margin: EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 20),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)),
                                color: colors[index],
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 24, vertical: 60),
                                  child: Text(
                                    "${gujaratiQuotes[index]}",
                                    style: TextStyle(
                                        //fontStyle: FontStyle.italic,
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ));
                            await saveImage(image).then(
                              (value) => Fluttertoast.showToast(
                                  msg: "Downloaded !",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.black,
                                  textColor: Colors.white,
                                  fontSize: 16.0),
                            );
                          },
                          child: Container(
                            height: size.height * 0.055,
                            width: size.height * 0.055,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.shade400,
                                      blurRadius: 4,
                                      spreadRadius: 3,
                                      offset: Offset(0, 3))
                                ],
                                shape: BoxShape.circle),
                            child: Icon(
                              Icons.download_rounded,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(width: size.height * 0.03),
                        GestureDetector(
                          onTap: () {
                            FlutterClipboard.copy(englishQuotes[index]).then(
                              (value) => Fluttertoast.showToast(
                                  msg: "Copied !",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.black,
                                  textColor: Colors.white,
                                  fontSize: 16.0),
                            );
                          },
                          child: Container(
                            height: size.height * 0.055,
                            width: size.height * 0.055,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.shade400,
                                      blurRadius: 4,
                                      spreadRadius: 3,
                                      offset: Offset(0, 3))
                                ],
                                shape: BoxShape.circle),
                            child: Icon(
                              Icons.copy,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(width: size.height * 0.03),
                        GestureDetector(
                          onTap: () {
                            Share.share(englishQuotes[index].toString());
                          },
                          child: Container(
                            height: size.height * 0.055,
                            width: size.height * 0.10,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.shade400,
                                      blurRadius: 4,
                                      spreadRadius: 3,
                                      offset: Offset(0, 3))
                                ],
                                borderRadius: BorderRadius.circular(30)),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Center(
                                child: Text(
                                  "Share",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

Future<String> saveImage(Uint8List bytes) async {
  await [Permission.storage].request();

  final time = DateTime.now()
      .toIso8601String()
      .replaceAll('.', '-')
      .replaceAll(':', '-');
  final name = 'screenshot$time';
  final result = await ImageGallerySaver.saveImage(bytes, name: name);
  return result['filePath'];
}
