# openapi.model.Filesystem

## Load the model package
```dart
import 'package:openapi/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **String** | The unique identifier (ID) of the filesystem. | 
**name** | **String** | The name of the filesystem. | 
**mountPoint** | **String** | The DEFAULT absolute path indicating where on instances the filesystem will be mounted. If `file_system_mounts` were used at launch time, the actual mount point is in the  instance response. | 
**created** | [**DateTime**](DateTime.md) | The date and time at which the filesystem was created. Formatted as an ISO 8601 timestamp. | 
**createdBy** | [**User**](User.md) | The user in your Team that created the filesystem. | 
**isInUse** | **bool** | Whether the filesystem is currently mounted to an instance. Filesystems that are mounted cannot be deleted. | 
**region** | [**Region**](Region.md) | The region in which the filesystem is deployed. | 
**bytesUsed** | **int** | The approximate amount of storage used by the filesystem in bytes. This estimate is updated every few hours. | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


