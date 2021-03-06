//
//  LXCacheObject.m
//  LXNetworkDemo
//
//  Created by sharejoy_lx on 16-09-04.
//  Copyright © 2016年 wlx. All rights reserved.
//

#import "LXCacheObject.h"
#import "LXNetworkConfiguration.h"

@interface LXCacheObject()

@property (nonatomic, copy, readwrite) NSData *content;
@property (nonatomic, copy, readwrite) NSDate *lastUpdateTime;

@end

@implementation LXCacheObject

- (instancetype)initWithContent:(NSData *)content{
    self = [super init];
    if (self) {
        self.content = content;
    }
    return self;
}

- (void)updateContent:(NSData *)content{
    self.content = content;
}


- (BOOL)isEmpty{
    return nil == self.content;
}

- (BOOL)isOverdue{
    NSTimeInterval timeInterval = [[NSDate date] timeIntervalSinceDate:self.lastUpdateTime];
    return timeInterval > kLXNCacheOverdueSeconds;
}

- (void)setContent:(NSData *)content{
    _content = [content copy];
    self.lastUpdateTime = [NSDate dateWithTimeIntervalSinceNow:0];
}



@end
