import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String? userName;
  final String? email;
  final String? id;

  UserModel({this.email, required this.id, this.userName});
  static var empty = UserModel(id: '');

  bool get isEmpty => this == UserModel.empty;
  bool get isNotEmpty => this != UserModel.empty;

  @override
  List<Object?> get props => [userName, id, email];
}
