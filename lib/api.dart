// Openapi Generator last run: : 2025-07-30T11:11:32.432650
import 'package:openapi_generator_annotations/openapi_generator_annotations.dart';

const specUrl = 'https://cloud.lambda.ai/api/v1/openapi.yaml';

@Openapi(
  inputSpec: RemoteSpec(path: specUrl),
  generatorName: Generator.dart,
  outputDirectory: 'api',
)
class Api {}
