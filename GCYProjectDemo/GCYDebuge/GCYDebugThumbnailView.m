//
//  GCYDebugThumbnailView.m
//  GCYProjectDemo
//
//  Created by gaochongyang on 2018/4/24.
//  Copyright © 2018年 TonyYang. All rights reserved.
//

#import "GCYDebugThumbnailView.h"

@implementation GCYDebugThumbnailView

- (id)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame])
    {
        self.backgroundColor = [UIColor blueColor];
        
        _tipsLabel = [[UILabel alloc] initWithFrame:self.bounds];
        _tipsLabel.font = [UIFont systemFontOfSize:12];
        _tipsLabel.numberOfLines = 0;
        _tipsLabel.backgroundColor = [UIColor redColor];
        [self addSubview:_tipsLabel];
        
        _tipsLabel.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    }
    
    return self;
}

@end
