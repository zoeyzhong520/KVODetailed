//
//  NSObject+ZZJKVO.m
//  KVO详解
//
//  Created by zhifu360 on 2019/9/24.
//  Copyright © 2019 ZZJ. All rights reserved.
//

#import "NSObject+ZZJKVO.h"
#import <objc/message.h>

@implementation NSObject (ZZJKVO)

- (void)ZZJ_addObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(void *)context
{
    //动态创建一个类
    NSString *oldClassName = NSStringFromClass(self.class);
    NSString *newClassName = [@"ZZJKVO" stringByAppendingString:oldClassName];
    //创建类
    Class myClass = objc_allocateClassPair(self.class, newClassName.UTF8String, 0);
    //注册类
    objc_registerClassPair(myClass);
    //添加setName，目的为了重写
    class_addMethod(myClass, @selector(setName:), (IMP)zzj, "");
    //修改类型
    object_setClass(self, myClass);
}

void zzj(id self, SEL _cmd, NSString *newName)
{
    NSLog(@"%@\n%@\n%@",self,NSStringFromSelector(_cmd),newName);
}

@end
