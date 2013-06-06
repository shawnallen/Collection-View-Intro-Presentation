//
//  ViewController.m
//  Bookshelf
//
//  Created by Shawn Allen on 10/10/12.
//  Copyright (c) 2012 Pearson, LLC. All rights reserved.
//

#import "ViewController.h"
#import "Cell.h"

@interface ViewController ()

@end

@implementation ViewController

#pragma mark -
#pragma mark UIViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.collectionView registerClass:[Cell class] forCellWithReuseIdentifier:@"Cell"];
}

#pragma mark -
#pragma mark UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 66;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
}

@end
