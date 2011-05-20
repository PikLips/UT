//
//  UTViewController.h
//  UT
//
//  Created by Michael Smith on 3/3/11.
//  Copyright 2011 PikLips LLC. 
//  MIT Open Source License, see license.txt for details.
//

#import <UIKit/UIKit.h>

@interface UTViewController : UIViewController /* PikLips */ <UIGestureRecognizerDelegate> /* PikLips */ {
// PikLips: code added --
    UIPinchGestureRecognizer *uTPinchGesture; // PikLips: lets the user adjust the view size
    UIRotationGestureRecognizer *uTRotationGesture; // PikLips: lets the user rotate the view
    UITapGestureRecognizer *uTTapGesture; // PikLips: lets the user hide the view
// PikLips: code ends
}
// PikLips: code added --
@property (nonatomic, retain) UIPinchGestureRecognizer *uTPinchGesture; // PikLips: declare instance method
@property (nonatomic, retain) UIRotationGestureRecognizer *uTRotationGesture; // PikLips: declare instance method
@property (nonatomic, retain) UITapGestureRecognizer *uTTapGesture; // PikLips: declare instance method
// PikLips: code ends
@end
