## UITableView

#### 点击 tableView 退下键盘:
```
UITapGestureRecognizer *tableViewGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tableViewEndEditing)];
    tableViewGesture.numberOfTapsRequired = 1;//几个手指点击
    tableViewGesture.cancelsTouchesInView = NO;//是否取消点击处的其他action
    [self.tableView addGestureRecognizer:tableViewGesture];
```
```
- (void)tableViewEndEditing {
    [self.TextField resignFirstResponder];
}
```

#### 去掉分割线多余15像素  

```
// 首先在viewDidLoad方法加入以下代码：
 if ([self.tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [self.tableView setSeparatorInset:UIEdgeInsetsZero];    
}   
 if ([self.tableView respondsToSelector:@selector(setLayoutMargins:)]) {        
        [self.tableView setLayoutMargins:UIEdgeInsetsZero];
}
// 然后在重写willDisplayCell方法
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell 
forRowAtIndexPath:(NSIndexPath *)indexPath{   
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {       
             [cell setSeparatorInset:UIEdgeInsetsZero];    
    }    
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {        
             [cell setLayoutMargins:UIEdgeInsetsZero];    
    }
}
```


#### 去掉Section headerview黏性(sticky)

```
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView == self.tableView) {
        CGFloat sectionHeaderHeight = 10; //sectionHeaderHeight
        if (scrollView.contentOffset.y <= sectionHeaderHeight && scrollView.contentOffset.y >= 0) {
            scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);
        } else if (scrollView.contentOffset.y >= sectionHeaderHeight) {
            scrollView.contentInset = UIEdgeInsetsMake(-sectionHeaderHeight, 0, 0, 0);
        }
    }
}
```

#### 设置分组间距
```
- (void)setGroupSectionHeight:(CGFloat)sectionHeitht {
    // 隐藏GroupedTableView上边多余的间隔 http://blog.sunnyxx.com/2015/04/15/ios-hide-grouped-tableview-header/
    self.tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, sectionHeitht)];
    self.tableView.sectionHeaderHeight = sectionHeitht / 2;
    self.tableView.sectionFooterHeight = sectionHeitht / 2;
}
```