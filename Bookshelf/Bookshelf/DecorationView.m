//
//  DecorationView.m
//  Bookshelf
//
//  Created by Shawn Allen on 10/10/12.
//  Copyright (c) 2012 Pearson, LLC. All rights reserved.
//

#import "DecorationView.h"
#import <CoreGraphics/CoreGraphics.h>

@interface DecorationView ()

@property (nonatomic) UIImageView *backgroundView;

@end

@implementation DecorationView

#pragma mark -
#pragma mark API

+ (NSInteger)defaultHeight;
{
    return 256;
}

#pragma mark -
#pragma mark UIView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];

    if (self) {
        self.backgroundView = [[UIImageView alloc] init];
        self.backgroundView.opaque = YES;
        self.backgroundView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        self.backgroundView.frame = self.bounds;
        [self addSubview:self.backgroundView];
    }

    return self;
}

#pragma mark -
#pragma mark UICollectionReusableView

- (void)applyLayoutAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes
{
    if (layoutAttributes.indexPath.row % 2 == 0)
        self.backgroundView.image = [UIImage imageNamed:@"woodDecorationEven"];
    else
        self.backgroundView.image = [UIImage imageNamed:@"woodDecorationOdd"];
}

@end
