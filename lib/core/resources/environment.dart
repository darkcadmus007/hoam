

late Config config;

///Const stuff, no need to put it on config
const String appUrl = "https://vmatch.live";
const String fcmKey = "AAAAvpm5BOc:APA91bGksKiCGm19qOHunDwGmHy-oT2Ib7hFMjJTatjQB-C5bGPSb2d5AXdPCmlIOU0zg2S1U3bW90dAPk9CRXfdTP416-9-hAYPwT4NC0TzUsETHl4C2bKCwbfgPoAhm1Z8ucKAWjQp";
const String banubaToken =
    'xEDksJIOHfauYeRnrhlMZDRKfl6KoEI4M7W1GH3HmBnIrkvZ5UFkfyXBArfdDPJ+ruILLhDjOrIbQji4RQLoFqZ6zIvTZOOVAcdrM/qGgzdNiv1jLHq12mexlUOOm7mxDBeuccYFsN5AggiYDzhEQAD42AxMTvFOvMP+3tmO8h9yOzUbFjK4AlOFL0jWE703NrxoOfEs59TeKI69hy7OYFF+e1D8Q+y8WUOCy3vS/R+zGKw9it2qPpNWtoxZp2Pp2Hs/r+Id2/7WwqUx4N3+g75l5B1UwBsQv73urcNXlx4AeW+3p5opSq9L4TGg0+ZrRBvzffK5uUkZyaDTNmyca7Bxn4Xq9RAcNUtdijPckDB9Z1kGxCTsnEtYif1xEk0tEfAfowi5yzbo7N2XajwXILQu8/PoWpjnRxZ4o59cfcl41AUaiUae07/ufUxnGtPJKF/co/pCG9DcOZkgyQ0119ywql5j9vOgxGIPd/M28Emn9wIsT2LVbRQzhrscv1MUR2lWWddq/F+8DPyR3i2dYbuCeB5RaxRBLpceTCY=';



double get preloadNumber {
  return 2;
  // return Platform.numberOfProcessors / 3;
}

int paginateLimit = 12;

Config production = Config(
  agoraAppId: "ec47133a46cb407ba2cf9d6886a08619",
  endpoint: "https://api.vmatch.live/api",
  socketEndpoint: "http://165.22.208.226:30001",
  youtubeKey: "AIzaSyB1u3TFx57JK8eSdSZq4bVDa00BT4_PbJA",
  assetEndpoint: "https://vmatchprod.s3.me-south-1.amazonaws.com",
);

Config development = Config(
  agoraAppId: "ec47133a46cb407ba2cf9d6886a08619",
  endpoint: "https://dev-api.vmatch.live/api",
  socketEndpoint: "https://dev-socket.vmatch.live",
  youtubeKey: "AIzaSyB1u3TFx57JK8eSdSZq4bVDa00BT4_PbJA",
  assetEndpoint: "https://vmatchdev1.s3.me-south-1.amazonaws.com",
);

Config local = Config(
  agoraAppId: "ec47133a46cb407ba2cf9d6886a08619",
  endpoint: "https://dev-api.vmatch.live/api",
  socketEndpoint: "http://192.168.100.96:30001",
  youtubeKey: "AIzaSyB1u3TFx57JK8eSdSZq4bVDa00BT4_PbJA",
  assetEndpoint: "https://vmatchdev1.s3.me-south-1.amazonaws.com",
);

class Config {
  final String endpoint;
  final String assetEndpoint;
  final String socketEndpoint;
  final String agoraAppId;
  final String youtubeKey;

  Config({
    required this.endpoint,
    required this.assetEndpoint,
    required this.socketEndpoint,
    required this.agoraAppId,
    required this.youtubeKey,
  });
}
