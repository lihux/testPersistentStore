//
//  LHFMDBManager.h
//  LHTestPersistentStore
//
//  Created by 李辉 on 2018/4/13.
//  Copyright © 2018年 李辉. All rights reserved.
//

#import "LHBaseDBManager.h"

@class LHAlbum;

@interface LHFMDBManager : LHBaseDBManager

- (instancetype)initWithDBPath:(NSString *)path;

- (NSArray *)getAllAlbums;

@end
