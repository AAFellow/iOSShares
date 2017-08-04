//
//  ViewController.m
//  testAf
//
//  Created by 晓磊 on 2017/7/6.
//  Copyright © 2017年 cc. All rights reserved.
//

#import "ViewController.h"
#import "AFHTTPRequestOperation.h"
#import "Student.h"

typedef void(^blk_t)(id obj);
@interface ViewController ()
{
    NSThread *thread ;
}
@property (copy,nonatomic) NSString *name;
@property (strong, nonatomic) Student *stu;
@end
int global_i = 1;

static int static_global_j = 1;
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor=[UIColor whiteColor];
    NSLog(@"xxxxxx");
//    thread = [[NSThread alloc]initWithTarget:self selector:@selector(dotask1) object:nil];
//    [thread start];
//    [self onThread];
    [self bocl];
 
}
-(void)bocl{
    blk_t blk;
    {
        NSMutableArray* arr=[[NSMutableArray alloc] init];
        blk=^(id obj){
            [arr addObject:obj];
            NSLog(@"%d",arr.count);
        };
        
        blk([[NSObject alloc] init]);
        blk([[NSObject alloc] init]);
        blk([[NSObject alloc] init]);
    };
}
//批量异步排列操作
-(void)groupSyn{
    dispatch_queue_t quee=dispatch_queue_create("www.aa.com", DISPATCH_QUEUE_CONCURRENT);
    dispatch_group_t group=dispatch_group_create();
   dispatch_group_async(group, quee, ^{
            NSLog(@"task1");
    
    });
    dispatch_group_async(group, quee, ^{
            NSLog(@"task2");
       
    });
    dispatch_group_wait(group, 10);
    dispatch_group_notify(group, quee, ^{
        NSLog(@"task3");
    });

}

-(void)groupTest{
    dispatch_queue_t quee=dispatch_queue_create("www.aa.com", DISPATCH_QUEUE_CONCURRENT);
    dispatch_group_t group=dispatch_group_create();
    dispatch_group_async(group, quee, ^{
        dispatch_async(quee, ^{
            sleep(2);
            NSLog(@"task1");
        });
    });
    dispatch_group_async(group, quee, ^{
        dispatch_async(quee, ^{
            sleep(2);
            NSLog(@"task2");
        });
    });
    dispatch_group_wait(group, 10);
    dispatch_group_notify(group, quee, ^{
        NSLog(@"task3");
    });
}

-(void)groupTestAsyn{
    dispatch_queue_t quee=dispatch_queue_create("www.aa.com", DISPATCH_QUEUE_CONCURRENT);
    dispatch_group_t group=dispatch_group_create();
    dispatch_group_enter(group);
        dispatch_async(quee, ^{
            sleep(2);
            NSLog(@"task1");
            dispatch_group_leave(group);
        });
   
     dispatch_group_enter(group);
        dispatch_async(quee, ^{
            sleep(2);
            NSLog(@"task2");
            dispatch_group_leave(group);

        });
   
    dispatch_group_notify(group, quee, ^{
        NSLog(@"task3");
    });
}
//方案2 不推荐
-(void)semaphore{
     dispatch_queue_t quee=dispatch_queue_create("www.aa.com", DISPATCH_QUEUE_CONCURRENT);
    //我们传入一个参数0 ，表示没有资源，非0 表示是有资源，这一点需要搞清楚
    dispatch_semaphore_t semaoh = dispatch_semaphore_create(0);
    dispatch_async(quee, ^{
        sleep(2);
        NSLog(@"task1");
    //这个通过相当于 放行操作 执行信号数量+1，这个地方一定触发信号，就会通知wait 函数进行 -1 操作，也就是后面可以继续通行
        
        dispatch_semaphore_signal(semaoh);

    });
    //信号等待 时，资源数 -1  阻塞当前线程
    dispatch_semaphore_wait(semaoh, DISPATCH_TIME_FOREVER);
    dispatch_async(quee, ^{
        sleep(2);
        NSLog(@"task2");
        //这个通过相当于 放行操作 执行信号数量+1，这个地方一定触发信号，就会通知wait 函数进行 -1 操作，也就是后面可以继续通行
        
        dispatch_semaphore_signal(semaoh);
        
    });
    dispatch_semaphore_wait(semaoh, DISPATCH_TIME_FOREVER);
    dispatch_async(quee, ^{
        NSLog(@"task3");
        
    });

}
//设置依赖
-(void)append{
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    NSBlockOperation *p1 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"task1");
    }];
    NSBlockOperation *p2 = [NSBlockOperation blockOperationWithBlock:^{
       // sleep(2);
        NSLog(@"task2");
    }];
    NSBlockOperation *p3 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"task3");
    }];
    [p3 addDependency:p1];
    [p3 addDependency:p2];
    // waitUntilFinished是否阻塞当前线程
    [queue addOperations:@[p1,p2,p3] waitUntilFinished:NO];
    
    // 如果是NO,那么这行打印就是随机的, 反之就是等A,B,C都打印完之后才执行
    NSLog(@"HAHA");
}
//使用AFN中的batchOfRequestOperations
-(void)afBat{
    AFHTTPRequestOperation *queue = [[AFHTTPRequestOperation alloc] initWithRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.baidu.com"]]];
    [queue setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
      
        NSLog(@"task1");
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"task1");
    }];
    [queue resume];
    
    AFHTTPRequestOperation *queue2 = [[AFHTTPRequestOperation alloc] initWithRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.baidu.com"]]];
    [queue2 setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"task2");
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"task2");
    }];
    [queue2 resume];
    
    NSArray *operations = [AFHTTPRequestOperation batchOfRequestOperations:@[queue, queue2] progressBlock:^(NSUInteger numberOfFinishedOperations, NSUInteger totalNumberOfOperations) {
        NSLog(@"%ld/%ld", numberOfFinishedOperations, totalNumberOfOperations);
    } completionBlock:^(NSArray *operations) {
        NSLog(@"task3");
    }];
    
    [[NSOperationQueue mainQueue] addOperations:operations waitUntilFinished:NO];
}
#pragma mark Block捕获和持有问题
-(void)bolock{
    static int static_k = 1;
    int val = 1;
    
    void (^myBlock)(void) = ^{
        global_i ++;
        static_global_j ++;
        static_k ++;
        NSLog(@"Block中 global_i = %d,static_global_j = %d,static_k = %d,val = %d",global_i,static_global_j,static_k,val);
    };
    
    global_i ++;
    static_global_j ++;
    static_k ++;
    val ++;
    NSLog(@"Block外 global_i = %d,static_global_j = %d,static_k = %d,val = %d",global_i,static_global_j,static_k,val);
    
    myBlock();

}
//自动变量是以值传递方式传递到Block的构造函数里面去的。Block只捕获Block中会用到的变量。由于只捕获了自动变量的值，并非内存地址，所以Block内部不能改变自动变量的值。Block捕获的外部变量可以改变值的是静态变量，静态全局变量，全局变量。http://www.jianshu.com/p/ee9756f3d5f6
//静态全局变量，全局变量由于作用域的原因，于是可以直接在Block里面被改变。他们也都存储在全局区。
//静态变量传递给Block是内存地址值，所以能在Block里面直接改变值。
//总结一下在Block中改变变量值有2种方式，一是传递内存地址指针到Block中(比如对象)，二是改变存储区方式(__block)。
//ARC下，Block中引用id类型的数据有没有__block都一样都是retain，而对于基础变量而言，没有的话无法修改变量值，有的话就是修改其结构体令其内部的forwarding指针指向拷贝后的地址达到值的修改。
/*
OC中，一般Block就分为以下3种，_NSConcreteStackBlock，_NSConcreteMallocBlock，_NSConcreteGlobalBlock。

先来说明一下3者的区别。

1.从捕获外部变量的角度上来看

_NSConcreteStackBlock：
只用到外部局部变量、成员属性变量，且没有强指针引用的block都是StackBlock。
StackBlock的生命周期由系统控制的，一旦返回之后，就被系统销毁了。

_NSConcreteMallocBlock：
有强指针引用或copy修饰的成员属性引用的block会被复制一份到堆中成为MallocBlock，没有强指针引用即销毁，生命周期由程序员控制

_NSConcreteGlobalBlock：
没有用到外界变量或只用到全局变量、静态变量的block为_NSConcreteGlobalBlock，生命周期从创建到应用程序结束。
 2.从持有对象的角度上来看：
 
 _NSConcreteStackBlock是不持有对象的
 _NSConcreteMallocBlock是持有对象的。
 _NSConcreteGlobalBlock也不持有对象
 。在ARC环境下，编译器会自动的判断，把Block自动的从栈copy到堆。比如当Block作为函数返回值的时候，肯定会copy到堆上。
    ARC环境下，一旦Block赋值就会触发copy，__block就会copy到堆上，Block也是__NSMallocBlock。
*/

#pragma mark _Block原理
-(void)block_block{
    __block int i = 0;
    NSLog(@"%p",&i);
    
    void (^myBlock)(void) = ^{
        i ++;
        NSLog(@"Block 里面的%p %d",&i,i);
    };
    
    void (^myBlock1)(void) = ^{
         i ++;
        NSLog(@"Block 里面的%p %d",&i,i);
    };
    NSLog(@"%@",myBlock);
    
    myBlock();
    myBlock1();
}

-(void)leak1{
    Student *student = [[Student alloc]init];
    student.name = @"Hello World";
    
    student.study = ^{
        NSLog(@"my name is = %@",student.name);
    };
}
-(void)student{
    Student *student = [[Student alloc]init];
    student.name = @"Hello World";
    
    student.study = ^(NSString * name){
        NSLog(@"my name is = %@",name);
    };
    student.study(student.name);
}

-(void)leak2{
    Student *student = [[Student alloc]init];
    
    __block Student *stu = student;
    student.name = @"Hello World";
    student.study = ^{
        NSLog(@"my name is = %@",stu.name);
        stu = nil;
    };
}



/*
 struct __Block_byref_i_0 {
 void *__isa;
 __Block_byref_i_0 *__forwarding;
 int __flags;
 int __size;
 int i;
 };
 //并不会出现内存泄露。原因是因为，student是作为形参传递进block的，block并不会捕获形参到block内部进行持有。所以肯定不会造成循环引用。
 //由于没有执行study这个block，现在student持有该block，block持有__block变量，__block变量又持有student对象。3者形成了环，导致了循环引用了。
 从源码我们能发现，带有 __block的变量也被转化成了一个结构体__Block_byref_i_0,这个结构体有5个成员变量。第一个是isa指针，第二个是指向自身类型的__forwarding指针，第三个是一个标记flag，第四个是它的大小，第五个是变量值，名字和变量名同名。__forwarding指针初始化传递的是自己的地址。地址不同__block现在也在堆上了。出现这个不同的原因在于这里把Block拷贝到了堆上。，堆上的Block会持有对象。我们把Block通过copy到了堆上，堆上也会重新复制一份Block，并且该Block也会继续持有该__block。当Block释放的时候，__block没有被任何对象引用，也会被释放销毁。__forwarding指针这里的作用就是针对堆的Block，把原来__forwarding指针指向自己，换成指向_NSConcreteMallocBlock上复制之后的__block自己。然后堆上的变量的__forwarding再指向自己。这样不管__block怎么复制到堆上，还是在栈上，都可以通过(i->__forwarding->i)来访问到变量值。
 */
//http://www.jianshu.com/p/911549ae4bf8
#pragma mark runloop线程保活
-(void)dotask1{
     NSLog(@"%@",[[NSRunLoop currentRunLoop]currentMode]);
    NSLog(@"task1");
//    NSRunLoop *runLoop = [NSRunLoop currentRunLoop];
//    [runLoop addPort:[NSMachPort port] forMode:NSDefaultRunLoopMode];
//    [runLoop run];
}
-(void)onThread{
    sleep(2);
    [self performSelector:@selector(dotask2) onThread:thread withObject:nil waitUntilDone:NO];
}
-(void)dotask2{
    NSLog(@"%@",[[NSRunLoop currentRunLoop]currentMode]);
    NSLog(@"task2");
}
//nstimer 使timer不受动画影响
-(void)addtimer{
   __block int i=0;
    NSTimer* time=[NSTimer timerWithTimeInterval:1 repeats:YES block:^(NSTimer * _Nonnull timer) {
        NSLog(@"%d",i++);
    }];
     NSRunLoop *runLoop = [NSRunLoop currentRunLoop];
    [runLoop addTimer:time forMode:NSRunLoopCommonModes];
    [time fire];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
