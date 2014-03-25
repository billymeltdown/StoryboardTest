//
//  ZTTDataController.m
//  DataPilot
//
//  Created by Billy Gray on 3/24/14.
//  Copyright (c) 2014 Zetetic. All rights reserved.
//

#import "ZTTDataController.h"

@implementation ZTTDataController

@dynamic currentState;

+ (ZTTDataController *)sharedController {
    static ZTTDataController *sharedController = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedController = [[ZTTDataController alloc] init];
    });
    return sharedController;
}

- (NSDictionary *)currentState {
    NSArray *keys = [[NSArray alloc] initWithObjects:kZTTCurrentStateTitleKey, kZTTCurrentStateWordCountKey, kZTTCurrentStateInfoKey, nil];
    NSNumber *number = [[NSNumber alloc] initWithInteger:1024];
    NSArray *vals = [[NSArray alloc] initWithObjects:@"Almost happy", number, @"Keep that chin up!", nil];
    NSDictionary *dict = [[NSDictionary alloc] initWithObjects:vals forKeys:keys];
    return dict;
}

@end
