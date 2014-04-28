//
//  TableCell.m
//  testApp
//
//  Created by Aaron Burke on 8/28/13.
//  Copyright (c) 2013 Aaron Burke. All rights reserved.
//

#import "TableCell.h"

@implementation TableCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code

    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

// Setup Cell data
- (void)createCell:(MovieInfo*)movieInfo
{
    self.cellImg.image = [UIImage imageNamed:movieInfo.movieImg];
    self.nameLbl.text = movieInfo.movieName;
    self.time1Lbl.text = movieInfo.movieTimes[0];
    self.time2Lbl.text = movieInfo.movieTimes[1];
    self.time3Lbl.text = movieInfo.movieTimes[2];
    self.time4Lbl.text = movieInfo.movieTimes[3];
    self.time5Lbl.text = movieInfo.movieTimes[4];
}

@end
