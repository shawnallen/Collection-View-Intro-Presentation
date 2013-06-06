//
//  CategoryCell.m
//  AppStore
//
//  Created by Shawn Allen on 10/30/12.
//  Copyright (c) 2012 Pearson, LLC. All rights reserved.
//

#import "CategoryCell.h"
#import "Cell.h"
#import <QuartzCore/QuartzCore.h>

@interface CategoryCell () <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic) UICollectionView *collectionView;
@property (nonatomic) UILabel *categoryLabel;

@end

@implementation CategoryCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        CGRect labelFrame;
        CGRect collectionViewFrame;
        
        CGRectDivide(self.bounds, &labelFrame, &collectionViewFrame, 26, CGRectMinYEdge);
        self.categoryLabel = [[UILabel alloc] initWithFrame:labelFrame];
        self.categoryLabel.backgroundColor = [UIColor clearColor];
        self.categoryLabel.text = @"Test Category";
        self.categoryLabel.textColor = [UIColor grayColor];
        self.categoryLabel.opaque = NO;
        
        CGFloat cellSize = collectionViewFrame.size.height * 0.85;
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        flowLayout.itemSize = CGSizeMake(cellSize, cellSize);
        
        self.collectionView = [[UICollectionView alloc] initWithFrame:collectionViewFrame collectionViewLayout:flowLayout];
        self.collectionView.backgroundColor = [UIColor clearColor];
        self.collectionView.delegate = self;
        self.collectionView.dataSource = self;
        [self.contentView addSubview:self.collectionView];
        [self.contentView addSubview:self.categoryLabel];
        
        self.backgroundColor = [UIColor whiteColor];
        self.opaque = YES;
        
        [self.collectionView registerClass:[Cell class] forCellWithReuseIdentifier:@"Cell"];
    }
    return self;
}

#pragma mark -
#pragma mark UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 12;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    Cell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor greenColor];
    cell.layer.borderWidth = 2.0f;
    cell.layer.cornerRadius = 4.0f;
    cell.layer.borderColor = [[UIColor grayColor] CGColor];
    cell.label.text =  [NSString stringWithFormat:@"%d", indexPath.item];
    return cell;
}

@end
