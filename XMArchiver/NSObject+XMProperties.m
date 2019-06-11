//
//  NSObject+XMProperties.m
//  Rac_Temp
//
//  Created by 秦正华 on 2019/6/10.
//  Copyright © 2019 秦正华. All rights reserved.
//

#import "NSObject+XMProperties.h"
#import <objc/runtime.h>


@implementation NSObject (XMProperties)

-(NSArray<NSString *> *)xm_allPropertyNames
{
    NSMutableArray *propertyNames = @[].mutableCopy;
    
    unsigned int outCount;
    
    objc_property_t *properties = class_copyPropertyList([self class], &outCount);
    
    for (int i = 0; i < outCount; i++) {
        
        objc_property_t property = properties[i];
        
        NSString *propertyName = [NSString stringWithCString:property_getName(property) encoding:NSUTF8StringEncoding];
        
        [propertyNames addObject:propertyName];
    }
    
    free(properties);
    
    return propertyNames;
}

@end
