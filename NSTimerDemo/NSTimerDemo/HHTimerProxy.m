//
//  HHTimerProxy.m
//  NSTimerDemo
//
//  Created by ios on 2020/2/25.
//  Copyright © 2020 ios. All rights reserved.
//

#import "HHTimerProxy.h"

@implementation HHTimerProxy

- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel {
    return [self.target methodSignatureForSelector:sel];
}

- (void)forwardInvocation:(NSInvocation *)invocation {
    [invocation invokeWithTarget:self.target];
}

//- (id)forwardingTargetForSelector:(SEL)selector {
//
//    return self.target;
//}

@end
