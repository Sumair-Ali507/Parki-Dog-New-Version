// Breed model
import 'package:equatable/equatable.dart';

class Breed extends Equatable{
  final String id;
  final String name;

  const Breed({required this.id, required this.name});

  @override
  List<Object?> get props => [name];
}
