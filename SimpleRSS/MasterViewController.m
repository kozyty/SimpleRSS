//
//  MasterViewController.m
//  SimpleRSS
//
//  Created by shuichi.wada on 2014/01/28.
//  Copyright (c) 2014年 shuichi.wada. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "SelectViewController.h"
#import "ImageSizeFixedCell.h"

@implementation MasterViewController

- (void)awakeFromNib
{
    [super awakeFromNib];
    // 空の配列を用意
    self.items = [NSArray array];
    self.tableView.dataSource = self;
    [self requestRSS];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.items count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifer = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifer];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifer];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        NSLog(@"%s log...", __func__);
    }
    
//    [self.tableView registerNib:[UINib nibWithNibName:@"Cell" bundle:nil] forCellReuseIdentifier:@"Cell"];

    // TODO: http://rakuishi.com/archives/2994
    NSDictionary *item = [self.items objectAtIndex:indexPath.row];
    cell.textLabel.text = [item objectForKey:@"title"];
    cell.detailTextLabel.text = [item objectForKey:@"body"];
    
//    [cell.imageView setImageWithURL:[NSURL URLWithString:[item objectForKey:@"image"]]];
    [cell.imageView setImageWithURL:[NSURL URLWithString:[item objectForKey:@"image"]] placeholderImage:[UIImage imageNamed:@"placeholder_icon2"]];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self tableView:self.tableView cellForRowAtIndexPath:indexPath];
    CGSize bounds = CGSizeMake(self.tableView.frame.size.width, self.tableView.frame.size.height);
    UIFont *font = cell.textLabel.font;
    UIFont *detailFont = cell.detailTextLabel.font;
    
    // 文字列全体のサイズを取得
    CGSize size;
    CGSize detailSize;
    
    if ([NSString instancesRespondToSelector:@selector(boundingRectWithSize:options:attributes:context:)]) {
        CGRect rect = [cell.textLabel.text boundingRectWithSize:bounds
                                                        options:NSStringDrawingUsesLineFragmentOrigin
                                                     attributes:@{NSFontAttributeName: font}
                                                        context:nil];
        CGRect detailRect = [cell.detailTextLabel.text boundingRectWithSize:bounds
                                                        options:NSStringDrawingUsesLineFragmentOrigin
                                                     attributes:@{NSFontAttributeName: detailFont}
                                                        context:nil];
        size = rect.size;
        detailSize = detailRect.size;
    }
    return size.height + detailSize.height;

}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return NO;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
}

- (IBAction)refreshRSS:(id)sender {
    [self requestRSS];
}

- (void)requestRSS
{
    NSURL *url = [NSURL URLWithString:@"http://api.nanapi.jp/v1/recipeSearchDetails/?key=512f53ecbd959&format=json&query=%E7%B7%91"];

    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
        NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];

        NSArray *result = [[jsonDictionary objectForKey:@"response"] objectForKey:@"recipes"];
        self.items = result;
 
        [self.tableView reloadData];
    }];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"detailView"]) {
        DetailViewController *detailViewController = (DetailViewController *)[segue destinationViewController];
        NSDictionary *item = [self.items objectAtIndex:[self.tableView indexPathForSelectedRow].row];
        detailViewController.recipe = item;
    }
    else if ([segue.identifier isEqualToString:@"selectView"]) {
        SelectViewController *selectViewController = (SelectViewController *)[segue destinationViewController];
        selectViewController.items = self.items;

    }
    
}

@end
