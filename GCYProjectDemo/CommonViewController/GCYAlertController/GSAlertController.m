////
////  GSAlertController.m
////  GCYProjectDemo
////
////  Created by TonyYang on 2017/10/29.
////  Copyright © 2017年 TonyYang. All rights reserved.
////
//
//#import "GSAlertController.h"
//static NSTimeInterval const gsAlertShowDurationDefault = 1.0f;
//
//@interface GSAlertActionModel : NSObject
//@property (nonatomic, copy) NSString *title;
//@property (nonatomic, assign) UIAlertActionStyle style;
//@end
//@implementation GSAlertActionModel
//- (instancetype)init {
//    self = [super init];
//    if (self) {
//        self.title = @"";
//        self.style = UIAlertActionStyleDefault;
//    }
//    return self;
//}
//@end
//
//
//typedef void (^GSAlertActionConfig)(gsAlertActionBlock gsAlertActionBlock);
//@interface GSAlertController ()
//
//@property (nonatomic, strong) NSMutableArray <GSAlertActionModel *> *alertActionArray;
//
///**
// 是否操作动画
// */
//@property (nonatomic, assign) BOOL setAlertAnimated;
//- (GSAlertActionConfig)alertActionConfig;
//@end
//
//@implementation GSAlertController
//
//- (void)viewDidLoad {
//    [super viewDidLoad];
//}
//
//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//}
//- (void)viewDidDisappear:(BOOL)animated {
//    [super viewDidDisappear:animated];
//    if (self.alertDidDismiss) {
//        self.alertDidDismiss();
//    }
//}
//- (void)dealloc {
//    
//}
//
//- (NSMutableArray<GSAlertActionModel *> *)alertActionArray {
//    if (_alertActionArray == nil) {
//        _alertActionArray = [NSMutableArray array];
//    }
//    return _alertActionArray;
//}
//- (GSAlertActionConfig)alertActionConfig {
//    return ^(gsAlertActionBlock actionBlock) {
//        if (self.alertActionArray.count > 0) {
//            __weak typeof(self) weakSelf = self;
//            [self.alertActionArray enumerateObjectsUsingBlock:^(GSAlertActionModel * actionModel, NSUInteger idx, BOOL * _Nonnull stop) {
//                UIAlertAction *alertAction = [UIAlertAction actionWithTitle:actionModel.title style:actionModel.style handler:^(UIAlertAction * _Nonnull action) {
//                    __strong typeof(weakSelf)strongSelf = weakSelf;
//                    if (actionBlock) {
//                        actionBlock(idx, action, strongSelf);
//                    }
//                }];
//                [self addAction:alertAction];
//            }];
//        } else {
//            NSTimeInterval duration = self.toastStyleDuration >0 ?self.toastStyleDuration : gsAlertShowDurationDefault;
//            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(duration * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//                [self dismissViewControllerAnimated:!(self.setAlertAnimated) completion:NULL];
//            });
//        }
//        
//    };
//}
//- (instancetype)initAlertControllerWithTitle:(NSString *)title message:(NSString *)message preferredStyle:(UIAlertControllerStyle)preferredStyle {
//    if (!(title.length > 0) && (message.length > 0) && (preferredStyle == UIAlertControllerStyleAlert)) {
//        title = @"";
//    }
//}
//@end

