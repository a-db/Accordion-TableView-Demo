//
//  CustomHeader.m
//  testApp
//
//  Created by Aaron Burke on 8/26/13.
//  Copyright (c) 2013 Aaron Burke. All rights reserved.
//

#import "CustomHeader.h"

@implementation CustomHeader

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

// Sets up the action for the header button
-(IBAction)buttonTapped:(id)sender {
    
    if(self.buttonTappedHandler)
        self.buttonTappedHandler();
}

// Creates the header data
- (void)createHeader:(TheaterInfo*)theater
{
    self.headerImg.image = [UIImage imageNamed:theater.theaterImg];
    self.nameLbl.text = theater.theaterName;
    self.addressLbl.text = theater.theaterAddress;
}

@end
