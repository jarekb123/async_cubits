import 'package:flutter/material.dart';
import 'package:sliver_tools/sliver_tools.dart';

class DSSliverPaginatedListView extends StatefulWidget {
  const DSSliverPaginatedListView({
    super.key,
    required this.itemsCount,
    required this.itemBuilder,
    required this.separatorBuilder,
    required this.isLoading,
    required this.hasMoreItems,
    required this.hasError,
    required this.onFetchNextPage,
  });

  final int itemsCount;
  final IndexedWidgetBuilder itemBuilder;
  final IndexedWidgetBuilder separatorBuilder;
  final bool isLoading;
  final bool hasMoreItems;
  final bool hasError;
  final VoidCallback onFetchNextPage;

  @override
  State<DSSliverPaginatedListView> createState() =>
      _DSSliverPaginatedListViewState();
}

class _DSSliverPaginatedListViewState extends State<DSSliverPaginatedListView> {
  bool _hasRequestedNextPage = false;

  /// Defines how many items need be left to render
  /// by sliver list before requesting the next page.
  ///
  /// Example: If the list has 10 items and the threshold is 3,
  /// the next page will be requested when the 7th item is rendered.
  static const _loadNextPageThreshold = 3;

  @override
  void didUpdateWidget(covariant DSSliverPaginatedListView oldWidget) {
    if (!widget.isLoading) {
      _hasRequestedNextPage = false;
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    final slivers = <Widget>[
      if (widget.isLoading && widget.itemsCount == 0)
        const _DefaultFirstPageLoadingBuilder()
      else if (widget.hasError && widget.itemsCount == 0)
        const _DefaultFirstPageErrorBuilder()
      else if (widget.itemsCount == 0)
        const _DefaultNoItemsBuilder()
      else ...[
        SliverList.separated(
          itemCount: widget.itemsCount,
          itemBuilder: (context, index) {
            _tryLoadNextPageOnNextFrame(index);
            return widget.itemBuilder(context, index);
          },
          separatorBuilder: widget.separatorBuilder,
        ),
        if (widget.isLoading)
          const SliverToBoxAdapter(
            child: _DefaultNextPageLoadingIndicatorBuilder(),
          )
        else if (widget.hasError)
          const SliverToBoxAdapter(
            child: _DefaultNextPageErrorBuilder(),
          )
      ]
    ];

    return MultiSliver(children: slivers);
  }

  void _tryLoadNextPageOnNextFrame(int itemIndex) {
    if (widget.hasMoreItems &&
        itemIndex == widget.itemsCount - _loadNextPageThreshold &&
        !_hasRequestedNextPage) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _hasRequestedNextPage = true;
        widget.onFetchNextPage();
      });
    }
  }
}

class _DefaultFirstPageLoadingBuilder extends StatelessWidget {
  const _DefaultFirstPageLoadingBuilder();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

class _DefaultFirstPageErrorBuilder extends StatelessWidget {
  const _DefaultFirstPageErrorBuilder();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Icon(Icons.error),
    );
  }
}

class _DefaultNoItemsBuilder extends StatelessWidget {
  const _DefaultNoItemsBuilder();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('No items'),
    );
  }
}

class _DefaultNextPageLoadingIndicatorBuilder extends StatelessWidget {
  const _DefaultNextPageLoadingIndicatorBuilder();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

class _DefaultNextPageErrorBuilder extends StatelessWidget {
  const _DefaultNextPageErrorBuilder();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Icon(Icons.error),
    );
  }
}
