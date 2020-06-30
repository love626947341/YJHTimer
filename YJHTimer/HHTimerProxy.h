//
//  HHTimerProxy.h
//  NSTimerDemo
//
//  Created by ios on 2020/2/25.
//  Copyright © 2020 ios. All rights reserved.
//  此类只做消息转发

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HHTimerProxy : NSProxy

@property (nonatomic, weak) id target;

@end

NS_ASSUME_NONNULL_END
