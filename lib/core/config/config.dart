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

  static String get domain {
    switch (apiEnv) {
      case ApiEnv.localdev:
        return "http://192.168.29.145:5000";
      case ApiEnv.dev:
        return "http://purplerewards.dyndns.org:8083";
      case ApiEnv.production:
        return "http://purplerewards.dyndns.org:8070";
    }
  }

  static String get signIn => "$domain/auth/sign-in";
  static String get signUp => "$domain/auth/sign-up";
}

enum ApiEnv {
  dev,
  localdev,
  production,
}
