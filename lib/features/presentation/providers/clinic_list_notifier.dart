import 'package:flutter/cupertino.dart';
import 'package:kbm/features/domain/entities/faskes.dart';
import 'package:kbm/features/domain/use_cases/faskes/get_list_cilinic.dart';
import '../../../core/utils/enums/type_load_more.dart';
import '../../domain/use_cases/faskes/get_list_hospitals.dart';

class ClinicListNotifier extends ChangeNotifier {

  final GetListClinic listClinic;
  ClinicListNotifier({required this.listClinic});

  var _listFaskes = <Faskes>[];
  List<Faskes> get listFaskes => _listFaskes;

  TypeLoadMore _listFaskesState = TypeLoadMore.EMPTY;
  TypeLoadMore get listFaskesState => _listFaskesState;

  String _message = '';
  String get message => _message;

  Future<void> fetchListClinic() async {
    _listFaskesState = TypeLoadMore.LOADING;
    notifyListeners();

    final result = await listClinic.call();
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
      }
    );
  }
}