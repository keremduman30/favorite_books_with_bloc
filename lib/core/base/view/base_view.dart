import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../locator.dart';

class BaseView<T extends Cubit<M>, M> extends StatefulWidget {
  final Function(T viewModel)? onModelReady;
  final Function(T viewModel)? onDispose;
  final Widget Function(BuildContext context, T viewModel, M state)
      onPageBuilder;

  const BaseView(
      {Key? key,
      required this.onPageBuilder,
      this.onModelReady,
      this.onDispose})
      : super(key: key);

  @override
  _BaseViewState<T, M> createState() => _BaseViewState<T, M>();
}

class _BaseViewState<T extends Cubit<M>, M> extends State<BaseView<T, M>> {
  late T model;

  @override
  void initState() {
    model = locator<T>();
    if (widget.onModelReady != null) {
      widget.onModelReady!(model);
    }
    super.initState();
  }

  @override
  void dispose() {
    if (widget.onDispose != null) widget.onDispose!(model);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: model,
      child: BlocBuilder<T, M>(
        builder: (context, state) {
          return widget.onPageBuilder(context, model, state);
        },
      ),
    );
  }
}
