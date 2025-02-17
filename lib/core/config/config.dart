enum Flavour { dev, production }

class EnvConfig {
  static Flavour appEnv = switch (
      const String.fromEnvironment('FLAVOR', defaultValue: 'dev')) {
    'production' => Flavour.production,
    _ => Flavour.dev
  };

  // INFO: change this to switch between environments
  static ApiEnv apiEnv = switch (appEnv) {
    Flavour.dev => ApiEnv.localdev,
    Flavour.production => ApiEnv.production,
  };

  static String get baseUrl {
    switch (apiEnv) {
      case ApiEnv.localdev:
        return "http://192.168.1.77:3000";
      case ApiEnv.dev:
        // TODO:
        return "";
      case ApiEnv.production:
        // TODO:
        return "";
    }
  }

  static String get signIn => "$baseUrl/auth/sign-in";
  static String get signUp => "$baseUrl/auth/sign-up";
  static String get attachIotPolicy =>
      "https://ex6nd6w4qc6d36zs2zjvrlfo3a0dzzme.lambda-url.us-east-1.on.aws/";
}

enum ApiEnv {
  dev,
  localdev,
  production,
}
