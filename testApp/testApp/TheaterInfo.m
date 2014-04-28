//
//  TheaterInfo.m
//  testApp
//
//  Created by Aaron Burke on 8/25/13.
//  Copyright (c) 2013 Aaron Burke. All rights reserved.
//

#import "TheaterInfo.h"

@implementation TheaterInfo

- (id)initWithInfo:(NSString*)name imgStr:(NSString*)imgStr address:(NSString*)address //movieTimes:(NSMutableArray*)movieTimes
{
    //self = [self initWithInfo:name imgUrl:imgUrl address:address movieTimes:movieTimes];
    if (self) {
        // Custom initialization
        self.theaterName = name;
        self.theaterImg = imgStr;
        self.theaterAddress = address;
        self.theaterMovies = nil;
        //self.theaterTimes = movieTimes;
    }
    return self;
}

- (void)createMovieList:(NSMutableArray*)movieList
{
    self.theaterMovies = movieList.copy;
}

@end
