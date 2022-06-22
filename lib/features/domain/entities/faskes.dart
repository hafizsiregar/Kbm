import 'package:equatable/equatable.dart';

class Faskes extends Equatable {
  final int id;
  final String code;
  final String name;
  final String jenisFaskes;
  final String telp;
  final String? address;
  final String? photoFaskesUrl;
  final String logoFaskesUrl;

  const Faskes({
    required this.id,
    required this.code,
    required this.name,
    required this.jenisFaskes,
    required this.telp,
    required this.address,
    required this.photoFaskesUrl,
    required this.logoFaskesUrl,
  });

  @override
  List<Object> get props => [id, code, name, jenisFaskes, telp, address!, photoFaskesUrl!, logoFaskesUrl];
}