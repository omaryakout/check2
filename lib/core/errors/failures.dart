abstract class Failures {
  final String errMessage;

  Failures({required this.errMessage});
}

class ServerFailures extends Failures {
  ServerFailures({required super.errMessage});
}
