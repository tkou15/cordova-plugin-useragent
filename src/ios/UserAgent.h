#import <Cordova/CDVPlugin.h>
#import <WebKit/WebKit.h>

@interface UserAgent : CDVPlugin

- (void)get:(CDVInvokedUrlCommand*)command;
- (void)set:(CDVInvokedUrlCommand*)command;
- (void)reset:(CDVInvokedUrlCommand*)command;

@end
