//
//  CDVKeyboardNotifications.h
//  OUAnywhere
//

#import <Cordova/CDV.h>

@interface CDVKeyboardNotifications : CDVPlugin

-(void)registerForKeyboardNotifications:(CDVInvokedUrlCommand *)command;
-(void)test:(CDVInvokedUrlCommand *)command;

@end
