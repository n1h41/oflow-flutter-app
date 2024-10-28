sealed class Failure {
  final String message;

  Failure({required this.message});

  @override
  String toString() => 'Unknown failure';
}

class ServerFailure extends Failure {
  ServerFailure({required super.message});

  @override
  String toString() => 'Type: ServerFailure, message: $message';
}

class RequestFailure extends Failure {
  RequestFailure({required super.message});

  @override
  String toString() => 'Type: RequestFailure, message: $message';
}

class NoNetworkFailure extends Failure {
  NoNetworkFailure()
      : super(
          message:
              'No network connection available please check your connection and try again',
        );

  @override
  String toString() =>
      'No network connection available please check your connection and try again';
}

class ConnectionTimeOutFailure extends Failure {
  ConnectionTimeOutFailure()
      : super(
            message:
                'Connection timed out please check your connection and try again');

  @override
  String toString() =>
      'Connection timed out please check your connection and try again';
}

class UnknownFailure extends Failure {
  final String? msg;
  UnknownFailure(this.msg)
      : super(message: msg ?? "Some thing went wrong please try again");

  @override
  String toString() => message;
}

class CacheFailure extends Failure {
  CacheFailure({required super.message});

  @override
  String toString() => 'CacheFailure(message: $message)';
}

class LocationFailure extends Failure {
  LocationFailure({required super.message});
}

class LocationServiceDisabledFailure extends Failure {
  LocationServiceDisabledFailure()
      : super(
            message:
                'Location Service Disabled please turn on the location service');

  @override
  String toString() =>
      'Location Service Disabled please turn on the location service';
}

class LocationPermissionDeniedFailure extends Failure {
  LocationPermissionDeniedFailure()
      : super(
            message:
                'Location Permission Denied please allow to access the location to continue');

  @override
  String toString() =>
      'Location Permission Denied please allow to access the location to continue';
}

class LocationPermissionDeniedForeverFailure extends Failure {
  LocationPermissionDeniedForeverFailure()
      : super(
            message:
                'Location Permission Denied forever please allow to access the location to continue');

  @override
  String toString() =>
      'Location Permission Denied forever please allow to access the location to continue';
}

class DataParsingFailure extends Failure {
  DataParsingFailure({
    required super.message,
    this.stacktrace,
  });

  final StackTrace? stacktrace;

  @override
  String toString() => 'DataParsingFailure: Contact admin';
}

class CameraPermissionDeniedFailure extends Failure {
  CameraPermissionDeniedFailure()
      : super(
            message:
                'Camera Permission Denied please allow to access the camera to continue');

  @override
  String toString() =>
      "Camera Permission Denied please allow to access the camera to continue";
}

class CameraFailure extends Failure {
  final String? msg;
  CameraFailure({this.msg})
      : super(message: 'Somthing went wrong on Camera try after some time');
  @override
  String toString() => msg ?? super.message;
}

class PinRequiredFailure extends Failure {
  PinRequiredFailure()
      : super(
            message:
                'Pin is required to continue please enter the pin to continue');
  @override
  String toString() =>
      'Pin is required to continue please enter the pin to continue';
}
