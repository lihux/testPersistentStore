//
//  LHBaseDBManager.m
//  LHTestPersistentStore
//
//  Created by 李辉 on 2018/4/13.
//  Copyright © 2018年 李辉. All rights reserved.
//

#import "LHBaseDBManager.h"

@interface LHBaseDBManager ()

@end

@implementation LHBaseDBManager

- (instancetype)initWithDBPath:(NSString *)path {
    if (self = [super init]) {
        self.dbPath = path;
        NSString *toPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
        toPath = [toPath stringByAppendingString:@"fmdbText.db"];
        [self copyDBFileFromPath:path toPath:toPath];
        self.dbPath = toPath;
    }
    return self;
}

- (void)copyDBFileFromPath:(NSString *)fromPath toPath:(NSString *)toPath {
    NSAssert(fromPath && toPath, @"数据库拷贝缺少正确的路径");
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSAssert([fileManager fileExistsAtPath:fromPath], @"路径中没有数据库");
    [fileManager copyItemAtPath:fromPath toPath:toPath error:nil];
}

- (NSArray *)getAllAlbums {
    //子类继承实现
    return nil;
}

@end
