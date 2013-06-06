//
//  CoverflowCell.m
//  AppStore
//
//  Created by Shawn Allen on 10/30/12.
//  Copyright (c) 2012 Pearson, LLC. All rights reserved.
//

#import "CoverflowCell.h"
#import "Cell.h"
#import "LineLayout.h"
#import <QuartzCore/QuartzCore.h>

@interface CoverflowCell () <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic) UICollectionView *collectionView;

@end

@implementation CoverflowCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        LineLayout *flowLayout = [[LineLayout alloc] init];
        
        self.collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:flowLayout];
        self.collectionView.backgroundColor = [UIColor lightGrayColor];
        self.collectionView.delegate = self;
        self.collectionView.dataSource = self;
        self.collectionView.showsHorizontalScrollIndicator = NO;
        [self.contentView addSubview:self.collectionView];
        
        self.backgroundColor = [UIColor scrollViewTexturedBackgroundColor];
        self.opaque = YES;
        
        [self.collectionView registerClass:[Cell class] forCellWithReuseIdentifier:@"Cell"];
    }
    return self;
}

#pragma mark -
#pragma mark UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 13;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    Cell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    
    cell.backgroundColor = [[UIColor purpleColor] colorWithAlphaComponent:0.55];
    cell.layer.borderWidth = 2.0f;
    cell.layer.cornerRadius = 8.0f;
    cell.layer.borderColor = [[UIColor grayColor] CGColor];
    cell.label.text =  [NSString stringWithFormat:@"%d", indexPath.item];
    return cell;
}

@end
