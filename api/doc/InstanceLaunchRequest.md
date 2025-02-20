# openapi.model.InstanceLaunchRequest

## Load the model package
```dart
import 'package:openapi/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**regionName** | [**PublicRegionCode**](PublicRegionCode.md) | The region into which you want to launch the instance. | 
**instanceTypeName** | **String** | The type of instance you want to launch. To retrieve a list of available instance types, see [List available instance types](#get-/api/v1/instance-types). | 
**sshKeyNames** | **List<String>** | The names of the SSH keys you want to use to provide access to the instance. Currently, exactly one SSH key must be specified. | [default to const []]
**fileSystemNames** | **List<String>** | The names of the filesystems you want to attach to the instance. Currently, you can attach only one filesystem during instance creation. By default, no filesystems are attached. | [optional] [default to const []]
**name** | **String** | The name you want to assign to your instance. Must be 64 characters or fewer. | [optional] 
**image** | [**Image**](Image.md) |  | [optional] 
**userData** | **String** | An instance configuration string specified in a valid [cloud-init user-data](https://cloudinit.readthedocs.io/en/latest/explanation/format.html) format. You can use this field to configure your instance on launch. The user data string must be plain text and cannot exceed 1MB in size. | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


