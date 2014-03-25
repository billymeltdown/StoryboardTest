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
@end

@implementation ZTTGraphicViewController

@synthesize titleLabel;
@synthesize wordCountLabel;
@synthesize infoLabel;

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    ZTTDataController *dataController = [ZTTDataController sharedController];
    // presumably currentState would have geometry information, or the necessary data to caclculate
    NSDictionary *currentState = [dataController currentState];
    // we put this in another method so we can call again when the data changes...
    [self _updateInterfaceWithDictionary:currentState];
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

@end
