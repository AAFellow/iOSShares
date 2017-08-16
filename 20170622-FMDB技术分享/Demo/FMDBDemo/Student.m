//
//  Student.m
//  FMDBDemo
//
//  Created by fuYanan on 17/6/22.
//  Copyright © 2017年 fuYanan. All rights reserved.
//

#import "Student.h"

@implementation Student
//解档
-(id)initWithCoder:(NSCoder *)aDecoder{
    if (self=[super init]) {
        self.name=[aDecoder decodeObjectForKey:@"name"];
        self.name=[aDecoder decodeObjectForKey:@"age"];
    }
    return self;
}
//归档
-(void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeInteger:self.age forKey:@"age"];
}
@end
