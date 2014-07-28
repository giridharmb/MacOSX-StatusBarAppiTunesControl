//
//  AppDelegate.h
//  iTunesControl
//
//  Created by Giridhar Bhujanga on 7/26/14.
//  Copyright (c) 2014 Walmart. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate> {
    NSStatusItem *statusItem;
    IBOutlet NSMenu *menu;
    
}

- (void) execAppleScript:(NSString *)scriptName;

@property (assign) IBOutlet NSWindow *window;

@end
