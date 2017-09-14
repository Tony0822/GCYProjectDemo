//
//  UIView+GCYAddForRoundedCorner.m
//  GCYDemo
//
//  Created by gewara on 17/6/23.
//  Copyright © 2017年 gewara. All rights reserved.
//

#import "UIView+GCYAddForRoundedCorner.h"

@implementation UIView (GCYAddForRoundedCorner)

- (void)roundedCornerWithRadius:(CGFloat)radius conrnerClolor:(UIColor *)color {
    [self.layer roundedCornerWithRadius:radius conrnerClolor:color];
}

- (void)roundedCornerWithRadius:(CGFloat)radius conrnerClolor:(UIColor *)color corners:(UIRectCorner)corners {
    [self.layer roundedCornerWithRadius:radius conrnerClolor:color corners:corners];
}

- (void)roundedCornerWithRadius:(CGFloat)radius conrnerClolor:(UIColor *)color corners:(UIRectCorner)corners borderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth {
    [self.layer roundedCornerWithRadius:radius conrnerClolor:color corners:corners borderColor:borderColor borderWidth:borderWidth];
}

@end
