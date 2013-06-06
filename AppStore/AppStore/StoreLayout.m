//
//  StoreLayout.m
//  AppStore
//
//  Created by Shawn Allen on 10/30/12.
//  Copyright (c) 2012 Pearson, LLC. All rights reserved.
//

#import "StoreLayout.h"

@implementation StoreLayout

#pragma mark -
#pragma mark NSObject

- (id)init
{
    self = [super init];
    if (self) {
        self.minimumLineSpacing = 1.0f;
    }
    return self;
}

@end
