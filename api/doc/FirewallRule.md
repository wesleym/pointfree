# openapi.model.FirewallRule

## Load the model package
```dart
import 'package:openapi/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**protocol** | [**SecurityGroupRuleProtocol**](SecurityGroupRuleProtocol.md) | The protocol to which the rule applies. | 
**portRange** | **List<int>** | An inclusive range of network ports specified as `[min, max]`. Not allowed for the `icmp` protocol but required for the others.  To specify a single port, list it twice (for example, `[22,22]`). | [optional] [default to const []]
**sourceNetwork** | **String** | The set of source IPv4 addresses from which you want to allow inbound traffic. These addresses must be specified in CIDR notation. You can specify individual public IPv4 CIDR blocks such as `1.2.3.4` or `1.2.3.4/32`, or you can specify `0.0.0.0/0` to allow access from any address.  This value is a string consisting of a public IPv4 address optionally followed by a slash (/) and an integer mask (the network prefix). If no mask is provided, the API assumes `/32` by default. | 
**description** | **String** | A human-readable description of the rule. | 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


