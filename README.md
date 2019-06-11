# XMArchiver
快速解档归档

## 1.使用方法

```object-c
/** 归档到指定路径下,文件名为fileName */
-(BOOL)xm_archiveToFileName:(NSString *)fileName;

/** 解档指定路径下fileName文件 */
+(id)xm_unarchiveToFileName:(NSString *)fileName;
```

*归档对象设置保存在document/XMArchiverDir文件夹下,根据需求可以自行修改宏定义文件夹名*

```
#define XMArchiverDir @"XMArchiverDir"
```
