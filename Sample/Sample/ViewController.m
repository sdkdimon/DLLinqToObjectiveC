//
//  ViewController.m
//  Sample
//
//  Created by dimon on 10/10/2016.
//  Copyright © 2016 dimon. All rights reserved.
//

#import "ViewController.h"
@import DLLinqToObjectiveC;


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *items = @[@(1),@(2),@(3),@(4)];
    
    NSArray *linq_items = [items linq_where:^BOOL(NSNumber *item) {
        return [item integerValue] > 1;
    }];
    
    NSLog(@"linq_items %@",linq_items);
    
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
