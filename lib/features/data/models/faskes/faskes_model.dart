import 'package:equatable/equatable.dart';
import '../../../domain/entities/faskes.dart';

class FaskesModel extends Equatable {
  final int id;
  final String code;
  final String name;
  final String jenisFaskes;
  final String telp;
  final String address;
  final String photoFaskesUrl;
  final String logoFaskesUrl;

  FaskesModel({
    required this.id,
    required this.code,
    required this.name,
    required this.jenisFaskes,
    required this.telp,
    required this.address,
    required this.photoFaskesUrl,
    required this.logoFaskesUrl,
  });

  factory FaskesModel.fromJson(Map<String, dynamic> json) {
    return FaskesModel(
      id: json['id'],
      code: json['code'],
      name: json['name'],
      jenisFaskes: json['jenis_faskes'],
      telp: json['telp'],
      address: json['address'],
      photoFaskesUrl: json['photo_faskes_url'],
      logoFaskesUrl: json['logo_faskes_url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'code': code,
      'name': name,
      'jenis_faskes': jenisFaskes,
      'telp': telp,
      'address': address,
      'photo_faskes_url': photoFaskesUrl,
      'logo_faskes_url': logoFaskesUrl,
    };
  }

  Faskes toEntity() {
    return Faskes(
      id: id, 
      code: code, 
      name: name, 
      jenisFaskes: jenisFaskes, 
      telp: telp, 
      address: address, 
      photoFaskesUrl: photoFaskesUrl, 
      logoFaskesUrl: logoFaskesUrl
    );
  }

  @override
  List<Object> get props => [id, code, name, jenisFaskes, telp, address, photoFaskesUrl, logoFaskesUrl];
}