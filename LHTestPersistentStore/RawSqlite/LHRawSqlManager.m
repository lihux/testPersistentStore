//
//  LHRawSqlManager.m
//  LHTestPersistentStore
//
//  Created by 李辉 on 2018/4/13.
//  Copyright © 2018年 李辉. All rights reserved.
//

#import "LHRawSqlManager.h"

#import <sqlite3.h>

@interface LHRawSqlManager ()

@property (nonatomic, copy) NSString *dbPath;

@end

@implementation LHRawSqlManager

- (instancetype)initWithDBPath:(NSString *)path {
    if (self = [super init]) {
        self.dbPath = path;
    }
    return self;
}

@end
