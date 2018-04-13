//
//  LHFMDBManager.m
//  LHTestPersistentStore
//
//  Created by 李辉 on 2018/4/13.
//  Copyright © 2018年 李辉. All rights reserved.
//

#import "LHFMDBManager.h"

#import <FMDB/FMDB.h>

@interface LHFMDBManager ()

@end

@implementation LHFMDBManager

- (NSArray *)getAllAlbums {
    FMDatabase *dbBase = [FMDatabase databaseWithPath:self.dbPath];
    if ([dbBase open]) {
        [dbBase close];
    }
    return nil;
}

@end
