//
//  BannerCell.m
//  AppStore
//
//  Created by Shawn Allen on 10/30/12.
//  Copyright (c) 2012 Pearson, LLC. All rights reserved.
//

#import "BannerCell.h"
#import "Cell.h"
#import <QuartzCore/QuartzCore.h>

@interface BannerCell () <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic) UICollectionView *collectionView;

@end

@implementation BannerCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        flowLayout.itemSize = CGSizeMake(225, frame.size.height * 0.85);
        flowLayout.sectionInset = UIEdgeInsetsMake(0, 10, 0, 10);
        flowLayout.minimumLineSpacing = 60;
        
        self.collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:flowLayout];
        self.collectionView.backgroundColor = [UIColor lightGrayColor];
        self.collectionView.delegate = self;
        self.collectionView.dataSource = self;
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
    return 12;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    Cell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    
    cell.backgroundColor = [[UIColor purpleColor] colorWithAlphaComponent:0.55];
    cell.layer.borderWidth = 2.0f;
    cell.layer.cornerRadius = 4.0f;
    cell.layer.borderColor = [[UIColor grayColor] CGColor];
    cell.label.text =  [NSString stringWithFormat:@"%d", indexPath.item];
    return cell;
}

@end
