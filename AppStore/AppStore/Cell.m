//
//  Cell.m
//  AppStore
//
//  Created by Shawn Allen on 10/30/12.
//  Copyright (c) 2012 Pearson, LLC. All rights reserved.
//

#import "Cell.h"

@implementation Cell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.label = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0, self.bounds.size.width, self.bounds.size.height)];
        self.label.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
        self.label.textAlignment = NSTextAlignmentCenter;
        self.label.font = [UIFont boldSystemFontOfSize:32.0];
        self.label.backgroundColor = [UIColor clearColor];
        self.label.textColor = [UIColor blackColor];
        [self.contentView addSubview:self.label];
        
        self.backgroundColor = [UIColor lightGrayColor];
    }
    return self;
}

@end
