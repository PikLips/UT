//
//  UTTests.m
//  UTTests
//
//  Created by Michael Smith on 3/3/11.
//  Copyright 2011 PikLips LLC. 
//  MIT Open Source License, see license.txt for details.
//

#import "UTTests.h"


@implementation UTTests

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
/* PikLips: code begins here
 * It is here that you initialize the instances of the classes, app delegate & view controller(s), that
 * will have their properties and methods tested.  This makes the tests completely separate from the 
 * application.  As such, they will not interfere with the application when it runs.
 */
    // PikLips: change the delegate class to match the header --
    testAppDelegate = (UTAppDelegate *)[[UIApplication sharedApplication] delegate];  //PikLips: creates a separate instance for testing of the same Class as AppDelegate which includes UIGestureRecognizer delegate
    testViewController = testAppDelegate.viewController;  //PikLips: creates a separate instance for testing
    testSubviewController = testAppDelegate.subviewController;  //PikLips: creates a separate subview instance for testing
// PikLips: code ends 
}

- (void)tearDown
{
    // Tear-down code here.
    
// PikLips: code begins here
    // [testAppDelegate release]; // PikLips: clean-up
    //[testViewController release]; // PikLips: clean-up
    //[testSubviewController release]; // PikLips: clean-up
// PikLips: code ends
    
    [super tearDown];
}
/* PikLips: What you can test.
 * Apple provides a basic unit test framework, based on OCUnit test.  Details can be found here -
 * http://developer.apple.com/library/mac/#documentation/DeveloperTools/Conceptual/UnitTesting/0-Introduction/introduction.html
 * There are different types of testing, different types of targets. etc.  These tests use a set of macros that
 * determine the outcome of the test.  These have been configured to fail with a message any time the tested value
 * does nto equal the default.  When you aply these tests to your code, you make want to adjust the defaults
 * to be your values.  See UIViewConstants.
 * To setup these tests in Xcode 3.x, see --
 * http://developer.apple.com/tools/unittest.html or --
 * http://developer.apple.com/library/mac/#featuredarticles/UnitTestingXcode3/
 */

// PiLips: this recursive method is used to traverse the tree of subviews in a window or a view
-(void) spanTheTree: (UIView *) subview
{
    // PikLips: deal with the view, then
    STAssertNil(subview, @"This view %@ is the #%i subview, tag %i, of %@ with a tag of %i", subview, ([subview.superview.subviews indexOfObject: subview] + 1), subview.tag, subview.superview, subview.tag);
    
    // PikLips: now dig for the subviews --
    for (UIView *eachSubview in subview.subviews)
    {
        [self spanTheTree: eachSubview];
    }
}
- (void) spanTheTree2: (id) unknwnView depth: (int) depth
{
    STAssertNil(unknwnView, @"\nView at depth %i with tag %i is %@ with %@", depth, [unknwnView tag],[[unknwnView class] description], NSStringFromCGRect([unknwnView frame]));
    for (UIView *subview in [unknwnView subviews]) 
    {
        [self spanTheTree2:subview depth:(depth + 1)];
    }
}

/* PikLips:
 * Test for the presence of the App Delegate, View Controller and other 
 * instances.  If these are missing, then MOST of the subsequent tests 
 * for that object will fail.  The interesting ones are those that do
 * not.
 */

-(void) test1_OurAppDelegate {
    STAssertNotNil(testAppDelegate, @"Cannot find the application delegate");  //PikLips: this will fail if not properly assigned
}  // PikLips:

- (void) test2_OurViewController { 
    STAssertNotNil(testViewController, @"Cannot find the view controller");  //PikLips this will fail if the viewController used to assign this instance is not really there
} 

- (void) test3_OurSubviewController {  //PikLips
    STAssertNotNil(testSubviewController, @"Could not find subview view controller"); //PikLips this will fail if the subviewController used to assign this instance is not really there
}  //PikLips
 
- (void) test4_OurSubviewController {  //PikLips
    STAssertNotNil(testSubviewController, @"Could not find subview view controller"); //PikLips this will fail if the subviewController used to assign this instance is not really there
}  //PikLips
/* PikLips:
 * Test the App Delegate's Window --
 */
-(void) test5_TheWindow
{
    NSLog(@"Tests begin for window");
    // Override point for customization after application launch.
    bool skip = NO; // PikLips: used to nest tests
    
    // UIView Class properties -
    STAssertEquals(testAppDelegate.window.alpha, ALPHA_WINDOWDEFAULT, @"Window alpha default %f, not %f", testAppDelegate.window.alpha, ALPHA_WINDOWDEFAULT);  //PikLips: default
    
    if (AUTORESIZESSUBVIEWS_WINDOWDEFAULT)
        STAssertTrue(testAppDelegate.window.autoresizesSubviews, @"Window autoresizeSubviews is not default %@", AUTORESIZESSUBVIEWS_WINDOWDEFAULT);  //PikLips: default
    else STAssertFalse(testAppDelegate.window.autoresizesSubviews, @"Window autoresizesSubviews is not default %@", AUTORESIZESSUBVIEWS_WINDOWDEFAULT);  //PikLips: default
    
    STAssertEqualObjects(testAppDelegate.window.backgroundColor, BACKGROUNDCOLOR_WINDOWDEFAULT, @"Window default backgroundColor is %@, not default %@", testAppDelegate.window.backgroundColor, BACKGROUNDCOLOR_WINDOWDEFAULT); //PikLips: default
    
    STAssertEquals(testAppDelegate.window.bounds, BOUNDS_WINDOWDEFAULT, @"Window bounds are not default."); //PikLips: default
    
    STAssertEquals(testAppDelegate.window.center, CENTER_WINDOWDEFAULT, @"Window center is %f, not default %f", testAppDelegate.window.center, CENTER_WINDOWDEFAULT); //PikLips: default
    
    if (CLEARSCONTEXTBEFOREDRAWING_WINDOWDEFAULT)
        STAssertTrue(testAppDelegate.window.clearsContextBeforeDrawing, @"Window clearsContextBeforeDrawing is NO, not default YES"); //PikLips: default
    else
        STAssertFalse(testAppDelegate.window.clearsContextBeforeDrawing, @"Window clearsContextBeforeDrawing is YES, not default NO"); //PikLips: default
    
    if (CLIPSTOBOUNDS_WINDOWDEFAULT)
        STAssertTrue(testAppDelegate.window.clipsToBounds, @"Window clipsToBounds is NO, not default YES"); //PikLips: default
    else 
        STAssertFalse(testAppDelegate.window.clipsToBounds, @"Window clipsToBounds is YES, not default NO"); //PikLips: default
    
    STAssertEquals(testAppDelegate.window.contentMode, CONTENTMODE_WINDOWDEFAULT, @"Window contentMode is %i, not default %i", testAppDelegate.window.contentMode, CONTENTMODE_WINDOWDEFAULT); //PikLips: default
    
    STAssertEquals(testAppDelegate.window.contentScaleFactor, CONTENTSCALEFACTOR_WINDOWDEFAULT, @"Window contentScaleFactor is %f, not default %f", testAppDelegate.window.contentScaleFactor, CONTENTSCALEFACTOR_WINDOWDEFAULT); //PikLips: default
    
    STAssertEquals(testAppDelegate.window.contentStretch, testAppDelegate.window.contentStretch, @"Window contentStretch is not defined.", skip = NO); //PikLips: default
    STAssertEquals(testAppDelegate.window.contentStretch, CONTENTSTRETCH_WINDOWDEFAULT, @"Window contentStretch parameters are not default."); //PikLips: default
    
    if (EXCLUSIVETOUCH_WINDOWDEFAULT)
        STAssertTrue(testAppDelegate.window.exclusiveTouch, @"Window exclusiveTouch is NO, not default YES"); //PikLips: default
    else 
        STAssertFalse(testAppDelegate.window.exclusiveTouch, @"Window exclusiveTouch is YES, not default NO"); //PikLips: default
    
    STAssertEquals(testAppDelegate.window.frame, FRAME_WINDOWDEFAULT, @"Window's frame parameters are not default."); //PikLips: default
    
    STAssertEquals(testAppDelegate.window.frame, testAppDelegate.window.bounds, @"Window frame is not the same as its bounds."); //PikLips: default
    
    STAssertNil(testAppDelegate.window.gestureRecognizers, @"Window's list of gesture recognizers for window not null, instead %@", testAppDelegate.window.gestureRecognizers, skip=NO); //PikLips: default
    if (skip) {
        skip = NO;
    }
    else
    {
        for (UIGestureRecognizer *gesture in testAppDelegate.window.gestureRecognizers)
        {
        STAssertNil(gesture, @"Window's gesture recognizer is %@", gesture.description); //PikLips: default
        }
    }
    
    if (HIDDEN_WINDOWDEFAULT)
        STAssertTrue(testAppDelegate.window.hidden, @"Window hidden is NO, not default YES"); //PikLips: default
    else 
        STAssertFalse(testAppDelegate.window.hidden, @"Window hidden is YES, not default NO"); //PikLips: default
    
    STAssertNotNil(testAppDelegate.window.layer, @"Window window layer is nil, not default"); //PikLips: default
    
    if (MULTIPLETOUCHENABLED_WINDOWDEFAULT)
        STAssertTrue(testAppDelegate.window.multipleTouchEnabled, @"Window multipleTounchEnabled is NO, not default YES"); //PikLips: default
    else 
        STAssertFalse(testAppDelegate.window.multipleTouchEnabled, @"Window multipleTounchEnabled is YES, not default "); //PikLips: default
    
    if (OPAQUE_WINDOWDEFAULT)
        STAssertTrue(testAppDelegate.window.opaque, @"Window opaque is NO, not defualt YES"); //PikLips: default
    else
        STAssertFalse(testAppDelegate.window.opaque, @"Window opaque is YES, not default NO"); //PikLips: default
    
    /* PikLips: 
     * subveiws read only -- using the DEFAULT, as we have added views
     */
    STAssertEquals(testAppDelegate.window.subviews.count, SUBVIEWSCOUNT_DEFAULT, @"Window has %i subviews: %@", testAppDelegate.window.subviews.count, testAppDelegate.window.subviews); //PikLips: default
    
    /* PikLips: 
     * superview read only
     */
    STAssertNil(testAppDelegate.window.superview, @"Window has a superview %@", testAppDelegate.window.superview); //PikLips: default
    
    STAssertEquals(testAppDelegate.window.tag, (NSInteger) 0, @"Window's tag is not default %i has assigned tag of %i", TAG_WINDOWDEFAULT, testAppDelegate.window.tag); //PikLips: default
    
    STAssertEquals(testAppDelegate.window.transform, TRANSFORM_WINDOWDEFAULT, @"Window transform not default");  //PikLips: default
    
    if (USERINTERACTIONENABLED_WINDOWDEFAULT)
        STAssertTrue(testAppDelegate.window.userInteractionEnabled, @"Window user interaction enabled is NO, not defualt YES"); //PikLips: default
    else
        STAssertTrue(testAppDelegate.window.userInteractionEnabled, @"Window user interaction is YES, not default NO"); //PikLips: default
    
    /* PikLips: 
     * window.window read only 
     * nil if receiver has no window object
     */ 
    STAssertNil(testAppDelegate.window.window, @"Window has been added to another window %@", testAppDelegate.window.window);
    
    // UIWindow class properties
    
    if (KEYWINDOW_WINDOWDEFAULT)
        STAssertTrue(testAppDelegate.window.keyWindow, @"Window is NOT the key window for the application, which is not the default"); //PikLips: default
    else
        STAssertFalse(testAppDelegate.window.keyWindow, @"Window is the key window for the application, but not the default"); //PikLips: default
    
    STAssertNotNil(testAppDelegate.window.rootViewController, @"rootViewController default is nil.", skip=YES); //PikLips: default
    if (skip) {
        NSLog(@"Window does not have rootViewController"); //PikLips: default
        skip = NO;
    }
    else
        STAssertEqualObjects(testAppDelegate.window.rootViewController, testViewController, @"rootViewController is not assigned testViewController"); //PikLips: default
    
    STAssertEqualObjects(testAppDelegate.window.screen, [UIScreen mainScreen], @"Window is not on default main screen, instead %@", testAppDelegate.window.screen); //PikLips: default
    
    STAssertEquals(testAppDelegate.window.bounds.size, testAppDelegate.window.screen.applicationFrame.size, @"Window may not be best sized for its screen  Hint: check status bar."); //PikLips: default
    
    STAssertEquals(testAppDelegate.window.windowLevel, WINDOWLEVEL_WINDOWDEFAULT, @"Window level, %f, not default %f", testAppDelegate.window.windowLevel, WINDOWLEVEL_WINDOWDEFAULT); //PikLips: default
    
    NSLog(@"Tests end for window"); //PikLips: default
}
/* PikLips:
 * Test the View Controller's View instance --
 */
-(void) test6_TheView
{
    NSLog(@"Tests begin for view");
    // Override point for customization after application launch.
    bool skip = NO;
    
    // UIView Class properties -
    STAssertEquals(testViewController.view.alpha, ALPHA_VIEWDEFAULT, @"View alpha default %f, not %f", testViewController.view.alpha, ALPHA_VIEWDEFAULT);
    
    if (AUTORESIZESSUBVIEWS_VIEWDEFAULT)
        STAssertTrue(testViewController.view.autoresizesSubviews, @"View autoresizeSubviews is not default YES", AUTORESIZESSUBVIEWS_VIEWDEFAULT);
    else STAssertFalse(testViewController.view.autoresizesSubviews, @"View autoresizesSubviews is not default NO", AUTORESIZESSUBVIEWS_VIEWDEFAULT);
    
    STAssertEqualObjects(testViewController.view.backgroundColor, BACKGROUNDCOLOR_VIEWDEFAULT, @"View default backgroundColor is %@, not default %@", testViewController.view.backgroundColor, BACKGROUNDCOLOR_VIEWDEFAULT);
    
    STAssertEquals(testViewController.view.bounds, BOUNDS_VIEWDEFAULT, @"View bounds are not default.");
    
    STAssertEquals(testViewController.view.center, CENTER_VIEWDEFAULT, @"View center is %f, not default %f", testViewController.view.center, CENTER_VIEWDEFAULT);
    
    if (CLEARSCONTEXTBEFOREDRAWING_VIEWDEFAULT)
        STAssertTrue(testViewController.view.clearsContextBeforeDrawing, @"View clearsContextBeforeDrawing is NO, not default YES"); //PikLips: default
    else
        STAssertFalse(testViewController.view.clearsContextBeforeDrawing, @"View clearsContextBeforeDrawing is YES, not default NO"); //PikLips: default
    
    if (CLIPSTOBOUNDS_VIEWDEFAULT)
        STAssertTrue(testViewController.view.clipsToBounds, @"View clipsToBounds is NO, not default YES"); //PikLips: default
    else 
        STAssertFalse(testViewController.view.clipsToBounds, @"View clipsToBounds is YES, not default NO"); //PikLips: default
    
    STAssertEquals(testViewController.view.contentMode, CONTENTMODE_VIEWDEFAULT, @"View contentMode is %i, not default %i", testViewController.view.contentMode, CONTENTMODE_VIEWDEFAULT); //PikLips: default
    
    STAssertEquals(testViewController.view.contentScaleFactor, CONTENTSCALEFACTOR_VIEWDEFAULT, @"View contentScalefactor is %f, not default %f", testViewController.view.contentScaleFactor, CONTENTSCALEFACTOR_VIEWDEFAULT); //PikLips: default
    
    STAssertEquals(testViewController.view.contentStretch, CONTENTSTRETCH_VIEWDEFAULT, @"View contentStretch parameters are not default.");
    
    if (EXCLUSIVETOUCH_VIEWDEFAULT)
        STAssertTrue(testViewController.view.exclusiveTouch, @"View exclusiveTouch is NO, not default YES"); //PikLips: default
    else 
        STAssertFalse(testViewController.view.exclusiveTouch, @"View exclusiveTouch is YES, not default NO"); //PikLips: default
    
    STAssertEquals(testViewController.view.frame, FRAME_VIEWDEFAULT, @"View frame parameters are not default.");
    
    STAssertNil(testViewController.view.gestureRecognizers, @"View's list of gesture recognizers for view not null, instead %@", testViewController.view.gestureRecognizers, skip=NO);
    
    if (skip) {
        skip = NO;
    }
    else
    {
        for (UIGestureRecognizer *gesture in testViewController.view.gestureRecognizers)
        {
            STAssertNil(gesture, @"Window's gesture recognizer is %@", gesture.description); //PikLips: default
        }
    }
    if (HIDDEN_VIEWDEFAULT)
        STAssertTrue(testViewController.view.hidden, @"View's hidden is NO, not default YES"); //PikLips: default
    else 
        STAssertFalse(testViewController.view.hidden, @"View's hidden is YES, not default NO"); //PikLips: default
    
    STAssertNotNil(testViewController.view.layer, @"View layer is nil, not default");
    
    if (MULTIPLETOUCHENABLED_VIEWDEFAULT)
        STAssertTrue(testViewController.view.multipleTouchEnabled, @"View multipleTounchEnabled is NO, not default YES"); //PikLips: default
    else 
        STAssertFalse(testViewController.view.multipleTouchEnabled, @"View multipleTounchEnabled is YES, not default "); //PikLips: default
    
    if (OPAQUE_VIEWDEFAULT)
        STAssertTrue(testViewController.view.opaque, @"View opaque is NO, not defualt YES"); //PikLips: default
    else
        STAssertFalse(testViewController.view.opaque, @"View opaque is YES, not default NO"); //PikLips: default
    
    /* PikLips: 
     * subveiws read only
     */
    STAssertEquals(testViewController.view.subviews.count, SUBVIEWSCOUNT_VIEWDEFAULT, @"View has %i subviews: %@", testViewController.view.subviews.count, testViewController.view.subviews, skip = NO);
    if (skip) {
        NSLog(@"View does not have subviews");
        skip = NO;
    }
    else
        NSLog(@"View's subview %@", testViewController.view.subviews.description);
    /* PikLips:
     * superview read only
     */
    STAssertNotNil(testViewController.view.superview, @"View does not have a superview."); 
    
    STAssertEquals(testViewController.view.tag, TAG_VIEWDEFAULT, @"View's tag is not default %i has assigned tag of %i", TAG_VIEWDEFAULT, testViewController.view.tag);
    
    STAssertEquals(testViewController.view.transform, TRANSFORM_VIEWDEFAULT, @"View transforn not default");  //PikLips: default
    
    if (USERINTERACTIONENABLED_VIEWDEFAULT)
        STAssertTrue(testViewController.view.userInteractionEnabled, @"View's user interaction enabled is NO, not defualt YES");
    else
        STAssertTrue(testViewController.view.userInteractionEnabled, @"View's user interaction is YES, not default NO");
    
    STAssertNotNil(testViewController.view.window, @"View has not been added to window.");
    
    /* PikLips: 
     * view.window read only 
     * nil if receiver has no window object
     */ 
    STAssertEqualObjects(testViewController.view.window, testViewController.view.superview, @"View's superview is not its window");
    
    if (KEYWINDOW_WINDOWDEFAULT)
        STAssertTrue(testViewController.view.window.keyWindow, @"View this is NOT the key window for the application, which is not the default");
    else
        STAssertFalse(testViewController.view.window.keyWindow, @"View is the key window for the application, but not the default");
    
    STAssertNotNil(testViewController.view.window.rootViewController, @"View Controller's view's window;s rootViewController is nil.", skip=YES);
    if (skip) {
        NSLog(@"View's Window does not have rootViewController");
        skip = NO;
    }
    else
        STAssertEqualObjects(testViewController.view.window.rootViewController, testViewController, @"testViewController is not the rootViewController");
    
    STAssertTrueNoThrow([testViewController.view isDescendantOfView: testAppDelegate.window], @"View %@ is not descendant of window %@.", testViewController.view, testAppDelegate.window, skip=YES);
    
    if (skip)
    {
        NSLog(@"View is not a descendant of it's Window.");
        skip = NO;        
    }
    else
        STAssertEquals(testViewController.view.frame.size, [testViewController.view sizeThatFits:testAppDelegate.window.screen.applicationFrame.size], @"Window may not be best sized for its view.  Hint: do you have a status bar?");
    
    NSInteger tagFinder = 0; // PikLips used to search for views
    while (tagFinder < NUMBER_OF_POSSIBLE_TAGS) {
        STAssertNil([testAppDelegate.window viewWithTag:tagFinder], @"Tag %i has view %@", tagFinder, [testAppDelegate.window viewWithTag: tagFinder]);
        tagFinder++;
    }
    NSLog(@"Tests end for view");
}
/* PikLips:
 * Test the View Controller's View instance --
 */
-(void) test7_TheSubview
{
    NSLog(@"Tests begin for subview");
    // Override point for customization after application launch.
    bool skip = NO;
    
    // UIView Class properties -
    STAssertEquals(testSubviewController.view.alpha, ALPHA_VIEWDEFAULT, @"View alpha default %f, not %f", testSubviewController.view.alpha, ALPHA_VIEWDEFAULT);

    STAssertEquals(testViewController.view.autoresizingMask, AUTORESIZINGMASK_VIEWDEFAULT, @"View autoresizingMask is not default, %i, is set to %i", AUTORESIZINGMASK_VIEWDEFAULT, testViewController.view.autoresizingMask);

    if (AUTORESIZESSUBVIEWS_VIEWDEFAULT)
        STAssertTrue(testSubviewController.view.autoresizesSubviews, @"View autoresizeSubviews is not default YES", AUTORESIZESSUBVIEWS_VIEWDEFAULT);
    else STAssertFalse(testSubviewController.view.autoresizesSubviews, @"View autoresizesSubviews is not default NO", AUTORESIZESSUBVIEWS_VIEWDEFAULT);
    
    STAssertEqualObjects(testSubviewController.view.backgroundColor, BACKGROUNDCOLOR_VIEWDEFAULT, @"View default backgroundColor is %@, not default %@", testSubviewController.view.backgroundColor, BACKGROUNDCOLOR_VIEWDEFAULT);
    
    STAssertEquals(testSubviewController.view.bounds, BOUNDS_VIEWDEFAULT, @"View bounds are not default.");
    
    STAssertEquals(testSubviewController.view.center, CENTER_VIEWDEFAULT, @"View center is %f, not default %f", testSubviewController.view.center, CENTER_VIEWDEFAULT);
    
    if (CLEARSCONTEXTBEFOREDRAWING_VIEWDEFAULT)
        STAssertTrue(testSubviewController.view.clearsContextBeforeDrawing, @"View clearsContextBeforeDrawing is NO, not default YES"); //PikLips: default
    else
        STAssertFalse(testSubviewController.view.clearsContextBeforeDrawing, @"View clearsContextBeforeDrawing is YES, not default NO"); //PikLips: default
    
    if (CLIPSTOBOUNDS_VIEWDEFAULT)
        STAssertTrue(testSubviewController.view.clipsToBounds, @"View clipsToBounds is NO, not default YES"); //PikLips: default
    else 
        STAssertFalse(testSubviewController.view.clipsToBounds, @"View clipsToBounds is YES, not default NO"); //PikLips: default
    
    STAssertEquals(testSubviewController.view.contentMode, CONTENTMODE_VIEWDEFAULT, @"View contentMode is %i, not default %i", testSubviewController.view.contentMode, CONTENTMODE_VIEWDEFAULT); //PikLips: default
    
    STAssertEquals(testSubviewController.view.contentScaleFactor, CONTENTSCALEFACTOR_VIEWDEFAULT, @"View contentScalefactor is %f, not default %f", testSubviewController.view.contentScaleFactor, CONTENTSCALEFACTOR_VIEWDEFAULT); //PikLips: default
    
    STAssertEquals(testSubviewController.view.contentStretch, CONTENTSTRETCH_VIEWDEFAULT, @"View contentStretch parameters are not default.");
    
    if (EXCLUSIVETOUCH_VIEWDEFAULT)
        STAssertTrue(testSubviewController.view.exclusiveTouch, @"View exclusiveTouch is NO, not default YES"); //PikLips: default
    else 
        STAssertFalse(testSubviewController.view.exclusiveTouch, @"View exclusiveTouch is YES, not default NO"); //PikLips: default
    
    STAssertEquals(testSubviewController.view.frame, FRAME_VIEWDEFAULT, @"View frame parameters are not default.");
    
    STAssertNil(testSubviewController.view.gestureRecognizers, @"View's list of gesture recognizers for view not null, instead %@", testSubviewController.view.gestureRecognizers, skip=NO);
    
    if (skip) {
        skip = NO;
    }
    else
    {
        for (UIGestureRecognizer *gesture in testSubviewController.view.gestureRecognizers)
        {
            STAssertNil(gesture, @"Window's gesture recognizer is %@", gesture.description); //PikLips: default
        }
    }
    if (HIDDEN_VIEWDEFAULT)
        STAssertTrue(testSubviewController.view.hidden, @"View's hidden is NO, not default YES"); //PikLips: default
    else 
        STAssertFalse(testSubviewController.view.hidden, @"View's hidden is YES, not default NO"); //PikLips: default
    
    STAssertNotNil(testSubviewController.view.layer, @"View layer is nil, not default");
    
    if (MULTIPLETOUCHENABLED_VIEWDEFAULT)
        STAssertTrue(testSubviewController.view.multipleTouchEnabled, @"View multipleTounchEnabled is NO, not default YES"); //PikLips: default
    else 
        STAssertFalse(testSubviewController.view.multipleTouchEnabled, @"View multipleTounchEnabled is YES, not default "); //PikLips: default
    
    if (OPAQUE_VIEWDEFAULT)
        STAssertTrue(testSubviewController.view.opaque, @"View opaque is NO, not defualt YES"); //PikLips: default
    else
        STAssertFalse(testSubviewController.view.opaque, @"View opaque is YES, not default NO"); //PikLips: default
    
    /* PikLips: 
     * subveiws read only
     */
    STAssertEquals(testSubviewController.view.subviews.count, SUBVIEWSCOUNT_VIEWDEFAULT, @"View has %i subviews: %@", testSubviewController.view.subviews.count, testSubviewController.view.subviews, skip = NO);
    if (skip) {
        NSLog(@"View does not have subviews");
        skip = NO;
    }
    else
    {
        NSLog(@"View's subview %@", testSubviewController.view.subviews.description);
        STAssertEqualObjects(testSubviewController.view, [testAppDelegate.window hitTest:CGPointMake(160, 240) withEvent:nil], @"Subview is not active, visible, and in center of window");
    }
    /* PikLips:
     * superview read only
     */
    STAssertNotNil(testSubviewController.view.superview, @"View does not have a superview."); 
    
    STAssertEquals(testSubviewController.view.tag, TAG_VIEWDEFAULT, @"View's tag is not default %i has assigned tag of %i", TAG_VIEWDEFAULT, testSubviewController.view.tag);
    
    STAssertEquals(testSubviewController.view.transform, TRANSFORM_VIEWDEFAULT, @"View transforn not default");  //PikLips: default
    
    if (USERINTERACTIONENABLED_VIEWDEFAULT)
        STAssertTrue(testSubviewController.view.userInteractionEnabled, @"View's user interaction enabled is NO, not defualt YES");
    else
        STAssertTrue(testSubviewController.view.userInteractionEnabled, @"View's user interaction is YES, not default NO");
    
    STAssertNotNil(testSubviewController.view.window, @"View has not been added to window.");
    
    /* PikLips: 
     * view.window read only 
     * nil if receiver has no window object
     */ 
    STAssertEqualObjects(testSubviewController.view.window, testSubviewController.view.superview, @"View's superview is not its window");
    
    if (KEYWINDOW_WINDOWDEFAULT)
        STAssertTrue(testSubviewController.view.window.keyWindow, @"View this is NOT the key window for the application, which is not the default");
    else
        STAssertFalse(testSubviewController.view.window.keyWindow, @"View is the key window for the application, but not the default");
    
    STAssertNotNil(testSubviewController.view.window.rootViewController, @"View Controller's view's window;s rootViewController is nil.", skip=YES);
    if (skip) {
        NSLog(@"View's Window does not have rootViewController");
        skip = NO;
    }
    else
        STAssertEqualObjects(testSubviewController.view.window.rootViewController, testSubviewController, @"testSubviewController is not the rootViewController");
    
    STAssertTrueNoThrow([testSubviewController.view isDescendantOfView: testAppDelegate.window], @"View %@ is not descendant of window %@.", testSubviewController.view, testAppDelegate.window, skip=YES);
    if (skip)
    {
        NSLog(@"Subview is not a descendant of it's Window.");
        skip = NO;        
    }
    else
        STAssertEquals(testAppDelegate.window.bounds.size, [testSubviewController.view sizeThatFits:testAppDelegate.window.screen.applicationFrame.size], @"Window may not be best sized for its subview Subview. Hint: Did you deliberately make it smaller or include the status or nav bars?");
    
    
    STAssertTrueNoThrow([testSubviewController.view isDescendantOfView: testViewController.view], @"View %@ is not descendant of view %@.", testSubviewController.view, testViewController.view, skip=YES);
    if (skip)
    {
        NSLog(@"Subview is not a descendant of View.");
        skip = NO;        
    }
    else
        STAssertEquals(testViewController.view.bounds.size, [testSubviewController.view sizeThatFits:testViewController.view.frame.size], @"View may not be best sized for its subview.");
    
    
    NSLog(@"Tests end for subview");
}
/* PikLips: Test view interactions
 * These test the shuffling of the two views using a number of instance and class methods.
 *
 */
- (void) test8_Views
{
    NSLog(@"Tests to exercise views begins.");
    bool skip = NO; // PikLips: for testing
    /* PikLips:
     * This will first list all the views, including ones you may not even know
     * are in your project.  We will do this again after changing them.
     */
    [self spanTheTree2:[[UIApplication sharedApplication] keyWindow] depth:0];
    
    // PikLips: these exercise the views by shuffling them --
    STAssertNoThrow([testAppDelegate.window bringSubviewToFront: testViewController.view], @"View not brought to front.", skip = YES);
    STAssertEqualObjects(testViewController.view, [testAppDelegate.window.subviews lastObject], @"ViewController.view not brought forth - %@", testAppDelegate.window.subviews);
    if (skip)
    {
        skip = NO;
        STAssertNoThrow([testAppDelegate.window exchangeSubviewAtIndex: 0 withSubviewAtIndex: 1], @"Views not exchanged", skip=YES);
    }
    else
    {
        STAssertNoThrow([testAppDelegate.window sendSubviewToBack: testViewController.view], @"View not returned to back.", skip=YES);
    }
    STAssertEqualObjects(testSubviewController.view, [testAppDelegate.window.subviews lastObject], @"SubviewController.view not brought forth - %@", testAppDelegate.window.subviews);
    
    if (skip)
    {
        skip = NO;
        NSLog(@"Problems occurred arranging views order");
    }
    else
    {
        STAssertNoThrow([UIView transitionWithView:testAppDelegate.window
                                          duration:1.0 
                                           options:UIViewAnimationOptionTransitionFlipFromRight 
                                        animations:^{[testViewController.view setBackgroundColor: [UIColor redColor]]; [testViewController.view removeFromSuperview]; [testAppDelegate.window addSubview:testViewController.view]; [testAppDelegate.window sendSubviewToBack: testViewController.view];} 
                                        completion:NULL], @"Views not exchanged.");
    }
    
    /* PikLips: these report on the order of the views, based on their tag numbers.  For these tests to work
     * you need to include links to every window in your project (usually there is only one).     
     */
    for (UIView *eachView in testAppDelegate.window.subviews)
    {
            [self spanTheTree:eachView];
    }
    /* PikLips:
     * This will finally list all the views, reflecting changes made by
     * the tests. 
     */
    [self spanTheTree2:[[UIApplication sharedApplication] keyWindow] depth:0];
     
    /* PikLips: This set of tests determines whether the view is visible. The point is not to prove
     * the obvious, but to show that the visible view is not the view you thnk.   This also requires
     * links to all views & windows in your project.  Without those, it will not be possible to
     * tell if one view has blocked all others.

     */
    
    /* PikLips: This set of tests tell whether the view is set to respond to touches and whether it is
     * blocked from getting them by another view.
     */
    
    
    NSLog(@"Tests to exercise views ends results - %@.", testAppDelegate.window.subviews);
    
}

@end
