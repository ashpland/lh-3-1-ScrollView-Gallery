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
        [self.galleryScrollView addSubview: imageView];

        
        [imageView.widthAnchor constraintEqualToAnchor:self.view.widthAnchor].active = YES;
        [imageView.topAnchor constraintEqualToAnchor:self.view.topAnchor].active = YES;
        [imageView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor].active = YES;

        NSInteger leftOffSet = [self.photoArray indexOfObject:imageView] * self.view.frame.size.width;

        [imageView.leftAnchor constraintEqualToAnchor:self.galleryScrollView.leftAnchor constant:leftOffSet].active = YES;
        
        imageView.clipsToBounds = true;

        imageView.contentMode = UIViewContentModeScaleAspectFit;

    }

    
    self.galleryScrollView.contentSize = CGSizeMake(self.view.frame.size.width * self.photoArray.count, self.view.frame.size.height);


}


-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSLog(@"Scrolling: %f", scrollView.contentOffset.x);
}


@end
