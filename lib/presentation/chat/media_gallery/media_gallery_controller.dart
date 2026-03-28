import 'package:get/get.dart';

enum MediaType { images, videos, documents, links, audio }

class MediaGalleryController extends GetxController {
  final selectedTab = MediaType.images.obs;
  final isLoading = false.obs;

  final images = <String>[].obs;
  final videos = <String>[].obs;
  final documents = <Map<String, String>>[].obs;
  final links = <String>[].obs;
  final audio = <Map<String, String>>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadMedia();
  }

  void loadMedia() {
    // Mock data
    images.value = List.generate(
      12,
      (i) => 'https://picsum.photos/200/200?random=$i',
    );

    videos.value = List.generate(
      6,
      (i) => 'https://picsum.photos/200/200?random=${i + 20}',
    );

    documents.value = [
      {'name': 'Document.pdf', 'size': '2.5 MB'},
      {'name': 'Presentation.pptx', 'size': '5.1 MB'},
      {'name': 'Spreadsheet.xlsx', 'size': '1.2 MB'},
    ];

    links.value = [
      'https://example.com/article1',
      'https://example.com/article2',
      'https://github.com/flutter',
    ];

    audio.value = [
      {'name': 'Voice Message 1', 'duration': '0:45'},
      {'name': 'Voice Message 2', 'duration': '1:23'},
    ];
  }

  void changeTab(MediaType type) {
    selectedTab.value = type;
  }
}
