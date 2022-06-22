import 'package:equatable/equatable.dart';
import 'faskes_model.dart';

class FaskesResponse extends Equatable {
  final List<FaskesModel> faskesList;

  const FaskesResponse({
    required this.faskesList,
  });

  factory FaskesResponse.fromJson(Map<String, dynamic> json) => FaskesResponse(
    faskesList: List<FaskesModel>.from((json["data"]["data"] as List)
    .map((e) => FaskesModel.fromJson(e))),
    );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(faskesList.map((e) => e.toJson())),
  };

  @override
  List<Object> get props => [faskesList];
}