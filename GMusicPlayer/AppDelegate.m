//
//  AppDelegate.m
//  GMusicPlayer
//
//  Created by Arnaud Frugier on 7/29/12.
//  Copyright (c) 2012 Arnaud Frugier. All rights reserved.
//

#import "AppDelegate.h"
#import "MyApplication.h"

@implementation AppDelegate

@synthesize webview;

- (void)applicationDidFinishLaunching:(MyApplication *)aNotification
{
    [webview setFrameLoadDelegate:self];
    [webview setUIDelegate:self];
    
    NSString *url = @"http://music.google.com";
    [[webview mainFrame] loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:url]]];
}

- (void) playPause
{
    NSString *playPauseAction = @"SJBpost(\"playPause\")";
    [webview stringByEvaluatingJavaScriptFromString:playPauseAction];
}

- (void) prevSong
{
    NSString *playPauseAction = @"SJBpost(\"prevSong\")";
    [webview stringByEvaluatingJavaScriptFromString:playPauseAction];
}

- (void) nextSong
{
	NSString *playPauseAction = @"SJBpost(\"nextSong\")";
    [webview stringByEvaluatingJavaScriptFromString:playPauseAction];
}

- (void)webView:(WebView *)sender didFinishLoadForFrame:(WebFrame *)frame
{
    if(frame == [sender mainFrame])
    {
        NSBundle *bundle = [NSBundle mainBundle];
        NSString *path = [bundle pathForResource:@"script" ofType:@"js" inDirectory:@"Files"];
        NSString *jsCode = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
        NSString *title = [webview stringByEvaluatingJavaScriptFromString:@"javascript:alert(document.title)"];
    }
}

- (void)webView:(WebView *)sender runJavaScriptAlertPanelWithMessage:(NSString *)message initiatedByFrame:(WebFrame *)frame {
    NSAlert *alert = [[NSAlert alloc] init];
    [alert addButtonWithTitle:@"OK"];
    [alert setMessageText:message];
    [alert runModal];
}

@end
