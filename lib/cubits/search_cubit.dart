import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubits/sliding_panel_cubit.dart';

class YSearchCubit extends Cubit<YSearchState> {
  YSearchCubit() : super(YSearchLoading());

  final _destinations = [
    "Beshariq",
    "Furqat",
    "Dang'ara",
    "Uchko'prik",
    "O'zbekiston",
    "O'zbekiston",
    "O'zbekiston",
    "O'zbekiston",
    "O'zbekiston",
    "O'zbekiston",
  ];
  final _cities = [
    "Uchko'prik",
    "Dang'ara",
    "Furqat",
    "Beshariq",
    "O'zbekiston",
    "O'zbekiston",
    "O'zbekiston",
    "O'zbekiston",
    "O'zbekiston",
    "O'zbekiston",
  ];

  List<String> destinations() => _destinations;

  void initScreen(BuildContext context) {
    final panelCubit = context.read<YPanelCubit>();
    panelCubit.searchPanel(context);
    emit(YSearchInitial(_destinations));
  }

  Future<void> search(String query) async {
    if (query.isEmpty) {
      emit(YSearchInitial(_destinations));
      return;
    }

    emit(YSearchLoading());

    try {
      await Future.delayed(const Duration(seconds: 1));

      final results = _destinations.where((destination) => destination.toLowerCase().replaceAll("'", "").contains(query.toLowerCase().replaceAll("'", ""))).toList();

      emit(YSearchSuccess(results));
    } catch (e) {
      emit(const YSearchError("Shaharlarni yuklab bo'lmadi"));
    }
  }

  Future<void> getCities(String region) async {
    emit(YSearchInitial(_cities));
  }
}

abstract class YSearchState extends Equatable {
  const YSearchState();

  @override
  List<Object> get props => [];
}

class YSearchInitial extends YSearchState {
  final List<String> destinations;

  const YSearchInitial(this.destinations);

  @override
  List<Object> get props => [destinations];
}

class YSearchLoading extends YSearchState {}

class YSearchSuccess extends YSearchState {
  final List<String> searchResults;

  const YSearchSuccess(this.searchResults);

  @override
  List<Object> get props => [searchResults];
}

class YSearchError extends YSearchState {
  final String message;

  const YSearchError(this.message);

  @override
  List<Object> get props => [message];
}
