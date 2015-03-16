
# import <UIKit/UIKit.h>

@interface BSPageItem : UIView

@property (nonatomic, readonly) UIImageView *image;

- (void)updateData;

@end

@interface BSPageView : UIScrollView

@property (nonatomic, assign) NSUInteger selectedIndex;

- (void)reloadData;

@end

typedef NS_ENUM(NSUInteger, UIPageOption) {
    kUIPagedOptionAutomatic = 0x10,  // 自动
    kUIPagedOptionContinued = 0x20,  // 循环
    kUIPagedOptionForward = 0x0, // 往前
    kUIPagedOptionBackward = 0x1, // 往后
    kUIPagedOptionAutomicContinued = kUIPagedOptionAutomatic | kUIPagedOptionContinued | kUIPagedOptionForward,
};

@interface BSPageViewController : UIViewController

@property (nonatomic, retain) NSArray *pages;
@property (nonatomic, assign) NSInteger selectedIndex;
 
@property (nonatomic, assign) UIPageOption option;

- (void)setSelectedIndex:(NSInteger)selectedIndex animated:(BOOL)animated;
- (void)changeSelectedIndex:(NSInteger)selectedIndex animated:(BOOL)animated;

// 重新载入数据
- (void)reloadData;

// 滚动到上一个(下一个)页面, 如果到底(到首), 则自动调整 达到无限滚动目的
- (void)scrollToNext;
- (void)scrollToPrevious;

@end