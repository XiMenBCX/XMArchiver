//
//  XMArchiveFileManager.h
//  Rac_Temp
//
//  Created by 秦正华 on 2019/6/10.
//  Copyright © 2019 秦正华. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface XMArchiveFileManager : NSObject

/** 删除所有类的归档文件 */
-(void)removeAll;

/** 删除指定类归档文件 */
-(void)removeClassName:(NSString *)className;

/** 删除指定类的fileName归档文件 */
-(void)removeClassName:(NSString *)className fileName:(NSString *)fileName;

@end

NS_ASSUME_NONNULL_END
