//
//  UTAppDelegate.h
//  UT
//
//  Created by Michael Smith on 3/3/11.
//  Copyright 2011 PikLips LLC. 
//  MIT Open Source License, see license.txt for details.
//

#import <UIKit/UIKit.h>
/* PikLips: added code
 * This was added to the header instead of the main code because, unlike the xib-based
 * view controller, Xcode cannot resolve the @property for the UTSubviewController without
 * having this to reference here.
 */
#import "UTSubviewController.h"       // PikLips: added for @property reference below

@class UTViewController;

@interface UTAppDelegate : NSObject <UIApplicationDelegate /*PikLips*/, UIGestureRecognizerDelegate/*PikLips*/> {
    
// PikLips: added code -
    UITapGestureRecognizer *uTTapGestureRecognizer; // PikLips: lets the user restore the hidden view
// PikLips: code ends
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet UTViewController *viewController;

// PikLips: added --
@property (nonatomic, retain) IBOutlet UTSubviewController *subviewController; // PikLips: declare non-xib subview
@property (nonatomic, retain) UITapGestureRecognizer *uTTapGesture; // PikLips: declare gesture method
// PikLips: code ends

@end
