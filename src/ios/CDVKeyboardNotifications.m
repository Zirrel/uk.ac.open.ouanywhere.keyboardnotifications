//
//  CDVKeyboardNotifications.m
//  OUAnywhere
//

#import "CDVKeyboardNotifications.h"
#import "UIDevice-Hardware.h"

@implementation CDVKeyboardNotifications {
    CDVPluginResult *pluginResult;
    NSString *callbackID;
    BOOL shouldPostNotification;
}

-(void)test:(CDVInvokedUrlCommand *)command {
    callbackID = command.callbackId;
    
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"KeyboardNotifications"];
    
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

-(void)registerForKeyboardNotifications:(CDVInvokedUrlCommand *)command {
    callbackID = command.callbackId;
    
    shouldPostNotification = NO;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(UIKeyboardDidShowNotification:) name:UIKeyboardWillShowNotification object:nil];
	
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidHide:) name:UIKeyboardWillHideNotification object:nil];
    
    switch ([[UIDevice currentDevice] platformType]) {
		case UIDevice3GSiPhone:
		case UIDevice4iPhone:
		case UIDevice4SiPhone:
        case UIDevice4GiPod:
        case UIDevice5iPhone:
        case UIDeviceUnknowniPhone: {
            shouldPostNotification = YES;
        }
    }
}

-(void) UIKeyboardDidShowNotification:(NSNotification *)note {
    if (shouldPostNotification) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"YES"];
    
        // keep callback open
        [pluginResult setKeepCallback:[NSNumber numberWithBool:YES]];
    
        // fire...
        [self.commandDelegate sendPluginResult:pluginResult callbackId:callbackID];
    }
}

-(void) keyboardDidHide:(NSNotification *)note {
    if (shouldPostNotification) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"NO"];
    
        // keep callback open
        [pluginResult setKeepCallback:[NSNumber numberWithBool:YES]];
    
        // fire...
        [self.commandDelegate sendPluginResult:pluginResult callbackId:callbackID];
    }
}

@end
