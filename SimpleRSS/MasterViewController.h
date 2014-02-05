//
//  MasterViewController.h
//  SimpleRSS
//
//  Created by kozyty on 2014/01/28.
//  Copyright (c) 2014年 kozyty. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MasterViewController : UITableViewController <UIApplicationDelegate, NSXMLParserDelegate>
// buttonをタップしたときのアクションをキャッチ
- (IBAction)refreshRSS:(id)sender;

@property(strong, nonatomic) NSMutableArray *rows;
@property(strong, nonatomic) NSArray *items;

// JSON
- (void)requestRSS;

@end
