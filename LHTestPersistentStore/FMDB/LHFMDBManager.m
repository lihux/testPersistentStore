//
//  LHFMDBManager.m
//  LHTestPersistentStore
//
//  Created by 李辉 on 2018/4/13.
//  Copyright © 2018年 李辉. All rights reserved.
//

#import "LHFMDBManager.h"

#import "LHAlbum.h"
#import <FMDB/FMDB.h>
#import <YYModel/YYModel.h>

@interface LHFMDBManager ()

@end

@implementation LHFMDBManager

- (NSArray *)getAllAlbums {
    FMDatabase *dbBase = [FMDatabase databaseWithPath:self.dbPath];
    if ([dbBase open]) {
        FMResultSet *resultSet = [dbBase executeQuery:@"select * from albums"];
        int columCount = [resultSet columnCount];
        NSMutableArray *albums = [NSMutableArray array];
        while ([resultSet next]) {
            NSString *temp = @"";
            for (int i = 0; i < columCount; i++) {
                NSString *albumString = [resultSet stringForColumnIndex:i];
                temp = [temp stringByAppendingString:[NSString stringWithFormat:@" %@", albumString]];
            }
            NSLog(@"%@", temp);
            temp = @"";
            LHAlbum *album = [LHAlbum yy_modelWithDictionary:[resultSet resultDictionary]];
            [albums addObject:album];
        }
        [dbBase close];
        return [NSArray arrayWithArray:albums];
    }
    return nil;
}

@end
