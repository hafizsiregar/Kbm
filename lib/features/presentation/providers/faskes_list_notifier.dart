import 'package:flutter/material.dart';
import 'package:kbm/core/utils/enums/type_load_more.dart';
import '../../domain/entities/faskes.dart';
import '../../domain/use_cases/faskes/get_list_faskes.dart';

class FaskesListNotifier extends ChangeNotifier {
  var _listFaskes = <Faskes>[];
  List<Faskes> get listFaskes => _listFaskes;

  TypeLoadMore _listFaskesState = TypeLoadMore.EMPTY;
  TypeLoadMore get listFaskesState => _listFaskesState;

  String _message = '';
  String get message => _message;

  FaskesListNotifier({
    required this.getList
  });

  final GetListFaskes getList;

  Future<void> fetchListFaskes() async {
    _listFaskesState = TypeLoadMore.LOADING;
    notifyListeners();

    final result = await getList.call();
    result.fold(
      (failure) {
        _listFaskesState = TypeLoadMore.FAILURE;
        _message = failure.message;
        notifyListeners();
      },
      (faskesData) {
        _listFaskesState = TypeLoadMore.LOADED;
        _listFaskes = faskesData;
        notifyListeners();
      },
    );
  }
}