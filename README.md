# DraggableViewDemo

这份代码能够让你轻松实现可拖动的视图。

使用方法：

1、下载并导入分类UIView+Draggable。

2、对需要拖动的控件设置draggingType。

支持继承于UIView的所有控件如UIButton、UITableView、ContainerView等。设置拖动后将优先响应拖动，继承于UIScrollView的控件如UITableView，UITextView等将无法滚动，拖动结束可通过设置draggingType=DraggingTypeDisabled来恢复UIScrollView的滚动事件。

支持autolayout，autosizing。被拖动的控件会自动移除边距约束。

支持代码，也支持interface builder。

可设置类型包括：

```
/**
 拖拽方式
 - DraggingTypeDisabled :不能拖拽
 - DraggingTypeNormal: 正常拖拽
 - DraggingTypeRevert: 释放后还原
 - DraggingTypePullOver: 自动靠边,只会靠左右两边
 - DraggingTypeAdsorb: 靠边时自动吸附边缘，可吸附四周
 */
typedef NS_ENUM(NSUInteger, DraggingType) {
    DraggingTypeDisabled,
    DraggingTypeNormal,
    DraggingTypeRevert,
    DraggingTypePullOver,
    DraggingTypeAdsorb,
};
```
可设置拖动范围
```
/**
 是否可只能在subView的范围内，默认是NO。
 
 @warning 如果NO，超出subView范围的部分无法响应拖拽。剪裁超出部分可直接使用superView.clipsToBounds=YES
 */
@property(nonatomic)BOOL draggingInBounds;
```
可主动操作View
```
/**
 主动靠边并吸附
 */
-(void)adsorbingAnimated:(BOOL)animated;

/**
 主动靠边
 */
-(void)pullOverAnimated:(BOOL)animated;

/**
 主动还原位置
 */
-(void)revertAnimated:(BOOL)animated;
```
可监听拖动事件以实现更多自定义功能
```
-(void)draggingDidBegan:(UIView *)view;
-(void)draggingDidChanged:(UIView *)view;
-(void)draggingDidEnded:(UIView *)view;
```

如果有什么不对的地方欢迎斧正。
