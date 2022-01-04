#import "UserAgent.h"
#import <Cordova/CDVPluginResult.h>

@implementation UserAgent

- (void)get: (CDVInvokedUrlCommand*)command
{
    WKWebView* wkWebView = (WKWebView*)self.webViewEngine;
    [wkWebView evaluateJavaScript:@"navigator.userAgent" completionHandler:^(id result, NSError* error) {
        NSString* userAgent = result;
        CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:userAgent];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }];
}

- (void)set: (CDVInvokedUrlCommand*)command
{
    id newUserAgent = [command argumentAtIndex:0];
    
    WKWebView* wkWebView = (WKWebView*)self.webViewEngine;
    wkWebView.customUserAgent = newUserAgent;
    
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:newUserAgent];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)reset: (CDVInvokedUrlCommand*)command
{
    WKWebView* wkWebView = (WKWebView*)self.webViewEngine;
    wkWebView.customUserAgent = nil;
    [self get:command];
}

@end
