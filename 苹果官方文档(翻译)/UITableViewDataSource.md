
## UITableViewDataSource

[文档链接 : UITableViewDataSource](https://developer.apple.com/library/ios/documentation/UIKit/Reference/UITableViewDataSource_Protocol/)

>
The `UITableViewDataSource` protocol is adopted by an object that mediates the application’s data model for a `UITableView` object. The data source provides the table-view object towith the information it needs to construct and modify a table view.

* UITableViewDataSource 协议被一个对象遵守, 它为一个 UITableView 调节数据模型.数据源为 table-view 提供信息,以供构建和改变 table view.

>
As a representative of the data model, the data source supplies minimal information about the table view’s appearance. The table-view object’s delegate—an object adopting the `UITableViewDelegate` protocol—provides that information.

* 做为一个数据模型的代表, 数据源提供了关于 tableview 外观的最基本的信息. table-view对象的代理 - 一个遵守了 `UITableViewDelegate` 协议的对象 - 提供了这些信息.

>
The required methods of the protocol provide the cells to be displayed by the table-view as well as inform the `UITableView` object about the number of sections and the number of rows in each section. The data source may implement optional methods to configure various aspects of the table view and to insert, delete, and reorder rows.

* @require 的协议方法提供了要被table-view展示的 Cell, 以及告诉`UItableView`对象 有几个区, 每个区有几行. 数据源也可能实现了 @optional 的方法用来,配置tableview 的各个方面,插入,删除,重新排序行.

>> 
NOTE:
To enable the swipe-to-delete feature of table views (wherein a user swipes horizontally across a row to display a Delete button), you must implement the tableView:commitEditingStyle:forRowAtIndexPath: method.

* 注意: 要启用滑动删除特性(用户水平滑动一行显示删除按钮), 你必须实现` tableView:commitEditingStyle:forRowAtIndexPath:`方法.

>
Many methods take NSIndexPath objects as parameters. UITableView declares a category on NSIndexPath that enables you to get the represented row index (row property) and section index (section property), and to construct an index path from a given row index and section index (indexPathForRow:inSection: class method). (The first index in each index path identifies the section and the next identifies the row.)

* 很多方法把 `NSIndexPath`对象做为参数. `UItableView`声明了一个`NSIndexPath`的分类, 让你可以 获取行索引(row 属性)和区索引( section 属性), 从一个给定的行索引和组索引(`indexPathForRow:inSection: `类方法)构建一个 indexPath.(每个 index path 的第一个索引标识了 区, 下一个索引标识了 行)

### 配置一个 TableView

`- tableView:cellForRowAtIndexPath:` Required
`- numberOfSectionsInTableView:`
`- tableView:numberOfRowsInSection:` Required
`- sectionIndexTitlesForTableView:`
`- tableView:sectionForSectionIndexTitle:atIndex:`
`- tableView:titleForHeaderInSection:`
`- tableView:titleForFooterInSection:`

### 插入或删除行

`- tableView:commitEditingStyle:forRowAtIndexPath:`
`- tableView:canEditRowAtIndexPath:`

### 重新排序行
`- tableView:canMoveRowAtIndexPath:`
`- tableView:moveRowAtIndexPath:toIndexPath:`
