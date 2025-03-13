import 'package:json_annotation/json_annotation.dart';
part 'spminduk.g.dart';

@JsonSerializable()
class SpmInduk {
  SpmInduk(
      {required this.thang,
      required this.kdsatker,
      required this.code_id,
      required this.nospp,
      required this.nosp2d,
      required this.tgsp2d,
      required this.nospm,
      required this.tgspp,
      required this.tgspm,
      required this.untuk,
      required this.kdjenspm,
      required this.nmjenspm,
      required this.kdsifspm,
      required this.nmsifspm,
      required this.kdmak2digit,
      required this.totnilmak,
      required this.totnilmap,
      required this.nilsp2d,
      required this.nipppk,
      required this.nmppk,
      required this.kdgiat,
      required this.kdoutput,
      required this.kdsoutput,
      required this.kdkmpnen,
      required this.kdakun_list,
      required this.spm_filedocument_id});

  String thang;
  String kdsatker;
  String code_id;
  String nospp;
  String? nosp2d;
  String? tgsp2d;
  String? nospm;
  String tgspp;
  String? tgspm;
  String untuk;
  String kdjenspm;
  String nmjenspm;
  String kdsifspm;
  String nmsifspm;
  String kdmak2digit;
  String totnilmak;
  String totnilmap;
  String? nilsp2d;
  String nipppk;
  String nmppk;
  String kdgiat;
  String kdoutput;
  String kdsoutput;
  String kdkmpnen;
  String kdakun_list;
  String spm_filedocument_id;

  factory SpmInduk.fromJson(Map<String, dynamic> json) =>
      _$SpmIndukFromJson(json);
  Map<String, dynamic> toJson() => _$SpmIndukToJson(this);
}
