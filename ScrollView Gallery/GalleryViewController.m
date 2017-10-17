//
//  GalleryViewController.m
//  ScrollView Gallery
//
//  Created by Andrew on 2017-10-17.
//  Copyright © 2017 Andrew. All rights reserved.
//

#import "GalleryViewController.h"

@interface GalleryViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *galleryScrollView;
@property (strong, nonatomic) NSArray<UIImageView *> *photoArray;

@end

@implementation GalleryViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.photoArray = @[
                        [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Lighthouse-in-Field"]],
                        [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Lighthouse-night"]],
                        [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Lighthouse-zoomed"]]
                        ];
    
    for (UIImageView *imageView in self.photoArray) {
        imageView.translatesAutoresizingMaskIntoConstraints = NO;
//        [self.galleryScrollView addSubview: imageView];
        [self.view addSubview: imageView];

        [imageView.widthAnchor constraintEqualToAnchor:self.view.widthAnchor].active = YES;
        [imageView.topAnchor constraintEqualToAnchor:self.view.topAnchor].active = YES;
        [imageView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor].active = YES;

        NSInteger leftOffSet = [self.photoArray indexOfObject:imageView] * self.view.frame.size.width / 3;

        [imageView.leftAnchor constraintEqualToAnchor:self.view.leftAnchor constant:leftOffSet].active = YES;
    }



}

@end
