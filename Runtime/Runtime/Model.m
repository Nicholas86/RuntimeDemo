//
//  Model.m
//  Runtime
//
//  Created by lanouhn on 16/5/6.
//  Copyright © 2016年 李伟杰. All rights reserved.
//

#import "Model.h"
#import <objc/runtime.h>

@implementation Model

- (void)initProty {
    
    unsigned int count;
    //获取属性列表
    objc_property_t *propertyList = class_copyPropertyList([self class], &count);
    for (unsigned int i = 0; i < count; i++) {
        const char *propertyName = property_getName(propertyList[i]);
        NSLog(@"property---->%@", [NSString stringWithUTF8String:propertyName]);
    }
    
    // 获取方法列表
    Method *methodList = class_copyMethodList([self class], &count);
    for (unsigned int i = 0; i < count; i++) {
        Method method = methodList[i];
        NSLog(@"method---->%@", NSStringFromSelector(method_getName(method)));
    }
    
    // 获取成员变量列表
    Ivar *ivarList = class_copyIvarList([self class], &count);
    for (unsigned int i = 0; i < count; i++) {
        Ivar mayivar = ivarList[i];
        const char *ivarName = ivar_getName(mayivar);
        NSLog(@"Ivar---->%@", [NSString stringWithUTF8String:ivarName]);
    }
    
    // 获取协议列表
    __unsafe_unretained Protocol **protocolList = class_copyProtocolList([self class], &count);
    for (unsigned int i = 0; i < count; i++) {
        Protocol *myProtocal = protocolList[i];
        const char *protocolName = protocol_getName(myProtocal);
        NSLog(@"protocol---->%@", [NSString stringWithUTF8String:protocolName]);
    }
    
    
}


+ (void)addTagert:(id)object selector:(SEL)aSelector {
    IMP imp = [object methodForSelector:aSelector];
    void(*func)(id, SEL, id) = (void *)imp;
    
    func(object, aSelector, object);
    
//    [object performSelector:aSelector withObject:object];
}



@end




