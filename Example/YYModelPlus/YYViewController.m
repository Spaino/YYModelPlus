//
//  YYViewController.m
//  YYModelPlus
//
//  Created by Spaino on 06/14/2019.
//  Copyright (c) 2019 Spaino. All rights reserved.
//

#import "YYViewController.h"
#import "YYWeiboModel.h"

@interface YYViewController ()
@property (strong, nonatomic) NSDictionary *weiboJson;
@end

@implementation YYViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    /// get json data
    NSString *path = [[NSBundle mainBundle] pathForResource:@"weibo" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    self.weiboJson = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    
    [self yyModelDeserializationAction];
}

- (void)yyModelDeserializationAction {
    /// Benchmark
    int count = 1000;
    NSTimeInterval begin, end;
    begin = CACurrentMediaTime();
    @autoreleasepool {
        for (int i = 0; i < count; i++) {
            [YYWeiboStatus yy_modelWithJSON:self.weiboJson];
        }
    }
    end = CACurrentMediaTime();
    printf("YYModel:         %8.2f   ", (end - begin) * 1000);
    
    
    YYWeiboStatus *feed = [YYWeiboStatus yy_modelWithJSON:self.weiboJson];
    begin = CACurrentMediaTime();
    @autoreleasepool {
        for (int i = 0; i < count; i++) {
            [feed yy_modelToJSONObject];
        }
    }
    end = CACurrentMediaTime();
    if ([NSJSONSerialization isValidJSONObject:[feed yy_modelToJSONObject]]) {
        printf("%8.2f   ", (end - begin) * 1000);
    } else {
        printf("   error   ");
    }
    
    begin = CACurrentMediaTime();
    @autoreleasepool {
        for (int i = 0; i < count; i++) {
            [NSKeyedArchiver archivedDataWithRootObject:feed];
        }
    }
    end = CACurrentMediaTime();
    printf("%8.2f\n", (end - begin) * 1000);
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
