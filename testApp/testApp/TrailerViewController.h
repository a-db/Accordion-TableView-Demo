//
//  TrailerViewController.h
//  testApp
//
//  Created by Aaron Burke on 8/29/13.
//  Copyright (c) 2013 Aaron Burke. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MovieInfo.h"

@interface TrailerViewController : UIViewController

@property (strong, nonatomic) MovieInfo *movie;
@property (strong, nonatomic) IBOutlet UILabel *nameLbl;
@property (strong, nonatomic) IBOutlet UIView *trailerView;

- (IBAction)onPlay:(id)sender;
- (IBAction)onStop:(id)sender;

@end
