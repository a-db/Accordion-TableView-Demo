//
//  MovieInfo.h
//  testApp
//
//  Created by Aaron Burke on 8/25/13.
//  Copyright (c) 2013 Aaron Burke. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MovieInfo : NSObject

@property(nonatomic,strong) NSString *movieName;
@property(nonatomic,strong) NSString *movieImg;
@property(nonatomic,strong) NSMutableArray *movieTimes;

- (id)initWithInfo:(NSString*)name imgStr:(NSString*)imgStr movTimes:(NSMutableArray*)movTimes;

@end
