# openapi.model.FirewallRuleset

## Load the model package
```dart
import 'package:openapi/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **String** | The unique identifier of the firewall ruleset. | 
**name** | **String** | The name of the firewall ruleset. | 
**region** | [**Region**](Region.md) | The region in which the firewall ruleset is deployed. | 
**rules** | [**List<FirewallRule>**](FirewallRule.md) | The list of firewall rules in this ruleset. | [default to const []]
**created** | [**DateTime**](DateTime.md) | The date and time at which the firewall ruleset was created. Formatted as an ISO 8601 timestamp. | 
**instanceIds** | **List<String>** | The IDs of instances this firewall ruleset is associated with. | [default to const []]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


