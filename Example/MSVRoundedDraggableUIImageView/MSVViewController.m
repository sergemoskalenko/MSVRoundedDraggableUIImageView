//
//  MSVViewController.m
//  MSVRoundedDraggableUIImageView
//
//  Created by sergemoskalenko on 08/16/2017.
//  Copyright (c) 2017 sergemoskalenko. All rights reserved.
//  skype:camopu-ympo, http://camopu.rhorse.ru/ios
//

#import "MSVViewController.h"
#import "MSVDraggableImageView.h"
#import "MSVRoundedDraggableImageView.h"

@interface MSVViewController ()
@property (weak, nonatomic) IBOutlet UISwitch *switchView;
@property (strong, nonatomic) MSVDraggableImageView * imageView;
@property (weak, nonatomic) IBOutlet MSVRoundedDraggableImageView *imageViewOnTop;

@end

@implementation MSVViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.imageView = [[MSVDraggableImageView alloc] initWithFrame:CGRectMake(0, 0, 64, 64)];
    self.imageView.image = [UIImage imageNamed:@"earth"];
    self.imageView.center = self.view.center;
    self.imageView.userInteractionEnabled = YES;
    [self.imageView pinStartPoint];
    [self.view addSubview:self.imageView];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonAction:(UIButton *)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://camopu.rhorse.ru/MSVRoundedDraggableUIImageView"]];
}

- (IBAction)switchAction:(UISwitch *)sender {
    self.imageView.isMovedToStartPoint = sender.on;
    if (self.imageView.isMovedToStartPoint)
        [self.imageView moveToStartPoint];
    
    self.imageViewOnTop.isMovedToStartPoint = sender.on;
    if (self.imageViewOnTop.isMovedToStartPoint)
    [self.imageViewOnTop moveToStartPoint];
    
}

@end
