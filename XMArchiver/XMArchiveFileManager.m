//
//  XMArchiveFileManager.m
//  Rac_Temp
//
//  Created by 秦正华 on 2019/6/10.
//  Copyright © 2019 秦正华. All rights reserved.
//

#import "XMArchiveFileManager.h"

#define XMArchiverDir @"XMArchiverDir"

@implementation XMArchiveFileManager

/** 删除所有类的归档文件 */
-(void)removeAll
{
    NSString *docPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject;
    
    NSString *dirPath = [docPath stringByAppendingPathComponent:XMArchiverDir];
    
    NSError *error = nil;
    [[NSFileManager defaultManager] removeItemAtPath:dirPath error:&error];
    NSAssert(error == nil, @"删除所有类的归档文件失败");
}

/** 删除指定类归档文件 */
-(void)removeClassName:(NSString *)className
{
    [[NSFileManager defaultManager] changeCurrentDirectoryPath:[XMArchiveFileManager archvierPath]];
    
    NSArray *fileLists = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:[NSFileManager defaultManager].currentDirectoryPath error:nil];
    for (NSString *fileName in fileLists) {
        if ([fileName hasPrefix:className]) {
            NSError *error = nil;
            [[NSFileManager defaultManager] removeItemAtPath:fileName error:&error];
            NSAssert(error == nil, @"删除指定类归档文件失败");
        }
    }
}

/** 删除指定类的fileName归档文件 */
-(void)removeClassName:(NSString *)className fileName:(NSString *)fileName
{
    [[NSFileManager defaultManager] changeCurrentDirectoryPath:[XMArchiveFileManager archvierPath]];
    
    NSError *error = nil;
    [[NSFileManager defaultManager] removeItemAtPath:[NSString stringWithFormat:@"%@_%@.data",className,fileName] error:&error];
    NSAssert(error == nil, @"删除指定类的fileName归档文件");
}


/** 获取归档文件夹路径 */
+ (NSString *)archvierPath
{
    NSString *docPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject;
    
    NSString *dirPath = [docPath stringByAppendingPathComponent:XMArchiverDir];
    
    return dirPath;
}

@end
