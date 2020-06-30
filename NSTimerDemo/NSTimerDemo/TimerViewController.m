//
//  TimerViewController.m
//  NSTimerDemo
//
//  Created by ios on 2020/2/25.
//  Copyright © 2020 ios. All rights reserved.
//

#import "HHTimerProxy.h"
#import "TimerViewController.h"

@interface TimerViewController ()
@property (nonatomic, strong) NSTimer *timer;
@end

@implementation TimerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //第一种防止循环引用的方法
//    __weak __typeof(self)weakSelf = self;
//    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 repeats:YES block:^(NSTimer * _Nonnull timer) {
//        __strong __typeof(weakSelf)strongSelf = weakSelf;
//        [strongSelf fire];
//    }];
    //第二种防止循环引用的方法: 消息转发机制
    HHTimerProxy *proxy = [HHTimerProxy alloc];
    proxy.target = self;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:proxy selector:@selector(fire) userInfo:nil repeats:YES];
   // 变量存储的指针不可变，变量存储的值可变 指针常量 指针自身是常量
//    NSString *const str1 = @"aaa";
//    str1 = @"22";
//    //变量存储的指针可变,变量存储的值不可变 常量指针 指向常量的指针
//    const NSString *str2 =@"bbb";
//    str2 = @"cccc";
//    static const NSUInteger gInteger = 100;
//    gInteger = 102;
//    static NSString * const str = @"iii";
//    str = @"bbb";
}

- (void)fire {
    NSLog(@"定时器调用");
}

- (void)dealloc {
    [self.timer invalidate];
    NSLog(@"TimerVC释放了");
}

@end
