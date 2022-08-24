import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shutter/Controller/fetchImageController.dart';
import 'package:flutter_shutter/View/Widgets/ImageItem.dart';
import 'package:flutter_shutter/View/Widgets/TextFieldWidget.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FetchImageController fetchImageController =
      Get.put(FetchImageController());

  @override
  Widget build(BuildContext context) {
    debugPrint(
        'this is search text : ${fetchImageController.searchController.value.text}');
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
          appBar: AppBar(
              centerTitle: true,
              title: TextFieldWidget(
                searchController: fetchImageController.searchController,
                clearText: () {
                  setState(() {
                    fetchImageController.searchController.clear();
                  });
                },
                onFieldSubmit: (value) {
                  setState(() {
                    fetchImageController.searchController.text = value;
                  });
                  fetchImageController.imageList.clear();
                  fetchImageController.page.value = 1;
                  fetchImageController.fetchImages();
                },
              )),
          body: Obx(() {
            return fetchImageController.isFirstLoadRunning.value
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                            shrinkWrap: true,
                            controller: fetchImageController.scrollController,
                            itemCount: fetchImageController.imageList.length,
                            itemBuilder: (context, index) => Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ImageItem(
                                    imageModelData:
                                        fetchImageController.imageList[index],
                                  ),
                                )),
                      ),

                      // when the _loadMore function is running
                      if (fetchImageController.isLoadMoreRunning.value == true)
                        const Padding(
                          padding: EdgeInsets.only(top: 10, bottom: 40),
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),

                      // When nothing else to load
                      if (fetchImageController.hasNextPage.value == false)
                        Container(
                          padding: const EdgeInsets.only(top: 30, bottom: 40),
                          color: Colors.amber,
                          child: const Center(
                            child: Text('You have fetched all of the content'),
                          ),
                        ),

                    ],
                  );
          })),
    );
  }
}
