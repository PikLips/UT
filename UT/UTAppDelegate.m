//
//  UTAppDelegate.m
//  UT
//
//  Created by Michael Smith on 3/3/11.
//  Copyright 2011 PikLips LLC. 
//  MIT Open Source License, see license.txt for details.
//

#import "UTAppDelegate.h"

#import "UTViewController.h"

@implementation UTAppDelegate


@synthesize window=_window;

@synthesize viewController=_viewController;

// PikLips: added code --
@synthesize subviewController; // PikLips: create added subview's getters and setters
@synthesize uTTapGesture; // PikLips: create accessor methods
// PikLips: code ends

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
     
    self.window.rootViewController = self.viewController;
    
// PikLips: code added -
    UTSubviewController *_subviewController = [[UTSubviewController alloc] initWithNibName:@"UTSubviewController" bundle:nil]; // PikLips: allocate an instance of the subviewController
    
    self.subviewController = _subviewController; // PikLips: out of the book
    
    if (self.window.subviews.count == 0) {
        [self.window addSubview:self.viewController.view]; // PikLips: this should have been done by IB
        NSLog(@"window had no views at this point"); // With IB, you don't see this message
    }
    // PikLips: add the subview to the window but in front of the view --
    if (self.subviewController.view.superview == nil) {
        [self.window addSubview:self.subviewController.view]; // PikLips: add our new subview to the window
        // PikLips: these are two other ways to do the same as above --
        // [(UIView *) self.window insertSubview:self.subviewController.view atIndex:[self.window.subviews count]];
        // [(UIView *) self.window insertSubview:self.subviewController.view aboveSubview: [self.window.subviews lastObject]];
            }
    else {
        NSLog(@"Subview's view was set to %@.", self.subviewController.view.superview.description);
    }
    
// PikLips: code ends
    
    [self.window makeKeyAndVisible];

//PikLips: code added--
    
    /* PikLips
     Create a tap gesture recognizer for the window.
     */
	UIGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] 
                                       initWithTarget:self 
                                       action:@selector(handleTapGesture:)]; // PikLips: assign our method
	[self.window addGestureRecognizer:tapGesture]; // PikLips: add to window (view)
    self.uTTapGesture = (UITapGestureRecognizer *)tapGesture; // PikLips: make public
    tapGesture.delegate = self; // PikLips: amke this class be the delegate 
	[tapGesture release]; // PikLips: then release it
// PikLips: code ends
    
    return YES;
}

/* PikLips: added code
 * This gesture recognizer is here for two reasons: (1) to show that you can have such a view
 * event handler for a UIWindow, and (2) to accompany the gesture recognizer in the view
 * that gets hidden.  This is the only way to unhide it.
 *
 * This hides/unhides the xib view using an animation to make the prior state "ease out."
 * The hidden property cannot be animated, so we animate the alpha instead to get the 
 * effect, restoring it to its original value after we hide or before we unhide. 
 */
- (IBAction) handleTapGesture:(UIGestureRecognizer *) sender {
    UIView *uTView = [self.window.subviews objectAtIndex:0]; // PikLips: this only deals with a view whose view.superview = view.window
    if (uTView.hidden == NO)
    {
        // Fade out the view right away
        CGFloat uTAlpha = uTView.alpha; // 
        [UIView animateWithDuration:1.0
                              delay: 0.0
                            options: UIViewAnimationOptionCurveEaseOut
                         animations:^{
                             uTView.alpha = 0.0;
                         }
                         completion:^(BOOL finished){
                             uTView.hidden=YES; // PikLips: really hid it now
                             uTView.alpha = uTAlpha; // PikLips: then reset the alpha
                         }];
    }
    else
    {
        // Fade in the view right away
        CGFloat uTAlpha = uTView.alpha;
        uTView.alpha = 0.0; // PikLips: really hid it now
        uTView.hidden = NO; // PikLips: begin to unhide it
        [UIView animateWithDuration:1.0
                              delay: 0.0
                            options: UIViewAnimationOptionCurveEaseIn
                         animations:^{
                             uTView.alpha = uTAlpha;
                         }
                         completion:^(BOOL finished){
                             // PikLips: If you make the subview too small to pinch apart (grow) then you may want to do something else here.  For example: 
                             if (uTView.frame.size.height < (CGFloat) 60) {
                                uTView.transform = CGAffineTransformMakeScale(1.0, 1.0); // PikLips:
                                 if (sender.state == UIGestureRecognizerStateEnded) {
                                     uTView.bounds = uTView.frame; // PikLips:
                                 }
                             }
                             if ([self.window.subviews objectAtIndex:1] != nil)
                             {
                                 UIView *uTView2 = [self.window.subviews objectAtIndex:1]; // PikLips: while we are at it, check the subview too
                                 if (uTView2.hidden == YES) uTView2.hidden = NO; // PikLips: Unhide it, too
                             }; // PikLips: 

                         }];
    }
}
// PikLips: code ends

/* PikLips:
 * This is a simple way to hide or unhide the xib view without the special annimation --
 
 - (IBAction) handleTapGesture:(UITapGestureRecognizer *)sender {
 UIView *uTView = [self.window.subviews objectAtIndex:0]; // PikLips: this only deals with a view whose view.superview = view.window
 if (self.uTView.hidden == NO) self.uTView.hidden = YES; // PikLips: unhide if hidden
 else self.uTView.hidden = NO; // PikLips: // hide if unhidden
 }
 */

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (YES); // interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

- (void)dealloc
{
    [_window release];
    [_viewController release];
    [super dealloc];
}

@end
