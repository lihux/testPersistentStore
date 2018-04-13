//
//  LHBaseDBManager.h
//  LHTestPersistentStore
//
//  Created by 李辉 on 2018/4/13.
//  Copyright © 2018年 李辉. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LHBaseDBManager : NSObject

@property (nonatomic, copy) NSString *dbPath;

- (instancetype)initWithDBPath:(NSString *)path;
- (NSArray *)getAllAlbums;

@end
