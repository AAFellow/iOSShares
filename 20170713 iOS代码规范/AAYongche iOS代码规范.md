# 开发环境

- 大版本升级前，如从Xcode8升级到Xcode9，需要全团队统一意见后再进行升级。
- 请及时升级到最新的小版本，以享受更多新特性。

# 文件组织

- 工程里的group和文件的物理位置一一对应。不包含内容的的group应该删除，工程中未使用的无用文件也应及时删除。
- 子group放在父group内的最上方。
- 各group和文件，若有业务逻辑的顺序，按照逻辑顺序排放。若无业务上的顺序，尽量按照字母顺序排序。

# 代码组织

`.m`文件内各部分的顺序如下：

1. 文件注释
2. `#import`
3. 宏定义
4. typedef
5. 常量
6. 静态函数
7. 匿名类别
8. `@implement`

以上各部分内部的内容，除了按照业务逻辑排序，尽量按照字母顺序排序。比如`#import`的所有头文件，最好按照文件名排序（当前文件的.h文件不参与排序，放在最上方）。其它可以作排序的还有宏定义、匿名类别中标明要实现的delegate名称等。

`@implement`中的函数使用`#pragma mark - `进行分块，他们的分块及顺序请多注意。

```
//
//  AASomeViewController.h
//  AADriver
//
//  Created by fuYanan on 16/9/12.
//  Copyright © 2016年 AADriver. All rights reserved.
//

#import "AASomeViewController.h"
#import "AAGetTouchButton.h"
#import "AAMapView.h"
#import "LocationManager.h"
#import "NSDate+Helper.h"
#import "ReceivedOrderDetailViewController.h"

#define BUFFER_SIZE (10 * 1024 * 1024)
#define MY_HEIGHT 400

typedef NS_ENUM(NSInteger, AAMapSearchErrorType)
{
    AASearchErrorTypeOnRoute = 1,   // 路径规划报错
    AASearchErrorTypeOnPoiKeywords, // poi报错
    AASearchErrorTypeOnReGeocode,   // 逆地理编码报错
    AASearchErrorTypeOnWeather,     // 天气搜索报错
    AASearchErrorTypeOnPOIAround,   // 附近搜索报错
};

typedef NS_ENUM(NSInteger, AAMapWeatherType)
{
    AAMapWeatherTypeLive = 1,   // 实时
    AAMapWeatherTypeForecast    // 预报
};

static const NSUInteger kAlertTagExitApp = 10;
static const NSUInteger kAlertTagUpdataCheckForce = 11;
static const NSUInteger kAlertTagUpdataCheckOptional = 12;
static const NSUInteger kAlertTagUpdataCheckForceInLogin = 13;
static const NSUInteger kAlertTagGoSettings = 14;

static CGFloat _NSStringPathScale(NSString *string) {
    return 0.0f;
}

@interface AASomeViewController () <UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate>

@property(nonatomic,strong)UITextField *usernameField;
@property(nonatomic,strong)UITextField *passwordField;
@property(nonatomic,strong)UITextField *verificationField;

@end

@implement

#pragma mark - Lifecycle

- (instancetype)init {

- (void)dealloc {

- (void)viewDidLoad {

- (void)viewWillAppear:(BOOL)animated {

- (void)viewDidAppear:(BOOL)animated {

- (void)viewWillDisappear:(BOOL)animated {

- (void)viewDidDisappear:(BOOL)animated {

- (void)didReceiveMemoryWarning {

#pragma mark - Override

-(void)leftBackButtonClick {

#pragma mark - Custom Accessors

- (void)setCustomProperty:(id)value {

- (id)customProperty {

#pragma mark - Actions

- (void)submitButtonClick:(UIButton *)sender {

#pragma mark - Public

- (void)publicMethod {

#pragma mark - Private

- (void)privateMethod {

#pragma mark - UITableViewDataSource

#pragma mark - UITableViewDelegate

#pragma mark - UITextFieldDelegate

#pragma mark - NSCopying

- (id)copyWithZone:(NSZone *)zone {

#pragma mark - NSObject

- (NSString *)description {

@end
```

# 空格

## 缩进

缩进使用4个空格，不要使用“Tab”。Xcode默认就是这样的。可在“Xcode -> Preferences -> Text Editing -> Indentation”确保如此。

## 运算符

二元运算符两侧都需要空格，一元运算符不需要。如：

```
    void *ptr = &value + 10 * 3;
    time += link.duration;
    curLoop++;
```

- 例外：CGRectMake()这种函数里，简单的计算如`(self.frame.size.width-40*2)/2`，运算符两侧可以没有空格。但是一般来说，尽量还是要有空格的，特别是里面的算式比较长，或者有二元运算符、函数调用等。当然，这时候最好新建一个变量，算完后，再直接放到CGRectMake()里。

## 指针符号

指针符号与前面的类型之间有空格，与其后的名称之间没有空格。如：

```
    UIView *view = [[UIView alloc] init];
    UIButton *button = [[UIButton alloc] initWithFrame:rect];
```

属性声明时，`*`前面的空格的数量不做规定，默认只有一个，但是也可根据上下文做对齐。

```
@property (nonatomic, strong) AAMapSearchManager *searchManager;
```

## 其它

- 基本上，符号`(`、`<`、`{`前面都有一个空格。
- 符号`)`、`>`、`,`、`;`、`]`后面有一个空格，除非到了行尾。
- 符号`:`、`-`前后都有空格。

```
@protocol AAMapNaviViewDelegate <NSObject>

@interface BaseViewController () <UIGestureRecognizerDelegate, NIMConversationManagerDelegate> {

@interface YYAnimatedImageView : UIImageView

    if ((_curLoop >= _totalLoop) && (_totalLoop != 0)) {
    
    for (int i = 0; i < 100; i++) {
    
    int i = isHidden ? 0 : 1;
    
    UIView *view = [[UIView alloc] init];
    
#pragma mark - UITableviewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

```

- 一些其它例子：

```
@property (attributes) id<Protocol> object;

    CGRectGetMaxY(workTimeButton.frame);
    NSArray *theStuff = @[@1, @2, @3];
    NSDictionary *keyedStuff = @{GHDidCreateStyleGuide : @YES};
```

# 空行与换行

## 空行

- 原则上，最大连续空行数为1，某些地方如`@interface`、`@implement`的前面可以有两个连续空行，但不要超过两个连续空行。
- 函数之间有且只有一个空行。在`@interface`或`@protocol`中，同组函数之间可以没有空行。
- 函数和`@interface`、`@implement`、`@end`、`#pragma mark - `等行之间也有一个空行。
- 在函数中，开始一段新的业务逻辑代码时，应该使用换行来进行视觉分割以增加代码的可读性。当然，若无必要，也请勿保留多余空行。
- 文件末尾有一个空行。

## 换行

- 我们不强制限制每行最多多少字符，但是建议将Xcode的行宽提示设为120个字符，这在13寸的mac上也能显示完全。在编码过程中，尽量保持每行代码不要过长。

- 如果if的判断条件由多个逻辑运算组成，每个逻辑运算都占一行，逻辑运算符在行首。

应该
```
    if ([AAProjectShare share].hasInternet
        && [AAProjectShare share].driver_token.length > 0
        && [AAProjectShare share].duty == 1) {
        // ...
    }
```
不应该
```
    if ([AAProjectShare share].hasInternet&&[AAProjectShare share].driver_token.length>0&&[AAProjectShare share].duty == 1) {
```

- 其它换行例子

```
    NSArray *theStuff = @[
        @"Got some long string objects in here.",
        [AndSomeModelObjects too],
        @"Moar strings."
    ];
    
    NSString *string = @"这段字符太长了，以至于不得不分行显示。这段字符太长了，以至于不得不分行显示。这段字"
                        "符太长了，以至于不得不分行显示。这段字符太长了，以至于不得不分行显示。这段字符太长"
                        "了，以至于不得不分行显示。这段字符太长了，以至于不得不分行显示。";
```

# 括号

- 函数定义、控制语句的`{`放在行尾，不独占一行。末尾的`}`新开一行，并与对应的语句开头对齐。
- 连续多个运算，可能产生优先级歧义时，应该用圆括号隔开多个运算。如：

```
   CGFloat verImageViewOneTop = CGRectGetMaxY(workTimeButton.frame) + (iPhone4 ? 8 : AutoScaleHeight(30));
```

- `if`语句中，即使后面只有一句，也应该使用大括号。`for`、`while`等语句同样如此。

应该
```
    if (!error) {
        return success;
    }
```
不应该
```
    if (!error)
        return success; 

    if (!error) return success;
```

- `case`语句中，如果有多行，也应该使用大括号。如：

```
    switch (condition) {
        case 1:
            // ...
            break;
        case 2: {
            // ...
            // 多行用大括号
            break;
        }
        case 3:
            // ...
            break;
        default:
            // ...
            break;
    }
```

# 命名

- 使用美国英语，注意拼写正确。不要使用汉字，不要使用拼音。
- 使用长的、描述性的命名：

应该：
```
UIButton *settingsButton;  
```
不应该：
```
UIButton *setBut;  
```

- 类名用大写开头的驼峰命名法，最好带上AA前缀。
- 类别名也用大写开头的驼峰命名法。单独占一个文件的类别，文件名以`类名+类别名.h`、`类名+类别名.m`命名。
- 系统类的类别里的函数，为防冲突，可以带上`aa_`前缀。
- NS_ENUM、NS_OPTIONS也用大写开头的驼峰命名法，其中的每一项都以名称开头。

应该
```
typedef NS_ENUM(NSInteger, AAMapWeatherType)
{
    AAMapWeatherTypeLive = 1,    // 实时
    AAMapWeatherTypeForecast     // 预报
};

typedef NS_OPTIONS(NSUInteger, UIViewAnimationOptions) {
    UIViewAnimationOptionLayoutSubviews            = 1 <<  0,
    UIViewAnimationOptionAllowUserInteraction      = 1 <<  1,
    ……
};
```
不应该
```
typedef enum {
    noneMethod,//定位失败、获取城市列表也失败
    locationMethod,//通过定位拿到的服务列表
    cityListMethod,//定位失败情况下，通过城市列表拿到的服务
}getServiceMethod;//用于限制选择地点页是否定位以及地图上是否显示定位按钮
```

- 私有的静态常量名可以以`k`开头。如：

```
static const NSUInteger kAlertTagExitApp = 10;
```

- 宏定义的名称一定要以大写字母开头，推荐使用全大写字母，单词间使用`_`连接。多单词的情况下，每单词首字母大写也可接受。

应该：
```
#define ICON_HEIGHT 40
#define PushNewOrderData_Notification @"PushNewOrderData_Notification"
```
不应该：
```
#define baseHeight 115
```

- 属性的命名也使用驼峰式，首单词的首字母小写。如：

```
@property (strong, nonatomic) NSString *descriptiveVariableName;  
```

- 变量尽量以描述性的方式来命名。单个字符的变量命名应该尽量避免，除了除了for()循环语句中的`int i`。

- 不要使用与iOS SDK中相同的名字，防止混淆出错。

```
@property (strong, nonatomic) NSString *view;
```

- 函数及变量命名不要与Objective-C惯用法冲突。如：

```
// 如正常的函数命名不要用`set`开头，这样看起来就像是个属性
- (void)setDoSomething
```

- 有些特殊函数的命名尽量遵从苹果的惯用法。如：

```
// 初始化函数以init开头
- (instancetype)initWithCarModel:(CarModel*) {
```

更多命名规则可参考[苹果官方文档](https://developer.apple.com/library/content/documentation/Cocoa/Conceptual/CodingGuidelines/CodingGuidelines.html#//apple_ref/doc/uid/10000146-SW1)

# 属性与成员变量

- 成员变量的命名以下划线`_`开头。
- 推荐使用属性，而不推荐使用成员变量。
- 应该使用`.`语法来访问属性，访问实例对象时首选括号。如：

```
    view.backgroundColor = [UIColor orangeColor];
    [UIApplication sharedApplication].delegate;
```

- 不要使用属性自动生成的以下划线开头的成员变量。除非在某些特殊函数中，如`init`、`dealloc`、`setter`、`getter`等。
- 不需要暴露出来的的属性不要在头文件中声明，而应该在实现文件中的匿名类别中声明。

## 属性特性

- 如果属性只在`init`中设置值，应将它声明为`readonly`。
- NSString属性应声明为`copy`。

# 函数

- 函数声明的`+`或者`-`之后有一个空格。`(`前、`)`后、`:`前后无空格。
- 在参数之前应该包含一个具有描述性的关键字来描述参数。注意遵循苹果的风格。
- `init`方法的返回类型应该使用`instancetype`而不是`id`。

应该
```
+ (void)setExampleText:(NSString *)text image:(UIImage *)image;
- (id)viewWithTag:(NSInteger)tag; 
- (instancetype)initWithWidth:(CGFloat)width height:(CGFloat)height; 
```
不应该
```
+(void)setExampleText:(NSString *)text :(UIImage *)image;
-(void)setT:(NSString *)text i:(UIImage *)image; 
- (id)taggedView:(NSInteger)tag; 
- (id)initWithWidth:(CGFloat)width andHeight:(CGFloat)height;  
- (id)initWith:(int)width and:(int)height;
- (id)initWithWidth:(CGFloat)width height:(CGFloat)height; 
```

- 动作触发函数以动作为结尾。如`UIButton`点击函数以`ButtonClick:`结尾，`UISwitch`动作函数以`SwitchAction:`结尾。

应该
```
    [rechargeButton addTarget:self action:@selector(rechargeButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [settingSwitch addTarget:self action:@selector(settingSwitchAction:) forControlEvents:UIControlEventValueChanged];
```
不应该
```
    [rechargeButton addTarget:self action:@selector(recharge) forControlEvents:UIControlEventTouchUpInside];
```

- 尽量给每个触发函数起一个名字，不要多个控件公用一个函数。减少magic number的tag使用，如真的需要使用，则给tag声明个常量，取一个直观的名字。如：

```
static const NSUInteger kAlertTagExitApp = 10;

    AAAlertView * alert = [[AAAlertView alloc] initWithTitle:@"网络连接失败，请检查网络"
                                                     message:nil
                                                    delegate:self
                                           cancelButtonTitle:@"确定"
                                           otherButtonTitles:nil];
    alert.tag = kAlertTagExitApp;
    [alert show];

- (void)alertView:(AAAlertView *)alertView clickedButtonAtIndex:(int)buttonIndex {
    if (alertView.tag == kAlertTagExitApp) {
        exit(0);
    }
```

- 函数参数过长时，每个参数占一行，并以`:`对齐。如果第一行参数比较短，则下面的最长行缩进4个空格，其余行以`:`对齐。如：

```
- (void)doSomethingWith:(MyObj *)obj
                   rect:(NSRect)rect
               interval:(float)interval {
  ...
}

- (void)short:(MyObj *)obj
          longKeyword:(NSRect)rect
    evenLongerKeyword:(float)interval
                error:(NSError **)error {
  ...
}

    [myObj short:arg1
                  longKeyword:arg2
        evenLongLongerKeyword:arg3
                        error:arg4];
```

# 注释

- 注释的快捷键：`command + option + /`。
- 尽量保证代码能自解释，让人能直接读懂。但在需要的时候一定要加上精到的注释。
- 写代码时也要注意及时更新注释，已过期的注释要及时删除。
- 产品版本更迭产生的无用代码，如无特别理由，不要以注释形式留下来。
- 文件生成模板所带的注释代码要及时删除。如ViewController中的`prepareForSegue:sender`方法，View中的`drawRect:`方法，`viewDidLoad:`函数中的`// Do any additional setup after loading the view.`等说明文字。
- .h文件中暴露出来的接口，应该添加关于函数、参数、返回值以及副作用的注释。

常用注释字段如下

```
/**
 描述信息。说明它是用来干什么的。
 @discussion 如果有必要，这里可以添加一些其他信息，如为何这么设计、它的应用范围等。
 
 @param  title 提示消息标题
 @param  message 提示消息的内容
 @param  signs signRangeList的具体含义，及如何使用。
 @return 返回值的含义
 
 @exception NSException可能抛出的异常.
 
 @see someMethod

 @warning 可能的副作用、不应该如何使用等。
 @bug 已发现的bug及应对策略
 */
- (instancetype)initWithTitle:(NSString *)title message:(NSString *)message signRangeList:(NSArray *)signs {
```

- 善用以下特殊注释：

```
// TODO:
// FIXME:
// MARK:
// !!!:
// ???:
```

# 常量

- 尽量使用static声明常量，而不用`#define`

应该
```
static NSString * const AAAboutViewControllerURL = @"aachuxing.com";
static CGFloat const AAImageThumbnailHeight = 50.0;
```
不应该
```
#define CompanyName @"aachuxing.com"  
#define thumbnailHeight 2  
```

在`.h`头文件中声明供其它代码使用的常量时，使用`extern`关键字。也可酌情使用`FOUNDATION_EXTERN`或`UIKIT_EXTERN`等。
```
extern NSString * const AMapSearchErrorDomain;
FOUNDATION_EXTERN NSString * const AMapFoundationVersion;
UIKIT_EXTERN const CGFloat MJRefreshLabelLeftInset;
UIKIT_EXTERN NSString * const MJRefreshKeyPathContentOffset;
```
具体声明在`.m`文件中
```
const CGFloat MJRefreshLabelLeftInset = 25;
NSString *const MJRefreshKeyPathContentOffset = @"contentOffset";
```

# 头文件

保持头文件的精简。在头文件中只引入必须引入的文件，只暴露出给其它代码使用的代码，其余的放到`.m`文件中。

# Protocol

- 不必须实现的函数，应指定为`@optional`。

# 错误与异常

- 只针对第三方库做`@try`、`@catch`。代码中不要使用`@throw`，而使用`NSError`来返回错误。
- 当引用一个返回错误参数的方法时，应该针对返回值做检查，而非错误变量。

应该
```
    NSError *error;
    if (![self trySomethingWithError:&error]) {
        // 处理错误
    }
```
不应该：
```
    NSError *error;
    [self trySomethingWithError:&error];
    if (error) {
        // 处理错误
    }
```

# 其它

- Xcode提示的各种warning，应该尽量消除。
- 推荐使用`CGGeometry.h`的函数，而不推荐直接使用`frame.size.width`等存取rect。如：

```
    CGRectMake()
    CGRectGetMaxX()
    CGRectGetHeight()
    CGSizeEqualToSize()
    CGRectContainsPoint()
```

- 偏向使用字面量，如：

推荐
```
    NSArray *names = @[@"Brian", @"Matt", @"Chris", @"Alex", @"Steve", @"Paul"];
    NSDictionary *productManagers = @{@"iPhone" : @"Kate", @"iPad" : @"Kamal", @"Mobile Web" : @"Bill"};
    NSNumber *shouldUseLiterals = @YES;
    NSNumber *buildingZIPCode = @10018;
```
不推荐
```
    NSArray *names = [NSArray arrayWithObjects:@"Brian", @"Matt", @"Chris", @"Alex", @"Steve", @"Paul", nil];
    NSDictionary *productManagers = [NSDictionary dictionaryWithObjectsAndKeys: @"Kate", @"iPhone", @"Kamal", @"iPad", @"Bill", @"Mobile Web", nil];
    NSNumber *shouldUseLiterals = [NSNumber numberWithBool:YES];
    NSNumber *buildingZIPCode = [NSNumber numberWithInteger:10018];
```
