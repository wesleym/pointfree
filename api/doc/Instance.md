# openapi.model.Instance

## Load the model package
```dart
import 'package:openapi/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **String** | The unique identifier of the instance. | 
**name** | **String** | If set, the user-provided name of the instance. | [optional] 
**ip** | **String** | The public IPv4 address of the instance. | [optional] 
**privateIp** | **String** | The private IPv4 address of the instance. | [optional] 
**status** | [**InstanceStatus**](InstanceStatus.md) |  | 
**sshKeyNames** | **List<String>** | The names of the SSH keys that are allowed to access the instance. | [default to const []]
**fileSystemNames** | **List<String>** | The names of the filesystems attached to the instance. If no filesystems are attached, this array is empty. | [default to const []]
**region** | [**Region**](Region.md) | The region in which the instance is deployed. | 
**instanceType** | [**InstanceType**](InstanceType.md) | Detailed information about the instance's instance type. | 
**hostname** | **String** | The hostname assigned to this instance, which resolves to the instance's IP. | [optional] 
**jupyterToken** | **String** | The secret token used to log into the JupyterLab server hosted on the instance. | [optional] 
**jupyterUrl** | **String** | The URL that opens the JupyterLab environment on the instance. | [optional] 
**actions** | [**InstanceActionAvailability**](InstanceActionAvailability.md) | A set of status objects representing the current availability of common instance operations. | 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


