//
//  ZTTViewController.m
//  DataPilot
//
//  Created by Billy Gray on 3/24/14.
//  Copyright (c) 2014 Zetetic. All rights reserved.
//

#import "ZTTViewController.h"
#import "ZTTDataController.h"

@interface ZTTViewController ()

@end

@implementation ZTTViewController

@synthesize titleLabel;
@synthesize wordCountLabel;
@synthesize infoLabel;

//- (void)viewDidLoad {
//    [super viewDidLoad];
//	// Do any additional setup after loading the view, typically from a nib.
//}

//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    ZTTDataController *dataController = [ZTTDataController sharedController];
    NSDictionary *currentState = [dataController currentState];
    NSString *title = [currentState objectForKey:kZTTCurrentStateTitleKey];
    if (title != nil && [title length] > 0) {
        self.titleLabel.text = title;
    }
    NSNumber *wordCount = [currentState objectForKey:kZTTCurrentStateWordCountKey];
    self.wordCountLabel.text = [wordCount stringValue];
    NSString *info = [currentState objectForKey:kZTTCurrentStateInfoKey];
    if (info != nil && [info length] > 0) {
        self.infoLabel.text = info;
    }
}

@end
