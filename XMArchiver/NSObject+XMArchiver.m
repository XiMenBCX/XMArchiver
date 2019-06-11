//
//  NSObject+XMArchiver.m
//  Rac_Temp
//
//  Created by 秦正华 on 2019/6/10.
//  Copyright © 2019 秦正华. All rights reserved.
//

#import "NSObject+XMArchiver.h"
#import "NSObject+XMProperties.h"

#define XMArchiverDir @"XMArchiverDir"

@implementation NSObject (XMArchiver)


-(BOOL)xm_archiveToFileName:(NSString *)fileName
{
    
    [NSKeyedArchiver archiveRootObject:self toFile:[self createFilePath:fileName]];

    return YES;
}

+(id)xm_unarchiveToFileName:(NSString *)fileName
{
    return [NSKeyedUnarchiver unarchiveObjectWithFile:[self createFilePath:fileName]];
}

/** 获取文件指定保存路径 */
- (NSString *)createFilePath:(NSString *)fileName
{
    NSString *docPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject;
    
    NSString *dirPath = [docPath stringByAppendingPathComponent:XMArchiverDir];
    
    if (![[NSFileManager defaultManager] fileExistsAtPath:dirPath]) {

       BOOL isCreate = [[NSFileManager defaultManager] createDirectoryAtPath:dirPath withIntermediateDirectories:YES attributes:nil error:nil];
        
        NSAssert(isCreate == YES, @"文件夹创建失败");
    }
    
    NSString *filePath = [dirPath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@_%@.data",[self class],fileName]];
    return filePath;
}

#pragma mark - NSCoding
- (void)encodeWithCoder:(nonnull NSCoder *)aCoder {
    
    NSArray *propertyNames = [self xm_allPropertyNames];
    
    for (NSString *propertyName in propertyNames) {
        [aCoder encodeObject:[self valueForKey:propertyName] forKey:propertyName];
    }
}

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-designated-initializers"
- (nullable instancetype)initWithCoder:(nonnull NSCoder *)aDecoder {
    
    NSArray *propertyNames = [self xm_allPropertyNames];
    
    for (NSString *propertyName in propertyNames) {
        
        [self setValue:[aDecoder decodeObjectForKey:propertyName] forKey:propertyName];
    }
    
    return self;
}
#pragma clang diagnostic pop

@end
