//
//  MovieDetailViewController.h
//  testApp
//
//  Created by Aaron Burke on 8/25/13.
//  Copyright (c) 2013 Aaron Burke. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MovieInfo.h"

@interface MovieDetailViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *nameLbl;
@property (strong, nonatomic) IBOutlet UIImageView *trailerImg;


@property (strong, nonatomic) IBOutlet UIImageView *movieImg;
@property (strong, nonatomic) IBOutlet UILabel *time1Lbl;
@property (strong, nonatomic) IBOutlet UILabel *time2Lbl;
@property (strong, nonatomic) IBOutlet UILabel *time3Lbl;
@property (strong, nonatomic) IBOutlet UILabel *time4Lbl;
@property (strong, nonatomic) IBOutlet UILabel *time5Lbl;
@property (strong, nonatomic) MovieInfo *movie;

- (void)createMovieDetail:(MovieInfo*)movieInfo;

@end
