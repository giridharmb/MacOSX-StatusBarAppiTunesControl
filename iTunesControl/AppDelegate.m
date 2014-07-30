//
//  AppDelegate.m
//  iTunesControl
//
//  Created by Giridhar Bhujanga on 7/26/14.
//  Copyright (c) 2014 Walmart. All rights reserved.
//

#import "AppDelegate.h"


@implementation AppDelegate

- (void) execAppleScript:(NSString *)scriptName {
    NSLog( @"Script >> %@", scriptName);
    NSURL *resourceURL = [[NSBundle mainBundle] resourceURL];
    NSLog( @"resourceURL >> %@", resourceURL);
    NSURL *urlOfScript = [resourceURL URLByAppendingPathComponent:scriptName];
    NSLog( @"urlOfScript >> %@", urlOfScript);
    NSDictionary *errors = [NSDictionary dictionary];
    NSLog( @"errors >> %@", errors);
    NSAppleScript *script = [[NSAppleScript alloc] initWithContentsOfURL: urlOfScript error:&errors];
    NSLog( @"script >> %@", script);
    [script executeAndReturnError:nil];
    if(script == NULL)
    {
        NSLog( @"could not instantiate script at %@", urlOfScript);
    }
}


- (void) awakeFromNib {
    statusItem = [[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength];
    
    [statusItem setMenu:menu];
    [statusItem setTitle:@""];
    [statusItem setHighlightMode:YES];
    [statusItem setImage:[NSImage imageNamed:@"s.png"]];


}

- (IBAction)play:(id)sender {
    [self execAppleScript:@"play.scptd"];
}

- (IBAction)pause:(id)sender {
    [self execAppleScript:@"pause.scptd"];
}

- (IBAction)next:(id)sender {
    [self execAppleScript:@"next.scptd"];

}

- (IBAction)previous:(id)sender {
    [self execAppleScript:@"previous.scptd"];
}

- (IBAction)stop:(id)sender {
    [self execAppleScript:@"stop.scptd"];
}

- (IBAction)quit:(id)sender {
    [NSApp terminate:nil];
}
- (IBAction)info:(id)sender {
    // [NSApp activateIgnoringOtherApps:YES];
    // [_window makeKeyAndOrderFront:nil];
    
    [self execAppleScript:@"notify.scptd"];
}


- (IBAction)showWindow:(id)sender {


}



- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
}

@end
