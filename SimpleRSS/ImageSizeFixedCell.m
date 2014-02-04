//
//  ImageSizeFixedCell.m
//  SimpleRSS
//
//  Created by kozyty on 2014/02/04.
//  Copyright (c) 2014年 shuichi.wada. All rights reserved.
//

#import "ImageSizeFixedCell.h"
#import <QuartzCore/QuartzCore.h>

@implementation ImageSizeFixedCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)layoutSubviews {
    [super layoutSubviews];

    self.imageView.frame = CGRectMake(0, 15.0f, 60.0f, 60.0f);
    self.imageView.contentMode = UIViewContentModeScaleAspectFill;
    self.imageView.clipsToBounds = YES;
    self.textLabel.frame = CGRectMake(65.0f, self.textLabel.frame.origin.y, self.frame.size.width - 70.0f, self.textLabel.frame.size.height);
    self.detailTextLabel.frame = CGRectMake(65.0f, self.detailTextLabel.frame.origin.y, self.frame.size.width - 70.0f, self.detailTextLabel.frame.size.height);


    
//    float desiredWidth = 60;
//    float w=self.imageView.frame.size.width;
//    
//    if (w > desiredWidth) {
//        float widthSub = w - desiredWidth;
//        self.imageView.frame = CGRectMake(self.imageView.frame.origin.x, self.imageView.frame.origin.y, desiredWidth, self.imageView.frame.size.height);
//        self.textLabel.frame = CGRectMake(self.textLabel.frame.origin.x-widthSub,self.textLabel.frame.origin.y,self.textLabel.frame.size.width+widthSub,self.textLabel.frame.size.height);
//        self.detailTextLabel.frame = CGRectMake(self.detailTextLabel.frame.origin.x-widthSub,self.detailTextLabel.frame.origin.y,self.detailTextLabel.frame.size.width+widthSub,self.detailTextLabel.frame.size.height);
//        self.imageView.contentMode = UIViewContentModeScaleAspectFit;
//        NSLog(@"%s", __func__);
//    }
}

@end
