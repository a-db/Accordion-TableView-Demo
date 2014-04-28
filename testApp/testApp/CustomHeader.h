//
//  CustomHeader.h
//  testApp
//
//  Created by Aaron Burke on 8/26/13.
//  Copyright (c) 2013 Aaron Burke. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TheaterInfo.h"

@interface CustomHeader : UIView

@property (strong, nonatomic) IBOutlet UIImageView *headerImg;
@property (strong, nonatomic) IBOutlet UILabel *nameLbl;
@property (strong, nonatomic) IBOutlet UILabel *addressLbl;
@property (nonatomic, weak) IBOutlet UIButton *mainButton;

// Block click handler for the invisible button on the header
@property (nonatomic, copy) void (^buttonTappedHandler)();

- (void)createHeader:(TheaterInfo*)theaterInfo;

@end
