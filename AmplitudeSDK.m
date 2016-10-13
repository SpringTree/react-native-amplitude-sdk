#import "AmplitudeSDK.h"
#import "Amplitude.h"
#import "AMPRevenue.h"

@implementation AmplitudeSDKiOS

RCT_EXPORT_MODULE()

RCT_EXPORT_METHOD(setup:(NSString* )writeKey)
{
  [Amplitude instance].trackingSessionEvents = YES;
  [[Amplitude instance] initializeApiKey: writeKey];
}

RCT_EXPORT_METHOD(identifyWithTraits:(NSString *)userId traits:(NSDictionary *)traits)
{
  [[Amplitude instance] setUserId:userId];
  [[Amplitude instance] setUserProperties:traits];
}

RCT_EXPORT_METHOD(identify:(NSString *)userId)
{
  [[Amplitude instance] setUserId:userId];
}

RCT_EXPORT_METHOD(setUserTraits:(NSDictionary *)traits)
{
  [[Amplitude instance] setUserProperties:traits];
}

RCT_EXPORT_METHOD(screenWithProps:(NSString *)name properties:(NSDictionary *)properties)
{
  NSString* screenName = [NSString stringWithFormat:@"Viewed %@ Screen", name];
  [[Amplitude instance] logEvent: screenName withEventProperties: properties];
}

RCT_EXPORT_METHOD(screen:(NSString *)name)
{
  NSString* screenName = [NSString stringWithFormat:@"Viewed %@ Screen", name];
  [[Amplitude instance] logEvent: screenName];
}

RCT_EXPORT_METHOD(trackWithProps:(NSString *)eventKey properties:(NSDictionary *)properties)
{
  [[Amplitude instance] logEvent: eventKey withEventProperties: properties];
}

RCT_EXPORT_METHOD(track:(NSString *)event)
{
  [[Amplitude instance] logEvent: event];
}

RCT_EXPORT_METHOD(trackPurchase:(NSString *)productIdentifier price:(double)price quantity:(int)quantity receipt:(NSString*)receipt)
{
  AMPRevenue *revenue = [[[AMPRevenue revenue] setProductIdentifier:productIdentifier] setQuantity: quantity];
  [revenue setPrice:[NSNumber numberWithDouble:price]];
  [revenue setReceipt:[receipt dataUsingEncoding:NSUTF8StringEncoding]];
  [[Amplitude instance] logRevenueV2:revenue];
}

@end
