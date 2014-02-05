//
//  DetailViewController.m
//  SimpleRSS
//
//  Created by kozyty on 2014/01/28.
//  Copyright (c) 2014年 kozyty. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
- (void)configureView;
@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
}

- (void)configureView
{
    self.recipeTitle.text   = [self.recipe objectForKey:@"title"];
    self.recipeBody.text = [self.recipe objectForKey:@"body"];
//    self.recipeAuthor.text = [self.recipe objectForKey:@"author"];
    [self.recipeImage setImageWithURL:[NSURL URLWithString:[self.recipe objectForKey:@"image"]] placeholderImage:[UIImage imageNamed:@"placeholder_icon2"]];



}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
