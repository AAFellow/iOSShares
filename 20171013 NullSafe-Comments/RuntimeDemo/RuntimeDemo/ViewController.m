//
//  ViewController.m
//  NullDemo
//
//  Created by aayongche on 2017/10/11.
//  Copyright © 2017年 AA租车. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>

@interface Student : NSObject

- (void)say:(NSString *)saySomething;

@end

@implementation Student

- (void)say:(NSString *)saySomething {
    NSLog(@"Student Say :%@", saySomething);
}

@end

void dynamicMethodIMP(id self, SEL _cmd, NSString *saySomething) {
    NSLog(@"dynamicMethodIMP :%@", saySomething);
}

@interface Teacher : NSObject

- (void)hello;

- (void)say:(NSString *)saySomething;

@end

@implementation Teacher

- (void)hello {
    NSLog(@"Teacher Hello");
}
//经测试，现在这个BOOL值不论返回YES还是NO，在没有为类动态增加方法的前提下都会走到消息转发流程当中。如果类中动态增加了方法，那么不管返回YES还是NO都不会进入消息转发流程，在这里我想内部应该是在调用class_addMethod的时候会重新遍历一下类中的方法，这个时候已经动态新增了方法所以就可以运行了，不需要走消息转发流程了。
+ (BOOL)resolveInstanceMethod:(SEL)sel {
    NSLog(@"resolveInstanceMethod called : %@",NSStringFromSelector(sel));
    if (sel == @selector(say:)) {
        // v : void       @:self   :_cmd   @:NSString
        class_addMethod([self class], sel, (IMP)dynamicMethodIMP, "v@:@");
        return YES;
    }
    return [super resolveInstanceMethod:sel];
}

- (id)forwardingTargetForSelector:(SEL)aSelector {
    NSLog(@"forwardingTargetForSelector called : %@",NSStringFromSelector(aSelector));
    if (aSelector == @selector(say:)) {
        return [Student new];
    }
    return [super forwardingTargetForSelector:aSelector];
}
//
//- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
//    NSLog(@"methodSignatureForSelector called : %@",NSStringFromSelector(aSelector));
//    NSMethodSignature *methodSignature = [super methodSignatureForSelector:aSelector];
//    if (!methodSignature) {
//        if (aSelector == @selector(say:)) {
//            methodSignature = [NSMethodSignature signatureWithObjCTypes:"v@:@"];
//        }
//    }
//    return methodSignature;
//}
//
//- (void)forwardInvocation:(NSInvocation *)anInvocation {
//    NSLog(@"forwardInvocation called : %@",NSStringFromSelector(anInvocation.selector));
//    Student *student = [Student new];
//    if ([student respondsToSelector:anInvocation.selector]) {
//        [anInvocation invokeWithTarget:student];
//    }
//}

@end

@interface ViewController ()

- (void)hello;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    Teacher *teacher = [Teacher new];

//    @{
//      @"cancel_cause" : @"fsfs",
//      @"cancel_note" : [NSNull null]
//      };

    [((NSDictionary *)[NSNull null]) objectForKey:@"3232"];
    [teacher hello];
    [teacher say:@"Teacher Stand"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
