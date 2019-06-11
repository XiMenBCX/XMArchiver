//
//  NSObject+XMProperties.h
//  Rac_Temp
//
//  Created by 秦正华 on 2019/6/10.
//  Copyright © 2019 秦正华. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (XMProperties)

/** 获取类中所有属性名 return 数组容器 */
- (NSArray <NSString *> *)xm_allPropertyNames;

@end

NS_ASSUME_NONNULL_END
