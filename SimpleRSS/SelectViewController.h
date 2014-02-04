//
//  SelectViewController.h
//  SimpleRSS
//
//  Created by kozyty on 2014/02/04.
//  Copyright (c) 2014年 shuichi.wada. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SelectViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *selectCollectionView;
@property (strong, nonatomic) NSArray *items;

@end