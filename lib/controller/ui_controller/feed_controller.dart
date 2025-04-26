import 'package:get/get.dart';
import '../../controller/service_controller/feed_service_controller.dart';
import '../../features/models/feed_model.dart';

class FeedController extends GetxController {
  final FeedService _feedService = FeedService();

  final feedModel = Rxn<FeedModel>();
  final isLoading = false.obs;

  // Provide a non-nullable stream with initial empty state
  Stream<FeedModel> get postStream => feedModel.stream
      .where((model) => model != null)
      .map((model) => model!);

  @override
  void onInit() {
    super.onInit();
    fetchPosts();
  }

  Future<void> fetchPosts() async {
    try {
      isLoading.value = true;
      final fetchedFeed = await _feedService.getFeeds();
      feedModel.value = fetchedFeed;
    } catch (e) {
      Get.snackbar('Error', 'Failed to load feeds: $e');
      feedModel.value = null;
    } finally {
      isLoading.value = false;
    }
  }
}