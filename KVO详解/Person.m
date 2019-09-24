//
//  Person.m
//  KVO详解
//
//  Created by zhifu360 on 2019/9/24.
//  Copyright © 2019 ZZJ. All rights reserved.
//

#import "Person.h"

@implementation Person

- (instancetype)init
{
    self = [super init];
    if (self) {
        _dog = [[Dog alloc] init];
    }
    return self;
}

+ (BOOL)automaticallyNotifiesObserversForKey:(NSString *)key {
    if ([key isEqualToString:@"name"]) {
        //手动触发
        return NO;
    }
    return YES;
}

+ (NSSet<NSString *> *)keyPathsForValuesAffectingValueForKey:(NSString *)key {
    NSLog(@"%@",key);
    
    NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
    if ([key isEqualToString:@"dog"]) {
        NSArray *aggetingsKeys = @[@"_dog.age",@"_dog.level"];
        keyPaths = [keyPaths setByAddingObjectsFromArray:aggetingsKeys];
    }
    return keyPaths;
}

@end
