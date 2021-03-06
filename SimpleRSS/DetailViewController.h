//
//  DetailViewController.h
//  SimpleRSS
//
//  Created by kozyty on 2014/01/28.
//  Copyright (c) 2014年 kozyty. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (strong, nonatomic) NSDictionary *recipe;
@property (weak, nonatomic) IBOutlet UILabel *recipeBody;
@property (weak, nonatomic) IBOutlet UILabel *recipeTitle;
@property (weak, nonatomic) IBOutlet UIImageView *recipeImage;

@end
