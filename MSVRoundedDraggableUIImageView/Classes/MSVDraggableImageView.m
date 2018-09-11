//
//  MSVDraggableImageView.m
//  Pods
//
//  Created by Serge Moskalenko on 16.08.17.
//  Copyright (c) 2017 sergemoskalenko. All rights reserved.
//  skype:camopu-ympo, http://camopu.rhorse.ru/ios
//

#import "MSVDraggableImageView.h"

@interface MSVDraggableImageView ()

@property BOOL isToched;
@property CGPoint startPoint;
@property CGRect oldFrame;
@property CGRect pinFrame;

@property (readonly) CGFloat maxShiftX2;
@property (readonly) CGFloat maxShiftY2;
@property (weak) UIView* superView;

@end

@implementation MSVDraggableImageView

- (instancetype) init {
    if (self = [super init]) {
        [self setUp];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUp];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self setUp];
    }
    return self;
}

- (void)setUp {
    _isToched = NO;
    _maxShiftX = 0;
    _maxShiftY = 0;
    _isMovedToStartPoint = YES;
    _pinFrame = CGRectZero;
}

- (void) updateView {
    if (_delegate) {
        if ([_delegate respondsToSelector:@selector(draggableImageView:didMovedValue:)]) {
            CGFloat x = self.frame.origin.x;
            CGFloat y = self.frame.origin.y;
            CGFloat xPin = _pinFrame.origin.x;
            CGFloat yPin = _pinFrame.origin.y;
            CGPoint value = CGPointMake(0.5 * (self.maxShiftX2 + x - xPin) /self.maxShiftX2, 0.5 * (self.maxShiftY2 + y - yPin) / self.maxShiftY2);
            
            [_delegate draggableImageView:self didMovedValue:value];
        }
        if ([_delegate respondsToSelector:@selector(draggableImageView:didMovedToPoint:)]) {
            [_delegate draggableImageView:self didMovedToPoint:self.frame.origin];
        }
    }
}

- (void)touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event {
    UITouch* touch = [touches anyObject];
    _startPoint = [touch locationInView:self.superview];
    if (_pinFrame.size.width < 0.001 && _pinFrame.size.height < 0.001)
    [self pinStartPoint];

    _isToched = YES;
    _oldFrame = self.frame;
}

- (void)touchesMoved:(NSSet*)touches withEvent:(UIEvent*)event {
    if (_isToched) {
        UITouch* touch = [touches anyObject];
        CGPoint currPoint = [touch locationInView:self.superview];
        
        CGFloat newX = _oldFrame.origin.x + (currPoint.x - _startPoint.x);
        CGFloat newY = _oldFrame.origin.y + (currPoint.y - _startPoint.y);
        
        if (ABS(_pinFrame.origin.x - newX) < self.maxShiftX2 && ABS(_pinFrame.origin.y - newY) < self.maxShiftY2) {
            self.frame = CGRectMake(newX, newY, _oldFrame.size.width, _oldFrame.size.height);
            [self updateView];
        }
        
    }
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event {
    self.frame = _oldFrame;
    [self updateView];
    _isToched = NO;
}

-(void) touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    _isToched = NO;
    [self moveToStartPoint];
}

#pragma mark -

- (void)pinStartPoint {
    _pinFrame = self.frame;
}

- (void)moveToStartPoint {
    if (!_isMovedToStartPoint || (_pinFrame.size.width < 0.001 && _pinFrame.size.height < 0.001))
        return;
    
    self.userInteractionEnabled = NO;

    if ([_delegate respondsToSelector:@selector(draggableImageView:willMovedToStartPoint:)]) {
        [_delegate draggableImageView:self willMovedToStartPoint:self.pinFrame.origin];
    }
    
    __weak typeof(self) weakSelf = self;
    [UIView animateWithDuration:0.25 animations:^{
        __strong typeof(self) strongSelf = weakSelf;
        strongSelf.frame = _pinFrame;
    } completion:^(BOOL finished) {
        __strong typeof(self) strongSelf = weakSelf;
        strongSelf.userInteractionEnabled = YES;
        if ([_delegate respondsToSelector:@selector(draggableImageView:didMovedToStartPoint:)]) {
            [_delegate draggableImageView:strongSelf didMovedToStartPoint:strongSelf.frame.origin];
        }
    }];
}

#pragma mark - Shift

- (CGFloat) maxShiftX2 {
    CGFloat shift = _maxShiftX;
    if (ABS(shift) < 0.0001f)
        shift = [UIScreen mainScreen].applicationFrame.size.width / 2;
    return shift;
}

- (CGFloat) maxShiftY2 {
    CGFloat shift = _maxShiftY;
    if (ABS(shift) < 0.0001f)
        shift = [UIScreen mainScreen].applicationFrame.size.height / 2;
    return shift;
}


@end
