//
//  ViewController.m
//  AppStore
//
//  Created by Shawn Allen on 10/30/12.
//  Copyright (c) 2012 Pearson, LLC. All rights reserved.
//

#import "ViewController.h"
#import "CategoryCell.h"
#import "BannerCell.h"
#import "CoverflowCell.h"

@implementation ViewController

#pragma mark -
#pragma mark UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath;
{
    if (indexPath.item == 0)
        return CGSizeMake(CGRectGetWidth(collectionView.bounds), 300);
    
    if (indexPath.item % 2 != 0)
        return CGSizeMake(CGRectGetWidth(collectionView.bounds), 200);
    else
        return CGSizeMake(CGRectGetWidth(collectionView.bounds), 150);
}

#pragma mark -
#pragma mark UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 6;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.item == 0)
        return [collectionView dequeueReusableCellWithReuseIdentifier:@"CoverflowCell" forIndexPath:indexPath];
    
    if (indexPath.item % 2 != 0)
        return [collectionView dequeueReusableCellWithReuseIdentifier:@"CategoryCell" forIndexPath:indexPath];
    else
        return [collectionView dequeueReusableCellWithReuseIdentifier:@"BannerCell" forIndexPath:indexPath];
}

#pragma mark -
#pragma mark UIViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.collectionView registerClass:[BannerCell class] forCellWithReuseIdentifier:@"BannerCell"];
    [self.collectionView registerClass:[CategoryCell class] forCellWithReuseIdentifier:@"CategoryCell"];
    [self.collectionView registerClass:[CoverflowCell class]forCellWithReuseIdentifier:@"CoverflowCell"];
}

- (BOOL)shouldAutorotate;
{
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationPortrait | UIInterfaceOrientationPortraitUpsideDown;
}

@end
