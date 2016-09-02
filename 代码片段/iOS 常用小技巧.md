## iOS 常用小技巧

* 调试打印View所有子视图

```
po [[self view]recursiveDescription]
```

* 过滤特殊字符

``` Objective-C
// 定义一个特殊字符的集合
NSCharacterSet *set = [NSCharacterSet characterSetWithCharactersInString:
@"@／：；（）¥「」＂、[]{}#%-*+=_\\|~＜＞$€^•'@#$%^&*()_+'\""];
// 过滤字符串的特殊字符
NSString *newString = [trimString stringByTrimmingCharactersInSet:set];
``` 


* 计算方法耗时时间间隔

```
// 获取时间间隔
#define TICK   CFAbsoluteTime start = CFAbsoluteTimeGetCurrent();
#define TOCK   NSLog(@"Time: %f", CFAbsoluteTimeGetCurrent() - start)
```

* Color颜色宏定义

```
// 随机颜色
#define RANDOM_COLOR [UIColor colorWithRed:arc4random_uniform(256) / 255.0 green:arc4random_uniform(256) / 255.0 blue:arc4random_uniform(256) / 255.0 alpha:1]
// 颜色(RGB)
#define RGBCOLOR(r, g, b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]
// 利用这种方法设置颜色和透明值，可不影响子视图背景色
#define RGBACOLOR(r, g, b, a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]
```

* NSArray 快速求总和 最大值 最小值 和 平均值

```
NSArray *array = [NSArray arrayWithObjects:@"2.0", @"2.3", @"3.0", @"4.0", @"10", nil];
CGFloat sum = [[array valueForKeyPath:@"@sum.floatValue"] floatValue];
CGFloat avg = [[array valueForKeyPath:@"@avg.floatValue"] floatValue];
CGFloat max =[[array valueForKeyPath:@"@max.floatValue"] floatValue];
CGFloat min =[[array valueForKeyPath:@"@min.floatValue"] floatValue];
NSLog(@"%f\n%f\n%f\n%f",sum,avg,max,min);
```

* 修改Label中不同文字颜色

```
- (void)touchesEnded:(NSSet<UITouch> *)touches withEvent:(UIEvent *)event
{
    [self editStringColor:self.label.text editStr:@"好" color:[UIColor blueColor]];
}

- (void)editStringColor:(NSString *)string editStr:(NSString *)editStr color:(UIColor *)color {
    // string为整体字符串, editStr为需要修改的字符串
    NSRange range = [string rangeOfString:editStr];

    NSMutableAttributedString *attribute = [[NSMutableAttributedString alloc] initWithString:string];

    // 设置属性修改字体颜色UIColor与大小UIFont
    [attribute addAttributes:@{NSForegroundColorAttributeName:color} range:range];

    self.label.attributedText = attribute;
}
```

* Label行间距

```
-（void）ParagraphStyle{
    NSMutableAttributedString *attributedString =    
   [[NSMutableAttributedString alloc] initWithString:self.contentLabel.text];
    NSMutableParagraphStyle *paragraphStyle =  [[NSMutableParagraphStyle alloc] init];  
   [paragraphStyle setLineSpacing:3];

    //调整行间距       
   [attributedString addAttribute:NSParagraphStyleAttributeName 
                         value:paragraphStyle 
                         range:NSMakeRange(0, [self.contentLabel.text length])];
     self.contentLabel.attributedText = attributedString;
}
```

* UIImageView填充模式

```
@"UIViewContentModeScaleToFill",      // 拉伸自适应填满整个视图  
@"UIViewContentModeScaleAspectFit",   // 自适应比例大小显示  
@"UIViewContentModeScaleAspectFill",  // 原始大小显示  
@"UIViewContentModeRedraw",           // 尺寸改变时重绘  
@"UIViewContentModeCenter",           // 中间  
@"UIViewContentModeTop",              // 顶部  
@"UIViewContentModeBottom",           // 底部  
@"UIViewContentModeLeft",             // 中间贴左  
@"UIViewContentModeRight",            // 中间贴右  
@"UIViewContentModeTopLeft",          // 贴左上  
@"UIViewContentModeTopRight",         // 贴右上  
@"UIViewContentModeBottomLeft",       // 贴左下  
@"UIViewContentModeBottomRight",      // 贴右下
```

* 获取 iOS 路径的方法

```
// 获取家目录路径的函数
NSString *homeDir = NSHomeDirectory();

// 获取Documents目录路径的方法
NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
NSString *docDir = [paths objectAtIndex:0];

// 获取Caches目录路径的方法
NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
NSString *cachesDir = [paths objectAtIndex:0];

// 获取tmp目录路径的方法：
NSString *tmpDir = NSTemporaryDirectory();
```

> ###字符串相关操作

```
// 去除所有的空格
[str stringByReplacingOccurrencesOfString:@" " withString:@""]

// 去除首尾的空格
[str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];

- (NSString *)uppercaseString; 全部字符转为大写字母
- (NSString *)lowercaseString 全部字符转为小写字母
```

* MRC和ARC混编设置方式

1. 在XCode中targets的build phases选项下Compile Sources下选择 不需要arc编译的文件
双击输入 `-fno-objc-arc` 即可

2. MRC工程中也可以使用ARC的类，方法如下：
在XCode中targets的build phases选项下Compile Sources下选择要使用arc编译的文件
双击输入 `-fobjc-arc` 即可


* 设置滑动的时候隐藏navigationbar

```
navigationController.hidesBarsOnSwipe = Yes
```

* 屏幕截图

```
 // 1. 开启一个与图片相关的图形上下文
    UIGraphicsBeginImageContextWithOptions(self.view.bounds.size,NO,0.0);

    // 2. 获取当前图形上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();

    // 3. 获取需要截取的view的layer
    [self.view.layer renderInContext:ctx];

    // 4. 从当前上下文中获取图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();

    // 5. 关闭图形上下文
    UIGraphicsEndImageContext();

    // 6. 把图片保存到相册
    UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil);
```


```
- (NSArray<uitableviewrowaction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewRowAction *deleteRowAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"删除" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        [self.arrayTest removeObjectAtIndex:indexPath.row];
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }];
    UITableViewRowAction *topRowAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:@"置顶" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        [self.arrayTest exchangeObjectAtIndex:indexPath.row withObjectAtIndex:0];
        NSIndexPath *firstIndexPath = [NSIndexPath indexPathForRow:0 inSection:indexPath.section];
        [tableView moveRowAtIndexPath:indexPath toIndexPath:firstIndexPath];
    }];
    topRowAction.backgroundColor = [UIColor blueColor];
    UITableViewRowAction *moreRowAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"更多" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationMiddle];
    }];
    return @[deleteRowAction,topRowAction,moreRowAction];
}</uitableviewrowaction *>
```
















