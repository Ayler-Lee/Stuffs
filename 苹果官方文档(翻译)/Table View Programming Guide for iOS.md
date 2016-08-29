## Table View Programming Guide for iOS

苹果官方文档链接: [About Table Views iPhone](https://developer.apple.com/library/ios/documentation/UserExperience/Conceptual/TableView_iPhone/AboutTableViewsiPhone/AboutTableViewsiPhone.html)
> ### About Table Views in iOS Apps
> * 关于 iOS Apps 中的表视图

.
>Table views are versatile user interface objects frequently found in iOS apps. A table view presents data in a scrollable list of multiple rows that may be divided into sections.

* 表视图是 iOS apps中常见的多用途的用户交互对象. 一个表视图在一个可滚动的多行列表里呈现数据, 这个列表也可能被分为多个区.

>Table views have many purposes:

* 表视图有很多作用:

>
* To let users navigate through hierarchically structured data
* To present an indexed list of items
* To display detail information and controls in visually distinct groupings
* To present a selectable list of options

* 让用户通过分级的结构数据导航
* 呈现项目的索引列表
* 在一个区分开的组中展示详细信息和控件
* 呈现一个选项的可选列表

>Figure I-1  Table views of various kinds

> * 特性 I-1 各种各样的表视图

![](https://developer.apple.com/library/ios/documentation/UserExperience/Conceptual/TableView_iPhone/Art/types_of_table_views.jpg)

>
A table view has only one column and allows vertical scrolling only. It consists of rows in sections. Each section can have a header and a footer that displays text or an image. However, many table views have only one section with no visible header or footer. Programmatically, the UIKit framework identifies rows and sections through their index number: Sections are numbered 0 through n – 1 from the top of a table view to the bottom; rows are numbered 0 through n – 1 within a section. A table view can have its own header and footer, distinct from any section; the table header appears before the first row of the first section, and the table footer appears after the last row of the last section.

* 一个表视图, 只有一列且只允许垂直滚动. 它在区中组成行.每个区拥有一个 header 和 footer 来展示文本或图片. 然而有很多表视图只有一个没有可见 header 或 footer 的分区. 编程上来说,UIKit 框架通过索引号识别行和区: 分区从顶到底编号为 0 到 n - 1; 行在分区内编号 0 到 n - 1. 一个表视图能拥有它自己的 header 和 footer, 区别于分区; table header 在第一区的第一行出现之前出现,table footer 在最后一区的最后一行出现之后出现.

---
### At a Glance

>A table view is an instance of the `UITableView` class in one of two basic styles, plain or grouped. A plain table view is an unbroken list; a grouped table view has visually distinct sections. A table view has a data source and might have a delegate. The data source object provides the data for populating the sections and rows of the table view. The delegate object customizes its appearance and behavior.

* 一个表视图是一个`UITableView`类的实例, 在风格上有 plain 或 grouped 两者之一. 一个 plain 的表视图是一个未被分隔的列表; 一个 grouped 的表视图有可见的明显分区.一个表视图有一个数据源, 还可能有一个代理. 数据源对象提供数据来构成(populating)表视图的区和行. 代理对象定制表视图的外观和行为.
 
>**相关章节**: [Table View Styles and Accessory Views]()

-
> #### Table Views Draw Their Rows Using Cells
> * 表视图用 cell 描绘行

.
>A table view draws its visible rows using cells—that is, UITableViewCell objects. Cells are views that can display text, images, or other kinds of content. They can have background views for both normal and selected states. Cells can also have accessory views, which function as controls for selecting or setting an option.

* 表视图用 `UITableViewCell` 对象描绘它的可见行. Cell 是能展示文本, 图片, 或其他类型内容的视图. 它们在正常和选中状态可以有背景视图. Cell 也可以拥有附件视图(accessory views), 用来控制选择或设置选项.

>The UIKit framework defines four standard cell styles, each with its own layout of the three default content elements: main label, detail label, and image. You may also create your own custom cells to acquire a distinctive style for your app’s table views.

* `UIKit`框架定义了四种标准 cell 风格, 每一种都对三种默认内容元素进行布局: 主标签, 详情标签, 图片. 你也可以创建自定义的 cell 来让你 app的表视图获得独特的风格.

>When you configure the attributes of a table view in the storyboard editor, you choose between two types of cell content: static cells or dynamic prototypes.

* 当你在故事版中配置 table view的属性时, 你可以选择两种 cell 类型: 静态单元格(static cells) 或 动态原型(dynamic prototypes).

> * Static cells. Use static cells to design a table with a fixed number of rows, each with its own layout. Use static cells when you know what the table looks like at design time, regardless of the specific information it displays.
* Dynamic prototypes. Use dynamic prototypes to design one cell and then use it as the template for other cells in the table. Use a dynamic prototype when multiple cells in a table should use the same layout to display information. Dynamic prototype content is managed by the data source at runtime, with an arbitrary number of cells.

* **Static cells.** 用静态单元格设计一个拥有固定行数的表, 每个单元格有它自己的布局. 当你在设计时知道表是什么样子的时候用静态单元格, 不管它会显示什么特定信息.
* **Dynamic prototypes.**用动态原型设计一个 cell 并且用它做为其他 cell 的模板.当多个cell 用相同的布局展示信息时用动态原型. 动态原型内容在运行时被数据源管理,  拥有任意数量的 cell;

>**相关章节**: [Table View Styles and Accessory Views](), [A Closer Look at Table View Cells]()

-
> #### Responding to Selections of Rows
> * 响应选中行

.
>When users select a row (by tapping it), the delegate of the table view is informed via a message. The delegate is passed the indexes of the row and the section that the row is in. It uses this information to locate the corresponding item in the app’s data model. This item might be at an intermediate level in the hierarchy of data or it might be a “leaf node" in the hierarchy. If the item is at an intermediate level, the app displays a new table view. If the item is a leaf node, the app displays details about the selected item in a grouped-style table view or some other kind of view.

>In table views that list a series of options, tapping a row simply selects its associated option. No subsequent view of data is displayed.

* 当用户点选一行时, 表视图的代理被一条信息通知. 代理收到区和行的索引.它用这条信息定位合适的那条数据模型.这条模型可能在数据层次结构的中间层, 或者是层次结构中的"叶节点"(leaf node). 如果这个条目在中间层, app 展示一个新的表视图.如果这个条目是叶节点, app 展示分组风格选中的条目详情, 或者其他类型的视图.

>**相关章节:** [Navigating a Data Hierarchy with Table Views](), [Managing Selections]()

-
> #### In Editing Mode You Can Add, Delete, and Reorder Rows

ss
> #### To Create a Table View, Use a Storyboard

ss
> #### Prerequisites

ss
> #### See Also

ss
