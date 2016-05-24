> ####最简单教程
> 更新时间 : 2016.05.24

**以下均为终端命令**

## 1. 替换源

```
gem sources --remove https://rubygems.org/ //移除 国外ruby源
gem sources -a https://ruby.taobao.org/   //添加淘宝镜像
gem sources -l    //查看列表
```

## 2. 更新 gem （输入密码）
	sudo gem update --system  

## 3. 安装 CocoaPods 

> Mac OS 系统更新到 10.11之后,网上旧教程失效, 用下面第二条命令

* OS X EI Capitan 前 (10.10)
```
sudo gem install cocoapods
```
* OS X EI Capitan 后 (10.11)
```
sudo gem install -n /usr/local/bin cocoapods
```	

## 4. 执行 Setup
* 时间略长
      pod setup

---

### 相关文章:  
[CocoaPods 使用](CocoaPods 使用.md)