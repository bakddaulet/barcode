import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  @override
  List<Object?> get props => [];
}
class ServerFailure extends Failure {
  final int? statusCode;
  final String? message;
  ServerFailure({ this.message,this.statusCode});
}

String mapFailureToMessage(Failure failure) {
  if (failure is ServerFailure) {
    return failure.message!;
  }  else {
    return 'Unexpected Error';
  }
}