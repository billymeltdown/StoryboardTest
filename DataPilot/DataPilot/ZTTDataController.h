//
//  ZTTDataController.h
//  DataPilot
//
//  Created by Billy Gray on 3/24/14.
//  Copyright (c) 2014 Zetetic. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kZTTCurrentStateTitleKey @"Title"
#define kZTTCurrentStateWordCountKey @"WordCount"
#define kZTTCurrentStateInfoKey @"Info"

@interface ZTTDataController : NSObject

@property (nonatomic, readonly) NSDictionary *currentState;

+ (ZTTDataController *)sharedController;

@end
