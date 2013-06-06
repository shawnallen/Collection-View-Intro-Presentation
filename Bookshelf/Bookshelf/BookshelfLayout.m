//
//  BookshelfLayout.m
//  Bookshelf
//
//  Created by Shawn Allen on 10/10/12.
//  Copyright (c) 2012 Pearson, LLC. All rights reserved.
//

#import "BookshelfLayout.h"
#import "DecorationView.h"

@interface BookshelfLayout ()

@property (nonatomic) NSDictionary *decorationViewLayoutAttributes;

@end

@implementation BookshelfLayout

#pragma mark -
#pragma mark UICollectionViewLayout

- (void)prepareLayout;
{
    [super prepareLayout];

    CGSize layoutSize = self.collectionView.bounds.size;
    NSMutableDictionary *latestDecorationViewLayoutAttributes = [[NSMutableDictionary alloc] init];
    
    for (NSInteger currentThreshold = 0; currentThreshold < layoutSize.height + DecorationView.defaultHeight; currentThreshold += DecorationView.defaultHeight) {
        NSInteger currentRow = currentThreshold / DecorationView.defaultHeight;
        UICollectionViewLayoutAttributes *rowLayoutAttributes = [UICollectionViewLayoutAttributes layoutAttributesForDecorationViewOfKind:@"BookshelfDecorationView" withIndexPath:[NSIndexPath indexPathForRow:currentRow inSection:0]];
        rowLayoutAttributes.zIndex = -1;
        rowLayoutAttributes.frame = CGRectMake(0, currentThreshold, layoutSize.width, DecorationView.defaultHeight);
        latestDecorationViewLayoutAttributes[rowLayoutAttributes.indexPath] = rowLayoutAttributes;
    }
    self.decorationViewLayoutAttributes = latestDecorationViewLayoutAttributes;
}

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSMutableArray *allLayoutAttributes = [[super layoutAttributesForElementsInRect:rect] mutableCopy];
    [allLayoutAttributes addObjectsFromArray:[self.decorationViewLayoutAttributes allValues]];
    return allLayoutAttributes;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForDecorationViewOfKind:(NSString *)decorationViewKind atIndexPath:(NSIndexPath *)indexPath;
{
    return self.decorationViewLayoutAttributes[indexPath];
}

#pragma mark -
#pragma mark NSObject

- (id)init
{
    self = [super init];
    if (self) {
        [self registerClass:[DecorationView class] forDecorationViewOfKind:@"BookshelfDecorationView"];
        self.itemSize = CGSizeMake(100, 100);
        self.sectionInset = UIEdgeInsetsMake(10, 10, 0, 10);
    }
    return self;
}
@end
