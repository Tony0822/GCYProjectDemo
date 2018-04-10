//
//  GCYAlertController.m
//  GCYProjectDemo
//
//  Created by TonyYang on 2017/10/15.
//  Copyright © 2017年 TonyYang. All rights reserved.
//

#import "GCYAlertController.h"

// toast 默认显示时间
static NSTimeInterval const GCYAlertShowDurationDefault = 1.0f;

#pragma mark GCYAlertActionModel

@interface GCYAlertActionModel : NSObject
@property (nonatomic, copy) NSString *title;
@property (nonatomic, assign) UIAlertActionStyle style;

@end

@implementation GCYAlertActionModel
- (instancetype)init {
    self = [super init];
    if (self) {
        self.title = @"";
        self.style = UIAlertActionStyleDefault;
    }
    return self;
}
@end

#pragma mark GCYAlertController

typedef void (^GCYAlertActionConfig)(GCYAlertActionBlock actionBlock);

@interface GCYAlertController ()

@property (nonatomic, strong) NSMutableArray <GCYAlertActionModel *> *gcy_alertActionArray;
@property (nonatomic, assign) BOOL gcy_setAlertAnimated;

- (GCYAlertActionConfig)alertActionsConfig;

@end


@implementation GCYAlertController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark Private
- (GCYAlertActionConfig)alertActionsConfig {
    return ^(GCYAlertActionBlock actionBlock) {
        if (self.gcy_alertActionArray.count > 0 ) {
            // 创建action
            __weak typeof(self) bself = self;
            [self.gcy_alertActionArray enumerateObjectsUsingBlock:^(GCYAlertActionModel * actionModel, NSUInteger idx, BOOL * _Nonnull stop) {
                UIAlertAction *alertAction = [UIAlertAction actionWithTitle:actionModel.title style:actionModel.style handler:^(UIAlertAction * _Nonnull action) {
                    __strong typeof(bself) strongSelf = bself;
                    if (actionBlock) {
                        actionBlock(idx, action, strongSelf);
                    }
                }];
                [self addAction:alertAction];
            }];
        } else {
//            NSTimeInterval duration = self.
        }
        
    };
}

- (NSMutableArray<GCYAlertActionModel *> *)gcy_alertActionArray {
    if (_gcy_alertActionArray == nil) {
        _gcy_alertActionArray = [NSMutableArray array];
    }
    return _gcy_alertActionArray;
}


























@end
