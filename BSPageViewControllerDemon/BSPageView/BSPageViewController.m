

# import "BSPageViewController.h"

@implementation BSPageItem

- (id)init {
    self = [super init];
    
    _image = [[UIImageView alloc] init];
    [self addSubview:_image];
    
    return self;
}

- (void)updateData {
    
}

- (void)layoutSubviews {
    [super layoutSubviews];
    _image.frame = self.bounds;
}

@end

@interface BSPageView ()

@property (nonatomic, retain) NSArray *pages;
@property (nonatomic, assign) UIPageOption option;

@end

@implementation BSPageView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    self.showsVerticalScrollIndicator = NO;
    self.showsHorizontalScrollIndicator = NO;
    self.pagingEnabled = YES;
    
    return self;
}

- (void)setPages:(NSArray *)pages {
    if (_pages == pages) {
        return;
    }
    
    for (BSPageItem* obj in _pages) {
        [obj removeFromSuperview];
    }
    
    _pages = pages;
    _selectedIndex = 0;

    for (BSPageItem *each in _pages) {
        [self addSubview:each];
    }
}

- (void)reloadData {
    _selectedIndex = 0;
    for (BSPageItem *each in _pages) {
        [each updateData];
    }
    [self setNeedsLayout];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.contentSize = CGSizeMake(self.frame.size.width * (_pages.count), self.frame.size.height);
    for (int idx = 0; idx < _pages.count; idx++) {
        UIView *view = [_pages objectAtIndex:idx];
        CGRect r = self.bounds;
        r.origin.x = [self getOffsetByIndex:idx];
        view.frame = r;
    }
}

- (float)getOffsetByIndex:(NSInteger)index{
    return self.frame.size.width * index;
}

@end

@interface BSPageViewController ()

@property (nonatomic, retain) NSTimer *timer;

@end

@implementation BSPageViewController

- (id)init {
    self = [super init];
    
    return self;
}

- (void)loadView {
    [super loadView];
    BSPageView *view = [[BSPageView alloc] initWithFrame:self.view.frame];
    self.view = view;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}


- (void)setPages:(NSArray *)pages {
    if (_pages == pages) {
        return;
    }
    
    _pages = pages;
    [self pagedView].pages = pages;
}

- (void)reloadData {
    [[self pagedView] reloadData];
}

- (void)setSelectedIndex:(NSInteger)selectedIndex animated:(BOOL)animated {
    
}

- (void)changeSelectedIndex:(NSInteger)selectedIndex animated:(BOOL)animated {
    
}

- (void)setSelectedIndex:(NSInteger)selectedIndex {
    [self setSelectedIndex:selectedIndex animated:NO];
}

- (void)scrollToNext {
    
}

- (void)scrollToPrevious {
    
}

- (BSPageView *)pagedView {
    return (BSPageView *)self.view;
}


@end