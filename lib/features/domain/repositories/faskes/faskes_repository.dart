import 'package:dartz/dartz.dart';
import 'package:kbm/core/error/failure.dart';
import 'package:kbm/features/domain/entities/faskes.dart';

abstract class FaskesRepository {
  Future<Either<Failure, List<Faskes>>> getListFaskes();
  Future<Either<Failure, List<Faskes>>> getFaskesDetail(int id);
}