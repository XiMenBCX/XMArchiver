//
//  NSObject+XMArchiver.h
//  Rac_Temp
//
//  Created by 秦正华 on 2019/6/10.
//  Copyright © 2019 秦正华. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSObject (XMArchiver)

/** 归档到指定路径下,文件名为fileName */
-(BOOL)xm_archiveToFileName:(NSString *)fileName;

/** 解档指定路径下fileName文件 */
+(id)xm_unarchiveToFileName:(NSString *)fileName;

@end

