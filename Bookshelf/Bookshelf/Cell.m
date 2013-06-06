//
//  Cell.m
//  Bookshelf
//
//  Created by Shawn Allen on 10/10/12.
//  Copyright (c) 2012 Pearson, LLC. All rights reserved.
//

#import "Cell.h"

@implementation Cell

#pragma mark -
#pragma mark UIView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self)
        self.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.75f];
    
    return self;
}

@end
