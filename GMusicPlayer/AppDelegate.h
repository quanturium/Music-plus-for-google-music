//
//  AppDelegate.h
//  GMusicPlayer
//
//  Created by Arnaud Frugier on 7/29/12.
//  Copyright (c) 2012 Arnaud Frugier. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <Webkit/Webkit.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;
@property (weak) IBOutlet WebView *webview;

-(void)playPause;
-(void)prevSong;
-(void)nextSong;

@end
