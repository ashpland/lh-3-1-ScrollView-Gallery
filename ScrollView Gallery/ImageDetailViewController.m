//
//  ImageDetailViewController.m
//  ScrollView Gallery
//
//  Created by Andrew on 2017-10-17.
//  Copyright © 2017 Andrew. All rights reserved.
//

#import "ImageDetailViewController.h"

@interface ImageDetailViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *detailView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;


@end

@implementation ImageDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.imageView.image = self.detailedImage;

}

-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.imageView;
}

@end
