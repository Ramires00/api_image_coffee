import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:coffee_api/repository/repository_coffee.dart';
import '../model/model_coffee.dart';
import 'package:get/get.dart';

class View extends StatelessWidget {
  View({Key? key}) : super(key: key);

  Future<Model> getImage() async => await Repository(Dio()).coffeeImages();

  final RxBool isLoading = RxBool(false);
  final Rx<Model> model = Model(coffeeImg: '').obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                'https://t4.ftcdn.net/jpg/00/90/32/09/360_F_90320915_ixNzmAX9nCjEs4oEX7psIKbzLMyBvWqU.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: _body(),
      ),
    );
  }

  _appBar() => AppBar(
        title: Center(
          child: Text(
            "Coffee Time",
            style: GoogleFonts.aladin(color: Colors.black, fontSize: 35),
          ),
        ),
        backgroundColor: Colors.brown,
      );

  _body() => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () => isLoading.value
                  ? CircularProgressIndicator()
                  : model.value.coffeeImg.isEmpty
                      ? Container(
                          width: 200,
                          height: 200,
                          color: Colors.transparent,
                        )
                      : Container(
                          width: 300,
                          height: 300,
                          child: Image.network(model.value.coffeeImg,
                              fit: BoxFit.cover),
                        ),
            ),
            SizedBox(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.brown),
              onPressed: () async {
                isLoading.value = true;
                model.value = await getImage();
                isLoading.value = false;
              },
              child: Text(
                "free coffee images",
                style: GoogleFonts.aladin(color: Colors.black, fontSize: 35),
              ),
            ),
          ],
        ),
      );
}
