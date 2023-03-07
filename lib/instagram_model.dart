import 'package:freezed_annotation/freezed_annotation.dart';

part 'instagram_model.freezed.dart';
part 'instagram_model.g.dart';

@freezed
class InstagramModel with _$InstagramModel {
  factory InstagramModel({List<Map<String, dynamic>>? data}) = _InstagramModel;

  factory InstagramModel.fromJson(Map<String, dynamic> json) =>
      _$InstagramModelFromJson(json);
}