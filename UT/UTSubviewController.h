//
//  UTSubviewController.h
//  UT
//
//  Created by Michael Smith on 3/3/11.
//  Copyright 2011 PikLips LLC. 
//  MIT Open Source License, see license.txt for details.
//

#import <UIKit/UIKit.h>
#import "UTView.h"


@interface UTSubviewController : UIViewController  /* PikLips */ <UIGestureRecognizerDelegate> /* PikLips */{
// PikLips: added code --
    UIPanGestureRecognizer *uTPanColorControlGesture; // PikLips: allows the user to change the subview colors
    UIPinchGestureRecognizer *uTPinchGesture; // PikLips: allows the user to resize the subview
    UIRotationGestureRecognizer *uTRotationGesture; // PikLips: allows the user to rotate the subview
    UITapGestureRecognizer *uTTapGesture; // PikLips: allows the user to hide the subview
// PikLips: code ends
}
// PikLips: added code --
@property (nonatomic, retain) UIPanGestureRecognizer *uTPanColorControlGesture; // PikLips: demo instance method
@property (nonatomic, retain) UIPinchGestureRecognizer *uTPinchGesture; // PikLips: demo instance method
@property (nonatomic, retain) UIRotationGestureRecognizer *uTRotationGesture; // PikLips: demo instance method
@property (nonatomic, retain) UITapGestureRecognizer *uTTapGesture; // PikLips: demo instance method
// PikLips: code ends
@end
