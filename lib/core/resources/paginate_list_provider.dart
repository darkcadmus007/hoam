import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class PaginateListProvider<T> extends ChangeNotifier {
  final Future<List<T>> Function(int page) dataLoader;
  RefreshController refreshController = RefreshController();
  int _page = 0;
  int get page => _page;

  bool _loading = true;
  bool get loading => _loading;

  final List<T> data = [];

  PaginateListProvider(this.dataLoader) {
    loadData(true);
  }

  void loadData([bool refresh = false]) async {
    if (refresh) {
      data.clear();
      _page = 0;
      _loading = true;
      refreshController.resetNoData();
      notifyListeners();
    }

    _page++;
    var resp = await dataLoader(_page);
    _loading = false;
    refreshController.loadComplete();
    refreshController.refreshCompleted();

    if (resp.isNotEmpty) { 
      data.addAll(resp);
    } else {
      refreshController.loadNoData();
    }
    try {
      notifyListeners();
    } catch (_) {}
  }

  void notify() => notifyListeners();

  @override
  void dispose() {
    refreshController.dispose();
    super.dispose();
  }

  static PaginateListProvider<T> read<T>(BuildContext context) => context.read();
  static PaginateListProvider<T> watch<T>(BuildContext context) => context.watch();
}

//Attention: Example :
//  return ChangeNotifierProvider(
//       create: (context) => PaginateListProvider<Video>((page) => VideoHttp(context).getProfileLikeVideo(page)),
//       builder: (context, child) {
//         var provider = PaginateListProvider.watch<Video>(context);
//         return SmartRefresher(
//           controller: provider.refreshController,
//           onRefresh: () => provider.loadData(true),
//           onLoading: () => provider.loadData(),
//           enablePullUp: true,
//           child: GridView.builder(
//             padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
//             gridDelegate: primarySliverGrid(context),
//             itemCount: provider.loading ? null : provider.data.length,
//             itemBuilder: (context, index) {
//               if (provider.loading) return ShimmeringObject(radius: BorderRadius.circular(15));
//               return _videoItem(context, index, provider.data[index]);
//             },
//           ),
//         );
//       },
//     );