import 'package:favorite_books/features/home/view_model/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewModel extends Cubit<HomeState> {
  late final TextEditingController searchController;

  HomeViewModel() : super(const HomeState()) {
    searchController = TextEditingController();
  }
}
