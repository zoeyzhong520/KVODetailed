//
//  ViewController.m
//  KVO详解
//
//  Created by zhifu360 on 2019/9/24.
//  Copyright © 2019 ZZJ. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import "NSObject+ZZJKVO.h"

@interface ViewController ()

@property (nonatomic, strong) Person *p;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    Person *p = [[Person alloc] init];
    _p = p;
//    [p addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew context:nil];
//    [p addObserver:self forKeyPath:@"dog.age" options:NSKeyValueObservingOptionNew context:nil];
//    [p addObserver:self forKeyPath:@"dog" options:NSKeyValueObservingOptionNew context:nil];
    
    [p ZZJ_addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew context:nil];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
//    if (context == <#context#>) {
//        <#code to be executed upon observing keypath#>
//    } else {
//        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
//    }
    NSLog(@"%@",change);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    static int a;
    //手动触发
    //即将改变
    [_p willChangeValueForKey:@"name"];
    _p.name = [NSString stringWithFormat:@"%d",a++];
    //改变完成
    [_p didChangeValueForKey:@"name"];
    
    _p.dog.age ++;
    _p.dog.level ++;
}

@end
