import 'package:flutter/material.dart';
import 'package:kbm/core/utils/enums/type_load_more.dart';
import 'package:kbm/features/domain/use_cases/faskes/get_faskes_detail.dart';

import '../../domain/entities/faskes.dart';

class FaskesDetailNotifier extends ChangeNotifier {

  final GetFaskesDetail getFaskesDetail;
  FaskesDetailNotifier({required this.getFaskesDetail});

  var _listFaskes = <Faskes>[];
  List<Faskes> get listFaskes => _listFaskes;

  TypeLoadMore _faskesState = TypeLoadMore.EMPTY;
  TypeLoadMore get faskesState => _faskesState;

  String _message = '';
  String get message => _message;

  Future<void> fetchFaskesDetail(int id) async {
    _faskesState = TypeLoadMore.LOADING;
    notifyListeners();

    final detailResult = await getFaskesDetail.call(id);
    detailResult.fold(
      (failure) {
        _faskesState = TypeLoadMore.FAILURE;
        _message = failure.message;
        notifyListeners();
      },
      (faskesData) {
        _faskesState = TypeLoadMore.LOADING;
        _listFaskes = faskesData;
        notifyListeners();
        detailResult.fold(
          (failure) {
          _message = failure.message;
          },
          (faskes) {
            _faskesState = TypeLoadMore.LOADED;
            _listFaskes = faskesData;
          }
        );
        _faskesState = TypeLoadMore.LOADED;
        notifyListeners();
      },
    );
  }
}