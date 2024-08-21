import 'package:flutter/material.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'adaptive_progress_indicator.dart';

CustomFooter defaultCustomFooter({Widget? loadingWidget, double? height}) => CustomFooter(
      height: height ?? 60,
      builder: (BuildContext context, LoadStatus? mode) {
        Widget body;
        if (mode == LoadStatus.idle) {
          body = const SizedBox();
        } else if (mode == LoadStatus.loading) {
          body = loadingWidget ?? const AdaptiveProgressIndicator();
        } else if (mode == LoadStatus.failed) {
          body = const SizedBox();
        } else if (mode == LoadStatus.canLoading) {
          body = const SizedBox();
        } else {
          body = const SizedBox();
        }
        return SizedBox(
          height: loadingWidget == null ? 55.0 : null,
          child: Center(child: body),
        );
      },
    );

CustomHeader defaultCustomHeader() {
  return CustomHeader(
    builder: (BuildContext context, RefreshStatus? mode) {
      Widget body;
      if (mode == RefreshStatus.idle) {
        body = const SizedBox();
      } else if (mode == RefreshStatus.refreshing) {
        body = const AdaptiveProgressIndicator();
      } else if (mode == RefreshStatus.failed) {
        body = const SizedBox();
      } else if (mode == RefreshStatus.canRefresh) {
        body = const SizedBox();
      } else {
        body = const SizedBox();
      }
      return Center(child: body);
    },
  );
}
