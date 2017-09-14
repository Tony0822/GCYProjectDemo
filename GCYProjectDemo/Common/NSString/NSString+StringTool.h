//
//  NSString+StringTool.h
//  GCYDemo
//
//  Created by gewara on 17/6/30.
//  Copyright © 2017年 gewara. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (StringTool)

-(CGSize)stringSizeWithFont:(UIFont *)font widthLimit:(CGFloat)widthLimit heightLimit:(CGFloat)heightLimit;

+ (CGFloat)getWidthWithString:(NSString *)string font:(UIFont *)font;
@end
