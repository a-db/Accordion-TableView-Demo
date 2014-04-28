//
//  TheaterInfo.h
//  testApp
//
//  Created by Aaron Burke on 8/25/13.
//  Copyright (c) 2013 Aaron Burke. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TheaterInfo : NSObject

@property(nonatomic,strong) NSString *theaterName;
@property(nonatomic,strong) NSString *theaterImg;
@property(nonatomic,strong) NSString *theaterAddress;
@property(nonatomic,strong) NSMutableArray *theaterMovies;
//@property(nonatomic,strong) NSMutableArray *theaterTimes;

- (id)initWithInfo:(NSString*)name imgStr:(NSString*)imgStr address:(NSString*)address; //movieTimes:(NSMutableArray*)movieTimes;
- (void)createMovieList:(NSMutableArray*)movieList;

@end
