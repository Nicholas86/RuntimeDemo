//
//  ViewController.m
//  Runtime
//
//  Created by lanouhn on 16/5/6.
//  Copyright © 2016年 李伟杰. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>
#import "Model.h"

@interface ViewController ()

@property (nonatomic, assign) NSInteger count;

@end


static char associatedObjecttKey;
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [Model addTagert:self selector:@selector(addObjects:)];
    self.navigationController.navigationBar.translucent = NO;
    
    
    [[[Model alloc] init] initProty];
    [self performSelector:@selector(relativePro)];
//    [self relativePro];
}

- (void)addObjects:(Model *)sender {
    NSLog(@"fs");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


// 关联属性
- (void)relativePro {
    
    // 设置关联对象
    objc_setAssociatedObject(self, &associatedObjecttKey, @"添加字符串属性", OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    NSString *string = objc_getAssociatedObject(self, &associatedObjecttKey);
    NSLog(@"AssociatedObject = %@", string);
    
}



- (void)initProty {
    
    unsigned int count;
    //获取属性列表
    objc_property_t *propertyList = class_copyPropertyList([Model class], &count);
    for (unsigned int i = 0; i < count; i++) {
        const char *propertyName = property_getName(propertyList[i]);
        NSLog(@"property---->%@", [NSString stringWithUTF8String:propertyName]);
    }
    
    // 获取方法列表
    Method *methodList = class_copyMethodList([Model class], &count);
    for (unsigned int i = 0; i < count; i++) {
        Method method = methodList[i];
        NSLog(@"method---->%@", NSStringFromSelector(method_getName(method)));
    }
    
    // 获取成员变量列表
    Ivar *ivarList = class_copyIvarList([Model class], &count);
    for (unsigned int i = 0; i < count; i++) {
        Ivar mayivar = ivarList[i];
        const char *ivarName = ivar_getName(mayivar);
        NSLog(@"Ivar---->%@", [NSString stringWithUTF8String:ivarName]);
    }
    
    // 获取协议列表
    __unsafe_unretained Protocol **protocolList = class_copyProtocolList([Model class], &count);
    for (unsigned int i = 0; i < count; i++) {
        Protocol *myProtocal = protocolList[i];
        const char *protocolName = protocol_getName(myProtocal);
        NSLog(@"protocol---->%@", [NSString stringWithUTF8String:protocolName]);
    }
    
    
}




@end





