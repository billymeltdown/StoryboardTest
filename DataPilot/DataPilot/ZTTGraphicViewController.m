//
//  ZTTGraphicViewController.m
//  DataPilot
//
//  Created by Billy Gray on 3/24/14.
//  Copyright (c) 2014 Zetetic. All rights reserved.
//

#import "ZTTGraphicViewController.h"
#import "ZTTDataController.h"

@interface ZTTGraphicViewController (Private)
- (void)_updateInterfaceWithDictionary:(NSDictionary *)dictionary;
- (void)_timerFired;
@end

@implementation ZTTGraphicViewController

@synthesize titleLabel;
@synthesize wordCountLabel;
@synthesize infoLabel;
@synthesize returnButton;

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    ZTTDataController *dataController = [ZTTDataController sharedController];
    // presumably currentState would have geometry information, or the necessary data to caclculate the glyph
    NSDictionary *currentState = [dataController currentState];
    // we update the interface in another method, passing in the state, so we can call again when the data changes...
    [self _updateInterfaceWithDictionary:currentState];
    // then maybe here you start an observer for NSNotifications on changes in dataController's state
    // and when you receive them, package them into a dictionary and pass it to _updateInterfaceYadaYada:
    // OR you could start an NSTimer here that polls for the currentState every few seconds. Either way
    // you can cause animation from one state to the next by updating properties
    // on this view controller's view, presumably your UIView subclass that implements drawRect:, and
    // you pass it the latest values in _updateInterfaceWithDictionary: instead of what's there now
    // e.g. the following fires every 2 seconds, though the dummy data displayed will the same:
    [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(_timerFired) userInfo:nil repeats:YES];
}

- (void)_updateInterfaceWithDictionary:(NSDictionary *)dictionary {
    NSString *title = [dictionary objectForKey:kZTTCurrentStateTitleKey];
    if (title != nil && [title length] > 0) {
        self.titleLabel.text = title;
    }
    NSNumber *wordCount = [dictionary objectForKey:kZTTCurrentStateWordCountKey];
    self.wordCountLabel.text = [wordCount stringValue];
    NSString *info = [dictionary objectForKey:kZTTCurrentStateInfoKey];
    if (info != nil && [info length] > 0) {
        self.infoLabel.text = info;
    }
}

- (void)_timerFired {
    ZTTDataController *dataController = [ZTTDataController sharedController];
    NSDictionary *currentState = [dataController currentState];
    [self _updateInterfaceWithDictionary:currentState];
    // so we can tell it's updating, let's play with the button's alpha channel
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1.0f];
    if (self.returnButton.alpha == 1.0f) {
        self.returnButton.alpha = 0.0f;
    } else {
        self.returnButton.alpha = 1.0f;
    }
    [UIView commitAnimations];
}

@end
