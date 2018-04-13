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
    }
    return self;
}

- (NSArray *)getAllAlbums {
    //子类继承实现
    return nil;
}

@end
