//
//  Model.h
//  Runtime
//
//  Created by lanouhn on 16/5/6.
//  Copyright © 2016年 李伟杰. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ModelDelegate <NSObject>

@optional
- (void)getData;


@end



@interface Model : NSObject <ModelDelegate>


@property(nonatomic, copy) NSString*name;


- (void)initProty;

+ (void)addTagert:(id)object selector:(SEL)selector;


@end
