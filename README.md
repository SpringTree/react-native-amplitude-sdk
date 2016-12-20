# react-native-amplitude-sdk

[![npm version](https://badge.fury.io/js/react-native-amplitude-sdk.svg)](https://badge.fury.io/js/react-native-amplitude-sdk)

Native Bindings for the [amplitude](https://amplitude.com/) Library for both IOS and Android.

## Installation

1. Install platform specific [SDK according to instructions](https://amplitude.zendesk.com/hc/en-us/articles/205406607-SDKs)
1. `npm install --save react-native-amplitude-sdk`
1. `react-native link react-native-amplitude-sdk`

### Android specific

This is probably fixable in the ```react-native link``` setup but:

In ```MainApplication.java``` of the react-native project change:

```
new AmplitudeSDKAndroidPackage(),
```

into:

```
new AmplitudeSDKAndroidPackage(getApplication()),
```


