//
//  LHAlbum.m
//  LHTestPersistentStore
//
//  Created by 李辉 on 2018/4/13.
//  Copyright © 2018年 李辉. All rights reserved.
//

#import "LHAlbum.h"

@implementation LHAlbum

- (NSString *)description {
    return [NSString stringWithFormat:@"albumId:%@ artistId:%@ title:%@", self.AlbumId, self.ArtistId, self.Title];
}
@end
