//
//  MSVRoundedDraggableImageView.h
//  Pods
//
//  Created by Serge Moskalenko on 16.08.17.
//  Copyright (c) 2017 sergemoskalenko. All rights reserved.
//  skype:camopu-ympo, http://camopu.rhorse.ru/ios
//

#import <UIKit/UIKit.h>
#import "MSVDraggableImageView.h"

IB_DESIGNABLE
@interface MSVRoundedDraggableImageView : MSVDraggableImageView

@property (nonatomic) IBInspectable UIColor* borderColor;
@property (nonatomic) IBInspectable CGFloat borderWidth;

@end
