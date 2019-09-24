//
//  NSObject+ZZJKVO.h
//  KVO详解
//
//  Created by zhifu360 on 2019/9/24.
//  Copyright © 2019 ZZJ. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (ZZJKVO)

- (void)ZZJ_addObserver:(NSObject *_Nullable)observer forKeyPath:(NSString *_Nullable)keyPath options:(NSKeyValueObservingOptions)options context:(nullable void *)context;

@end

NS_ASSUME_NONNULL_END
