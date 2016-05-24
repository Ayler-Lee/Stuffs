## CocoaPods 使用

### 1. 初始化

 * 打开终端, `cd` (`project home`) 到项目根目录(.xcodeproj 所在目录)
 * 输入 `pod init`  

> 这时项目目录中会生成一个 **`Podfile`** 文件;  
> 可以 `cat Podfile` 查看文件内容  


```
# Uncomment this line to define a global platform for your project
# platform :ios, '8.0'
# Uncomment this line if you're using Swift
# use_frameworks!

target 'CocoaPods测试' do

end

```
<br>

### 2. 编辑 Podfile 文件

* 将文件拖拽到 Xcode 图标上打开编辑;
* 终端 `vi Podfile` 用 vim 编辑器编辑;
* 其他编辑器 (**不要** 用默认的文本编辑器打开, 引号保存会出错)  

>
* `#`为注释;  
* 打开第二行, 为项目指定平台和系统版本
* 打开第四行, 如果是 Swift 项目

<br>

### 3. 引入第三方库
在 GitHub 上搜索要引入的库, 找到 **Installation with CocoaPods**, 复制 pod 命令

```
target 'CocoaPods测试' do 

// 在这里添加要引入的第三方库  
// 例如:  
pod 'AFNetworking', '~> 3.0'

end
```

* 保存并退出
<br>

### 4. 安装
* 终端执行: `pod install`  

> 此时终端显示: `Updating local specs repositories` 更新本地仓库, 时间较长, 可以添加参数禁用本地更新  

* `pod install --no-repo-update`  

安装成功后, 终端提示:

```
[!] Please close any current Xcode sessions and use 
`CocoaPod测试.xcworkspace` for this project from now on.
```

> 使用 CocoaPods 生成的 .xcworkspace 文件来打开工程，而不是以前的 .xcodeproj 文件。
<br>

### 5. 更新

* 每次更改了 Podfile 文件，你需要重新执行一次`pod update`命令。

<br>

### 5.附 vim 简单命令


<br>

---

### 相关文章:
[CocoaPods 安装](CocoaPods 安装.md)


### 参考:
1. vi/vim基本使用方法: [http://www.lupaworld.com/?uid-296380-action-viewspace-itemid-118973](http://www.lupaworld.com/?uid-296380-action-viewspace-itemid-118973)
2. 用CocoaPods做iOS程序的依赖管理: [http://blog.devtang.com/2014/05/25/use-cocoapod-to-manage-ios-lib-dependency/](http://blog.devtang.com/2014/05/25/use-cocoapod-to-manage-ios-lib-dependency/)




