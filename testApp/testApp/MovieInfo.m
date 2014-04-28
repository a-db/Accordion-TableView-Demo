//
//  MovieInfo.m
//  testApp
//
//  Created by Aaron Burke on 8/25/13.
//  Copyright (c) 2013 Aaron Burke. All rights reserved.
//

#import "MovieInfo.h"

@implementation MovieInfo


- (id)initWithInfo:(NSString*)name imgStr:(NSString*)imgStr movTimes:(NSMutableArray*)movTimes
{
    //self = [self initWithInfo:name imgStr:imgStr movTimes:movTimes];
    if (self) {
        // Custom initialization
        self.movieName = name;
        self.movieImg = imgStr;
        self.movieTimes = movTimes;
    }
    return self;
}

@end
