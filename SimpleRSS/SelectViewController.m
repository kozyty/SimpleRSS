//
//  SelectViewController.m
//  SimpleRSS
//
//  Created by kozyty on 2014/02/04.
//  Copyright (c) 2014年 shuichi.wada. All rights reserved.
//

#import "SelectViewController.h"
#import "DetailViewController.h"


@interface SelectViewController ()

@end

@implementation SelectViewController
@synthesize selectCollectionView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    [selectCollectionView setDataSource:self];
    [selectCollectionView setDelegate:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -collection view delegate

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell;
    cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"collectionCell" forIndexPath:indexPath];
    
    NSDictionary *item = [self.items objectAtIndex:indexPath.row];
    UILabel *label = (UILabel *)[cell viewWithTag:2];
    UIImageView *image = (UIImageView *)[cell viewWithTag:1];

    
    label.text = [item objectForKey:@"title"];
    [image setImageWithURL:[NSURL URLWithString:[item objectForKey:@"image"]] placeholderImage:[UIImage imageNamed:@"placeholder_icon2"]];

    return cell;
    
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"Click %s", __func__);
    
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"detailView"]) {
        DetailViewController *detailViewController = (DetailViewController *)[segue destinationViewController];
        NSDictionary *item = [self.items objectAtIndex:[self.selectCollectionView indexPathForCell:sender].row];
        detailViewController.recipe = item;
    }
}

@end
