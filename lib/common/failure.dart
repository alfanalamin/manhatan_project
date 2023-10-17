abstract class Failure {
  final String message;
  final int code;

  const Failure(this.code, this.message);

  List<Object> get props => [code, message];
}

class RequestFailure extends Failure {
  const RequestFailure(int code, String message) : super(code, message);
}
