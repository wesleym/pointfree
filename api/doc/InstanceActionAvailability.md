# openapi.model.InstanceActionAvailability

## Load the model package
```dart
import 'package:openapi/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**migrate** | [**InstanceActionAvailabilityDetails**](InstanceActionAvailabilityDetails.md) | Indicates whether the instance is currently able to be migrated. If not, describes why the operation is blocked. | 
**rebuild** | [**InstanceActionAvailabilityDetails**](InstanceActionAvailabilityDetails.md) | Indicates whether the instance is currently able to be rebuilt. If not, describes why the operation is blocked. | 
**restart** | [**InstanceActionAvailabilityDetails**](InstanceActionAvailabilityDetails.md) | Indicates whether the instance is currently able to be restarted. If not, describes why the operation is blocked. | 
**coldReboot** | [**InstanceActionAvailabilityDetails**](InstanceActionAvailabilityDetails.md) | Indicates whether the instance is currently eligible for a cold reboot. If not, describes why the operation is blocked. | 
**terminate** | [**InstanceActionAvailabilityDetails**](InstanceActionAvailabilityDetails.md) | Indicates whether the instance is currently able to be terminated. If not, describes why the operation is blocked. | 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


