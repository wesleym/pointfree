# openapi.model.ApiErrorUnauthorized

## Load the model package
```dart
import 'package:openapi/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**code** | **String** | The unique identifier for the type of error. | [default to 'global/invalid-api-key']
**message** | **String** | A description of the error. | [default to 'API key was invalid, expired, or deleted.']
**suggestion** | **String** | One or more suggestions of possible ways to fix the error. | [default to 'Check your API key or create a new one, then try again.']

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


