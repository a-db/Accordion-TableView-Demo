//
//  TableCell.h
//  testApp
//
//  Created by Aaron Burke on 8/28/13.
//  Copyright (c) 2013 Aaron Burke. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MovieInfo.h"

@interface TableCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIImageView *cellImg;
@property (strong, nonatomic) IBOutlet UILabel *time1Lbl;
@property (strong, nonatomic) IBOutlet UILabel *time2Lbl;
@property (strong, nonatomic) IBOutlet UILabel *time3Lbl;
@property (strong, nonatomic) IBOutlet UILabel *time4Lbl;
@property (strong, nonatomic) IBOutlet UILabel *time5Lbl;
@property (strong, nonatomic) IBOutlet UILabel *nameLbl;

- (void)createCell:(MovieInfo*)movieInfo;


@end
