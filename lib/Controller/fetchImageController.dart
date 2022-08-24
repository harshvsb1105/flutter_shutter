import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shutter/Model/DataModel/DataModel.dart';
import 'package:flutter_shutter/Model/ImageModel/ImageModel.dart';
import 'package:get/get.dart';
import 'package:flutter_shutter/Service/ApiService.dart';

class FetchImageController extends GetxController {
  var searchController = TextEditingController(text: '');
  late ScrollController scrollController;

  /// At the beginning, we fetch the first 20 posts
  var page = 1.obs;

  /// you can change this value to fetch more or less posts per page (10, 15, 5, etc)
  var limit = 20.obs;

  /// There is next page or not
  var hasNextPage = true.obs;

  /// Used to display loading indicators when fetchImage function is running
  var isFirstLoadRunning = false.obs;

  /// Used to display loading indicators when _loadMore function is running
  var isLoadMoreRunning = false.obs;

  /// This holds the posts fetched from the server
  List<Data> imageList = <Data>[].obs;

  var imageModelList = ImageModel().obs;

  @override
  void onInit() {
    fetchImages();
    scrollController = ScrollController()..addListener(fetchMoreImages);
    super.onInit();
  }

  @override
  void dispose() {
    scrollController.removeListener(fetchMoreImages);
    super.dispose();
  }

  void fetchImages() async {
    isFirstLoadRunning.value = true;

    try {
      imageModelList.value = (await ApiService()
          .fetchImageService(searchController.text, page.value, limit.value))!;
      debugPrint('This is model value : ${imageModelList.value.imageListData?.length}');
      imageList.addAll(imageModelList.value.imageListData!.whereType());
    } catch (err) {
      if (kDebugMode) {
        print('Something went wrong');
      }
    }
    isFirstLoadRunning.value = false;
  }

  Future<ImageModel?> fetchMoreImages() async {
    if (hasNextPage.value == true &&
        isFirstLoadRunning.value == false &&
        isLoadMoreRunning.value == false &&
        scrollController.position.pixels >
            scrollController.position.maxScrollExtent - 200) {
      isLoadMoreRunning.value = true;
      page.value += 1;

      try {
        imageModelList.value = (await ApiService().fetchImageService(
            searchController.text, page.value, limit.value))!;
        debugPrint('Outside if statement');

        if (imageModelList != null) {
          debugPrint('Inside if statement');
          imageList.addAll(imageModelList.value.imageListData!.whereType());
        } else {
          // This means there is no more data
          // and therefore, we will not send another GET request
          hasNextPage.value = false;
        }
      } catch (err) {
        if (kDebugMode) {
          print('Something went wrong!');
        }
      }
      isLoadMoreRunning.value = false;
    }
  }
}
