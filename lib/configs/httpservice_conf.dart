class HttpServiceConfig {
  static const apiBaseURL = "api.escuelajs.co";
  static const apiResource = "api";
  static const apiVersion = "v1";
  static Uri getApiUri(String endpoint, {Map<String, dynamic>? queryParams}) {
    return Uri.https(apiBaseURL, "$apiResource/$apiVersion/$endpoint", queryParams);
  }
}