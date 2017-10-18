//
//  GalleryViewController.m
//  ScrollView Gallery
//
//  Created by Andrew on 2017-10-17.
//  Copyright © 2017 Andrew. All rights reserved.
//

#import "GalleryViewController.h"
#import "ImageDetailViewController.h"

@interface GalleryViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *galleryScrollView;
@property (strong, nonatomic) NSArray<UIImageView *> *photoArray;
@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *tapGestureRecognizer;
@property (strong, nonatomic, readonly) UIImage *currentPhoto;
- (IBAction)imageWasTapped:(UITapGestureRecognizer *)sender;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
@property (strong, nonatomic) UIStackView *imageHolder;

@end

@implementation GalleryViewController



- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupPhotoArrayForImagesNamed:@[@"Lighthouse-in-Field", @"Lighthouse-night", @"Lighthouse-zoomed"]];
    
    [self setupImageHolderStackView];
    
    [self setupImagesAndAddToStackView];

    self.pageControl.numberOfPages = self.photoArray.count;

}


- (void)setupPhotoArrayForImagesNamed:(NSArray<NSString *> *)photoNames {
    NSMutableArray *photosToAdd = [NSMutableArray new];
    for (NSString *photoName in photoNames) {
        [photosToAdd addObject:[[UIImageView alloc] initWithImage:[UIImage imageNamed:photoName]]];
    }
    self.photoArray = photosToAdd;
}


- (void)setupImageHolderStackView {
    self.imageHolder = [UIStackView new];
    self.imageHolder.translatesAutoresizingMaskIntoConstraints = NO;
    self.imageHolder.axis = UILayoutConstraintAxisHorizontal;
    self.imageHolder.distribution = UIStackViewDistributionEqualSpacing;
    self.imageHolder.alignment = UIStackViewAlignmentFill;
    
    [self.galleryScrollView addSubview: self.imageHolder];
    
    [self.imageHolder.leadingAnchor constraintEqualToAnchor:self.galleryScrollView.leadingAnchor].active = YES;
    [self.imageHolder.trailingAnchor constraintEqualToAnchor:self.galleryScrollView.trailingAnchor].active = YES;
    
    [self.imageHolder.topAnchor constraintEqualToAnchor:self.view.topAnchor].active = YES;
    [self.imageHolder.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor].active = YES;
    [self.imageHolder.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor].active = YES;
}


- (void)setupImagesAndAddToStackView
{
    for (UIImageView *imageView in self.photoArray) {
        imageView.translatesAutoresizingMaskIntoConstraints = NO;
        imageView.clipsToBounds = true;
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        
        [self.imageHolder addArrangedSubview: imageView];
        
        [imageView.widthAnchor constraintEqualToAnchor:self.view.widthAnchor].active = YES;
        [imageView.heightAnchor constraintEqualToAnchor:self.view.heightAnchor].active = YES;
    }
}


-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    self.pageControl.currentPage = scrollView.contentOffset.x / self.view.frame.size.width;
}


- (IBAction)imageWasTapped:(UITapGestureRecognizer *)sender {
    [self performSegueWithIdentifier:@"detailSegue" sender:sender];
}


-(UIImage *)currentPhoto{
    return [self.photoArray objectAtIndex:(self.galleryScrollView.contentOffset.x / self.view.frame.size.width)].image;
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"detailSegue"]) {
        ImageDetailViewController *imageDetail = [segue destinationViewController];
        imageDetail.detailedImage = self.currentPhoto;
    }
}


@end
