//
//  RTFDiskCache.h
//  School Form Generator
//
//  Created by Max Kramer on 10/12/2014.
//  Copyright (c) 2014 ReactiveFusion LTD. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString *const RTFDiskCacheFileName = @"Cache.dat";

@interface RTFDiskCache : NSObject

+ (RTFDiskCache *)sharedCache;

- (void)save;

@property (nonatomic, strong) NSMutableArray *objects;

@end
