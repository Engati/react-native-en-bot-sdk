#import <React/RCTBridgeModule.h>

@interface RCT_EXTERN_MODULE(EnBotSdk, NSObject)

RCT_EXTERN_METHOD(multiply:(float)a withB:(float)b
                 withResolver:(RCTPromiseResolveBlock)resolve
                 withRejecter:(RCTPromiseRejectBlock)reject)
                 
RCT_EXTERN_METHOD(launchBot:(NSString *)botKey
                  botName:(NSString *)botName
                  brandingKey:(NSString *)brandingKey
                  welcomeMsg:(BOOL)welcomeMsg
                  enableLog:(BOOL)enableLog
                  userId:(NSString *)userId
                  chatHistorySize:(int)chatHistorySize
                  showDone:(BOOL)showDone
                  closeButtonImage:(NSString *)closeButtonImage
                  language:(int)language
                  headerTitleFont:(NSString *)headerTitleFont
                  headerDescriptionFont:(NSString *)headerDescriptionFont
                  sendMessageButtonIcon:(NSString *)sendMessageButtonIcon
                  userAttributes:(id)userAttributes
                  withResolver:(RCTPromiseResolveBlock)resolve
                  withRejecter:(RCTPromiseRejectBlock)reject)

@end
