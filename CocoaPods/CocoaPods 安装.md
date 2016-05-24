## CocoaPods 的安装

### 替换源
> 移除 ruby 源

	gem sources --remove https://rubygems.org/
	
> 添加国内淘宝源  

	gem sources -a https://ruby.taobao.org/
	
> 查看源

	gem sources -l
 <br />

### 更新 gem（输入密码）
	sudo gem update --system  
 <br />
 
### 安装 CocoaPods 
> OS X EI Capitan 前

	sudo gem install cocoapods  

> OS X EI Capitan 后

	sudo gem install -n /usr/local/bin cocoapods
​	

### 执行 Setup
	pod setup

* 时间略长
<br />

<br />


---

### 相关文章:  
[CocoaPods 使用](CocoaPods 使用.md)

### 参考:

唐巧原文:
[http://blog.devtang.com/2014/05/25/use-cocoapod-to-manage-ios-lib-dependency/](http://blog.devtang.com/2014/05/25/use-cocoapod-to-manage-ios-lib-dependency/)
  