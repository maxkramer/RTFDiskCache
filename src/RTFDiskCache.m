//
//  RTFDiskCache.m
//  School Form Generator
//
//  Created by Max Kramer on 10/12/2014.
//  Copyright (c) 2014 ReactiveFusion LTD. All rights reserved.
//

#import "RTFDiskCache.h"

@implementation RTFDiskCache

#pragma mark - Singleton

+ (RTFDiskCache *)sharedCache {
    static RTFDiskCache *cache;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        cache = [[RTFDiskCache alloc] init];
        [cache loadObjectsFromFileInDocumentsDirectory:RTFDiskCacheFileName];
    });
    return cache;
}

#pragma mark - Getter

- (NSMutableArray *)objects {
    if (_objects == nil) {
        _objects = [NSMutableArray array];
    }
    return _objects;
}

#pragma mark - File Path Generation

- (NSString *)filePathForFileInDocumentsDirectory:(NSString *)fileName {
    NSString *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    return [path stringByAppendingPathComponent:fileName];
}

#pragma mark - Object Reading / Writing

- (void)loadObjectsFromFileInDocumentsDirectory:(NSString *)fileName {
    NSData *encodedObjects = [NSData dataWithContentsOfFile:[self filePathForFileInDocumentsDirectory:fileName]];
    if (encodedObjects) {
        id objects = [NSKeyedUnarchiver unarchiveObjectWithData:encodedObjects];
        if (objects) {
            [self.objects addObjectsFromArray:objects];
        }
    }
    else {
        [self save];
    }
}

- (void)save {
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:self.objects];
    NSError *error;
    [data writeToFile:[self filePathForFileInDocumentsDirectory:RTFDiskCacheFileName] options:kNilOptions error:&error];
    if (error) {
        NSLog(@"RTFDiskCache: Issue writing to file\nError: %@", error);
    }
}

@end
