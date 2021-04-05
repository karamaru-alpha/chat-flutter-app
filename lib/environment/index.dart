class Environment {
  // singleton
  Environment._();

  static const PORT = int.fromEnvironment('PORT', defaultValue: 8080);
  static const HOST = String.fromEnvironment('HOST', defaultValue: 'localhost');
}
