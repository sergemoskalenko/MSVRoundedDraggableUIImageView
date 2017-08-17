//
//  MSVDraggableImageView.h
//  Pods
//
//  Created by Serge Moskalenko on 16.08.17.
//  Copyright (c) 2017 sergemoskalenko. All rights reserved.
//  skype:camopu-ympo, http://camopu.rhorse.ru/ios
//

#import <UIKit/UIKit.h>

@class MSVDraggableImageView;
@protocol MSVDraggableImageViewProtocol <NSObject>
@optional
- (void)draggableImageView:(MSVDraggableImageView *)sender didMovedToPoint:(CGPoint)point;
- (void)draggableImageView:(MSVDraggableImageView *)sender didMovedValue:(CGPoint)value;
- (void)draggableImageView:(MSVDraggableImageView *)sender willMovedToStartPoint:(CGPoint)point;
- (void)draggableImageView:(MSVDraggableImageView *)sender didMovedToStartPoint:(CGPoint)point;
@end


IB_DESIGNABLE
@interface MSVDraggableImageView : UIImageView

@property (nonatomic, weak) id <MSVDraggableImageViewProtocol> delegate;
@property (nonatomic, assign) CGFloat maxShiftX;
@property (nonatomic, assign) CGFloat maxShiftY;
@property (nonatomic, assign) BOOL isMovedToStartPoint;

- (void)pinStartPoint;
- (void)moveToStartPoint;

@end
