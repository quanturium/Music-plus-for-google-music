//
//  MyApplication.m
//  GMusicPlayer
//
//  Created by Arnaud Frugier on 7/29/12.
//  Copyright (c) 2012 Arnaud Frugier. All rights reserved.
//

#import "MyApplication.h"
#import "IOKit/hidsystem/ev_keymap.h"
#import "AppDelegate.h"

@implementation MyApplication

- (void)sendEvent: (NSEvent*)event
{
	if( [event type] == NSSystemDefined && [event subtype] == 8 )
	{
		int keyCode = (([event data1] & 0xFFFF0000) >> 16);
		int keyFlags = ([event data1] & 0x0000FFFF);
		int keyState = (((keyFlags & 0xFF00) >> 8)) == 0xA;
		int keyRepeat = (keyFlags & 0x1);
		
		[self mediaKeyEvent: keyCode state: keyState repeat: keyRepeat];
	}
    
	[super sendEvent: event];
}

- (void)mediaKeyEvent: (int)key state: (BOOL)state repeat: (BOOL)repeat
{
	switch( key )
	{
		case NX_KEYTYPE_PLAY:
			if( state == 0 )
            {
                [(AppDelegate *)[[MyApplication sharedApplication] delegate] playPause];
            }
            break;
            
		case NX_KEYTYPE_FAST:
			if( state == 0 )
            {
                [(AppDelegate *)[[MyApplication sharedApplication] delegate] nextSong];
            }
            break;
            
		case NX_KEYTYPE_REWIND:
			if( state == 0 )
            {
                [(AppDelegate *)[[MyApplication sharedApplication] delegate] prevSong];
            }
            break;
	}
}

@end
