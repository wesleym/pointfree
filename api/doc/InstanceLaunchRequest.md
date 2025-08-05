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
**fileSystemNames** | **List<String>** | The names of the filesystems you want to mount to the instance. When specified alongside `file_system_mounts`, any filesystems referred to in both lists will use the mount path specified in `file_system_mounts`, rather than the default. | [optional] [default to const []]
**fileSystemMounts** | [**List<RequestedFilesystemMountEntry>**](RequestedFilesystemMountEntry.md) | The filesystem mounts to mount to the instance. When specified alongside  `file_system_names`, any filesystems referred to in both lists will use the mount path specified in `file_system_mounts`, rather than the default. | [optional] [default to const []]
**hostname** | **String** | The hostname to assign to the instance. If not specified, a default, IP-address-based hostname is assigned. This hostname is driven into /etc/hostname on the instance. | [optional] 
**name** | **String** | The name you want to assign to your instance. Must be 64 characters or fewer. | [optional] 
**image** | [**InstanceLaunchRequestImage**](InstanceLaunchRequestImage.md) |  | [optional] 
**userData** | **String** | An instance configuration string specified in a valid [cloud-init user-data](https://cloudinit.readthedocs.io/en/latest/explanation/format.html) format. You can use this field to configure your instance on launch. The user data string must be plain text and cannot exceed 1MB in size. | [optional] 
**tags** | [**List<RequestedTagEntry>**](RequestedTagEntry.md) | Key/value pairs representing the instance's tags. | [optional] [default to const []]
**firewallRulesets** | [**List<FirewallRulesetEntry>**](FirewallRulesetEntry.md) | The firewall rulesets to associate with the instance. The firewall rulesets must exist in the same region as the instance. | [optional] [default to const []]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


