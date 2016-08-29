## UITableViewDelegate

[苹果官方文档地址 : UITableViewDelegate_Protocol](https://developer.apple.com/library/ios/documentation/UIKit/Reference/UITableViewDelegate_Protocol/index.html)
>
The delegate of a `UITableView` object must adopt the `UITableViewDelegate` protocol. Optional methods of the protocol allow the delegate to manage selections, configure section headings and footers, help to delete and reorder cells, and perform other actions.

* 一个 UITableView 对象的代理必须遵守< UITableViewDelegate >协议.协议中的@optional方法, 允许代理管理分区, 配置分区header 和 footer, 帮助删除和重新排序 cell, 执行其他方法.

>
Many methods of the `UITableViewDelegate` protocol take `NSIndexPath` objects as parameters and return values. UIKit declares a category on `NSIndexPath` that enables you to get the represented row index (row property) and section index (section property), and to construct an index path from a given row index and section index (indexPathForRow:inSection: method).

Because rows are located within their sections, you usually must evaluate the section index number before you can identify the row by its index number.

* 许多< UITableViewDelegate >协议的方法, 把NSIndexPath对象做为参数或返回值. UIKit 声明了一个NSIndexPath的分类, 让你能够获取行索引(row 属性)和区索引(section 属性)的代表, 用给定的行索引和区索引构建一个index path对象(`indexPathForRow:inSection: method`).由于行位于区内, 所以通常你必须先评估区索引号才能通过行索引号确定该.


### [为 tableview 配置行]()
`- tableView:heightForRowAtIndexPath:`
`- tableView:estimatedHeightForRowAtIndexPath:`
`- tableView:indentationLevelForRowAtIndexPath:`
`- tableView:willDisplayCell:forRowAtIndexPath:`

### [管理辅助视图]()
`- tableView:editActionsForRowAtIndexPath:`
<del>`- tableView:accessoryTypeForRowWithIndexPath:`</del>
`- tableView:accessoryButtonTappedForRowWithIndexPath:`

### [管理 区]()
`- tableView:willSelectRowAtIndexPath:`
`- tableView:didSelectRowAtIndexPath:`
`- tableView:willDeselectRowAtIndexPath:`
`- tableView:didDeselectRowAtIndexPath:`

### [修改区 header 和 footer]()
`- tableView:viewForHeaderInSection:`
`- tableView:viewForFooterInSection:`
`- tableView:heightForHeaderInSection:`
`- tableView:estimatedHeightForHeaderInSection:`
`- tableView:heightForFooterInSection:`
`- tableView:estimatedHeightForFooterInSection:`
`- tableView:willDisplayHeaderView:forSection:`
`- tableView:willDisplayFooterView:forSection:`

###  [编辑行]()
`- tableView:willBeginEditingRowAtIndexPath:`
`- tableView:didEndEditingRowAtIndexPath:`
`- tableView:editingStyleForRowAtIndexPath:`
`- tableView:titleForDeleteConfirmationButtonForRowAtIndexPath:`
`- tableView:shouldIndentWhileEditingRowAtIndexPath:`
### [重新排序行]()
`- tableView:targetIndexPathForMoveFromRowAtIndexPath:toProposedIndexPath:`

### [追踪视图的移动]()
`- tableView:didEndDisplayingCell:forRowAtIndexPath:`
`- tableView:didEndDisplayingHeaderView:forSection:`
`- tableView:didEndDisplayingFooterView:forSection:`

### [复制 粘贴行内容]()
`- tableView:shouldShowMenuForRowAtIndexPath:`
`- tableView:canPerformAction:forRowAtIndexPath:withSender:`
`- tableView:performAction:forRowAtIndexPath:withSender:`

### [管理 tableView 高亮]()
`- tableView:shouldHighlightRowAtIndexPath:`
`- tableView:didHighlightRowAtIndexPath:`
`- tableView:didUnhighlightRowAtIndexPath:`

### [管理 tableView 聚焦]()
`- tableView:canFocusRowAtIndexPath:`
`- tableView:shouldUpdateFocusInContext:`
`- tableView:didUpdateFocusInContext:withAnimationCoordinator:`
`- indexPathForPreferredFocusedViewInTableView:`