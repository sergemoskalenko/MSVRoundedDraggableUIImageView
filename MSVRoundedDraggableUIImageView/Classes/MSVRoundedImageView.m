//
//  MSVRoundedImageView.m
//  Pods
//
//  Created by Serge Moskalenko on 16.08.17.
//  Copyright (c) 2017 sergemoskalenko. All rights reserved.
//  skype:camopu-ympo, http://camopu.rhorse.ru/ios
//

#import "MSVRoundedImageView.h"

@implementation MSVRoundedImageView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupValues];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self setupValues];
    }
    return self;
}

- (void)setupValues {
    [self updateLayerProperties];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self updateLayerProperties];
}

- (void)updateLayerProperties {

    self.clipsToBounds = YES;
    self.layer.cornerRadius = MIN(self.frame.size.width, self.frame.size.height) / 2;    

    self.layer.borderColor = self.borderColor.CGColor;
    self.layer.borderWidth = self.borderWidth;
}

@end
