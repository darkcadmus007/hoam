import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

import '../../core/resources/environment.dart';
import '../../core/resources/paginate_list_provider.dart';
import 'default_smart_refresh.dart';
import 'quick_announcment.dart';





class ListViewPagination<T> extends StatelessWidget {
  final Future<List<T>> Function(int page) loader;
  final Widget Function(BuildContext context, int index, T item) builder;
  final Widget Function(BuildContext context, int index)? preloadBuilder;
  final Function(PaginateListProvider<T> provider)? initialize;
  final EdgeInsets? listPadding;
  final bool enabledPagination;

  const ListViewPagination({
    super.key,
    required this.loader,
    required this.builder,
    this.preloadBuilder,
    this.listPadding,
    this.initialize,
    this.enabledPagination = true,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PaginateListProvider<T>((page) => loader(page)),
      builder: (context, child) {
        initialize?.call(PaginateListProvider.read<T>(context));
        var provider = PaginateListProvider.watch<T>(context);
        Widget body = Container();

        if (provider.data.isNotEmpty || provider.loading) {
          body = ListView.builder(
            padding: listPadding,
            itemCount: provider.loading ? paginateLimit : provider.data.length,
            itemBuilder: (context, index) {
              if (provider.loading) return preloadBuilder?.call(context, index) ?? const SizedBox();
              return builder.call(context, index, provider.data[index]);
            },
          );
        } else {
          body = const QuickAnnouncment(
            assets: "assets/images/icons/emptydata.png",
            title: "no_data_title",
            subtitle: "no_data_description",
          );
        }
        return SmartRefresher(
          controller: provider.refreshController,
          onRefresh: () => provider.loadData(true),
          onLoading: () => provider.loadData(),
          enablePullUp: enabledPagination,
          footer: defaultCustomFooter(
            loadingWidget: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: listPadding,
              itemCount: 15,
              itemBuilder: (context, index) {
                return preloadBuilder?.call(context, index) ?? const SizedBox();
              },
            ),
          ),
          child: body,
        );
      },
    );
  }
}
