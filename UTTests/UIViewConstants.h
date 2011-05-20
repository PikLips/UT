//
//  UIViewConstants.h
//  PikLipsUIViewExample
//
//  Created by Michael Smith on 3/1/11.
//  Copyright 2011 PikLips LLC. 
//  MIT Open Source License, see license.txt for details.
//
#import <Foundation/Foundation.h>
/* PikLips:
 * These are the default values for the UIView parameters used in testing window.  
 * They are created by Xcode when the project is created.
 * For details, see https://developer.apple.com/library/ios/#documentation/UIKit/Reference/UIWindow_Class/UIWindowClassReference/UIWindowClassReference.html
 * and https://developer.apple.com/library/ios/#documentation/UIKit/Reference/UIView_Class/UIView/UIView.html
 * These are used by the sample code and test code.
 * 
 * There are three of each.  One is for a UIView, the second is for UIWindow
 * and the third is for use in the Model (Business), which means the default
 * is whatever the programmer makes it for the application.
 */

/* PikLips:
 * This is the transparency/opaqueness of the view.  It is dependent
 * on the opaque property (see below) being set to NO is its value is less than 1.0.
 * If its is less than 1.0 and opaque="YES" then "results are unpredictable."
 */
#define ALPHA_VIEWDEFAULT                           (CGFloat) 1.0
#define ALPHA_WINDOWDEFAULT                         (CGFloat) 1.0
#define ALPHA_DEFAULT                               (CGFloat) 0.0
/* PikLips: 
 * The range is 1.0 -- totally opaque 
 * To 0.0 -- transparent
 */


/* PikLips:
 * This affects the way that a view's subviews will change in response
 * to the view's bounds changing.  This depends on each subview's autoresizingMask
 * to adjust each subview properly.
 */
#define AUTORESIZESSUBVIEWS_VIEWDEFAULT             (bool) YES
#define AUTORESIZESSUBVIEWS_WINDOWDEFAULT           (bool) YES
#define AUTORESIZESSUBVIEWS_DEFAULT                 (bool) YES
/* PikLips: boolean value
 */

/* PikLips: 
 * This determines how THIS view will change when/if its superview's
 * bounds change AND IF the superview has autoresizingSubview = "YES".
 * These values get OR'd together.
 */
#define AUTORESIZINGMASK_VIEWDEFAULT                (UIViewAutoresizing) UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin
#define AUTORESIZINGMASK_WINDOWDEFAULT              (UIViewAutoresizing) UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth
#define AUTORESIZINGMASK                            (UIViewAutoresizing) UIViewAutoresizingNone
/* PikLips:
 * UIViewAutoresizingFlexibleBottomMargin
 * UIViewAutoresizingFlexibleLeftMargin
 * UIViewAutoresizingFlexibleHeight
 * UIViewAutoresizingFlexibleRightMargin
 * UIViewAutoresizingFlexibleTopMargin
 * UIViewAutoresizingFlexibleWidth
 * UIViewAutoresizingNone
 */

/* PikLips: the iOS Reference Library indicates the default color for a view is nil.
 * This is the color of the empty view.  You can also specify a pattern
 * or an image.
 */
#define BACKGROUNDCOLOR_VIEWDEFAULT                 [UIColor colorWithRed: (CGFloat) 0.75 green: (CGFloat) 0.75 blue:(CGFloat) 0.75 alpha: (CGFloat) 1.0]
#define BACKGROUNDCOLOR_WINDOWDEFAULT               [UIColor colorWithRed: (CGFloat) 1.0 green: (CGFloat) 1.0 blue:(CGFloat) 1.0 alpha: (CGFloat) 1.0]
#define BACKGROUNDCOLOR_DEFAULT                     [UIColor colorWithRed: (CGFloat) 1.0 green: (CGFloat) 1.0 blue:(CGFloat) 1.0 alpha: (CGFloat) 1.0]
/* PikLips:  ranges of values and other options --
 * [UIColor colorWithRed: (CGFloat) 0.0 green: (CGFloat) 0.0 blue:(CGFloat) 0.0 alpha: (CGFloat) 0.0]
 * [UIColor colorWithRed: (CGFloat) 1.0 green: (CGFloat) 1.0 blue:(CGFloat) 1.0 alpha: (CGFloat) 1.0]
 * [UIColor blackColor]
 * [UIColor blueColor]
 * [UIColor brownColor]
 * [UIColor clearColor]
 * [UIColor cyanColor]
 * [UIColor darkGrayColor]
 * [UIColor darkTextColor]
 * [UIColor grayColor]
 * [UIColor greenColor]
 * [UIColor groupTableViewBackgroundColor]
 * [UIColor lightGrayColor]
 * [UIColor lightTextColor]
 * [UIColor magentaColor]
 * [UIColor orangeColor]
 * [UIColor purpleColor]
 * [UIColor redColor]
 * [UIColor scrollViewTexturedBackgroundColor]
 * [UIColor viewFlipsideBackgroundColor]
 * [UIColor whiteColor]
 * [UIColor yellowColor]
 *
 * Even a picture in the background --
 * [UIColor colorWithPatternImage:[UIImage imageNamed:@"YourImage.png"]]
 * Resizing may be a problem; this is not the same as an ImageView.
 *
 */

/* PikLips:
 * The bounds are that part of the view that is seen in the frame.  The
 * content of a view can be bigger than the part in the frame, just
 * like the view out fo a window can be much larger than what can be seen through it.
 * These numbers specify what part of the view is positioned to be 
 * shown in the frame.  If your view is the same size as your frame,
 * then the bounds are the same same size with an origin of (0,0).
 * Shrink the frame size and the view (bounds) either gets smaller or
 * the things in the view must get smaller.
 * To move a subview within a view, change the center (below) and the 
 * bounds and the frame will follow.
 */
#define BOUNDS_VIEWDEFAULT                          CGRectMake((CGFloat) 0.0, (CGFloat) 0.0, (CGFloat) 320.0, (CGFloat) 460.0)
#define BOUNDS_WINDOWDEFAULT                        CGRectMake((CGFloat) 0.0, (CGFloat) 0.0, (CGFloat) 320.0, (CGFloat) 480.0)
#define BOUNDS_DEFAULT                              CGRectMake((CGFloat) 0.0, (CGFloat) 0.0, (CGFloat) 320.0, (CGFloat) 480.0)
/* PikLips:
 * Limits for iPhone/iPod Touch (origin's x, y  & height, width)
 * CGRectMake((CGFloat) 0.0, (CGFloat) 0.0, (CGFloat) 320.0, (CGFloat) 480.0)
 * CGRectMake((CGFloat) 320.0, (CGFloat) 480.0, (CGFloat) 0.0, (CGFloat) 0.0)
 *
 */

/* PikLips:
 * This is the center of the frame from the perspective of the view's 
 * superview.  Changing this moves the frame but may not always
 * refresh the view in the way you might want.  For that you may
 * need to call drawRect by setting contentMode (below) to
 * UIViewContentModeRedraw.
 */
#define CENTER_VIEWDEFAULT                          CGPointMake((CGFloat) 160.0, (CGFloat) 250.0)
#define CENTER_WINDOWDEFAULT                        CGPointMake((CGFloat) 160.0, (CGFloat) 240.0)
#define CENTER_DEFAULT                              CGPointMake((CGFloat) 160.0, (CGFloat) 240.0)
/* PikLips:
 * Limits for iPhone/iPod touch (origin x,y)
 * CGPointMake((CGFloat) 0.0, (CGFloat) 0.0)
 * CGPointMake((CGFloat) 320.0, (CGFloat) 480.0)
 */

/* PikLips: the iOS Reference Library indicates a default of YES for a view.
 * This is an optimizing property and usualy never turned off unless
 * you are trying to get things to run really fast.
 */
#define CLEARSCONTEXTBEFOREDRAWING_VIEWDEFAULT      (bool) NO
#define CLEARSCONTEXTBEFOREDRAWING_WINDOWDEFAULT    (bool) NO
#define CLEARSCONTEXTBEFOREDRAWING_DEFAULT          (bool) NO
/* PikLips: boolean value
 */

/* PikLips:
 * This restricts the subviews frames to the frame (visible bounds)
 * of the view.  Set to 'YES' this lets subviews be as big as the screen
 * even if their superview is too small to be seen (hint).
 */
#define CLIPSTOBOUNDS_VIEWDEFAULT                   (bool) NO
#define CLIPSTOBOUNDS_WINDOWDEFAULT                 (bool) NO
#define CLIPSTOBOUNDS_DEFAULT                       (bool) NO
/* PikLips: boolean value
 */

/* PikLips: 
 * This defines how the contents of the view (what you see) gets
 * changed when the bounds of its view changes. Values are OR'd
 * together to determine how the scaling goes. Think "Hall of
 * Mirrors" effect  with your feet = UIContentModeBottom.  If 
 * you want to really change the view by having it redrawn,
 * use setNeedsDisplay or setNeedsDisplayInRect.
 */
#define CONTENTMODE_VIEWDEFAULT                     (UIViewContentMode) UIViewContentModeScaleToFill
#define CONTENTMODE_WINDOWDEFAULT                   (UIViewContentMode) UIViewContentModeScaleToFill
#define CONTENTMODE_DEFAULT                         (UIViewContentMode) UIViewContentModeScaleToFill
/* PikLips: what to you want to pin down?
 * UIViewContentModeBottom
 * UIViewContentModeBottomLeft
 * UIViewContentModeBottomRight
 * UIViewContentModeCenter
 * UIViewContentModeLeft
 * UIViewContentModeRedraw
 * UIViewContentModeRight
 * UIViewContentModeScaleAspectFill
 * UIViewContentModeScaleAspectFit
 * UIViewContentModeScaleToFill
 * UIViewContentModeTop
 * UIViewContentModeTopLeft
 * UIViewContentModeTopRight
 */

/* PikLips:
 * Mostly used with OpenGL, this is usually set to 1.0 and corresponds
 * to the number of screen pixels to coordinate space points.  This
 * likely might be important is you want the best resolution on 
 * an iPad (1024x768).
 */
#define CONTENTSCALEFACTOR_VIEWDEFAULT              (CGFloat) 1.0
#define CONTENTSCALEFACTOR_WINDOWDEFAULT            (CGFloat) 1.0
#define CONTENTSCALEFACTOR_DEFAULT                  (CGFloat) 1.0
/* PikLips: 
 * pixel to points ratio
 * iPhone 3 -- view.contentScaleFactor = 1.0;  // used with iPhone 4, too, to save resources
 * iPhone 4 -- view.cntentScaleFactor = 2.0; // rarely used
 * iPad 1 -- view.contentScaleFactor = 2.0; // more likely used
 *
 * see UIDevice userInterfaceIdiom = UIUserInterfaceIdiomPhone | UIUserInterfaceIndiomPad;
 */

/* PikLips:
 * This property is just enough like contentMode to be confusing.
 * If contentMode pins down edges, this specifies the elasticity of the 
 * inside portions.  Therefore, (0.0, 0.0)(1.0, 1.0) makes the entire
 * area stretch uniformly, and (1.0, 1.0)(0.0, 0.0) makes nothing
 * stretch.  The confusing part is mapping an area, say 50 high
 * and 80 wide, to 0.0 - 1.0 (like 0% to 100%).  An origin of (25, 40)
 * would be (0.5, 0.5), and an area (40, 20) would be (0.8, 0.25).
 */
#define CONTENTSTRETCH_VIEWDEFAULT                  CGRectMake((CGFloat) 0.0, (CGFloat) 0.0, (CGFloat) 1.0, (CGFloat) 1.0)
#define CONTENTSTRETCH_WINDOWDEFAULT                CGRectMake((CGFloat) 0.0, (CGFloat) 0.0, (CGFloat) 1.0, (CGFloat) 1.0)
#define CONTENTSTRETCH_DEFAULT                      CGRectMake((CGFloat) 0.0, (CGFloat) 0.0, (CGFloat) 1.0, (CGFloat) 1.0)
/* PikLips:
 * Limits for iPhone/iPod Touch (origin's x, y  & height, width)
 * CGRectMake((CGFloat) 0.0, (CGFloat) 0.0, (CGFloat) 320.0, (CGFloat) 480.0)
 * CGRectMake((CGFloat) 320.0, (CGFloat) 480.0, (CGFloat) 0.0, (CGFloat) 0.0)
 */

/* PikLips:
 * This restricts this responder from touch gestures.  If you set this
 * to YES while calling bringSubViewToFront, you may lock up you
 * application by making it untouchable.  Fathers wish they had
 * this setting on their daughters.
 */
#define EXCLUSIVETOUCH_VIEWDEFAULT                  (bool) NO
#define EXCLUSIVETOUCH_WINDOWDEFAULT                (bool) NO
#define EXCLUSIVETOUCH_DEFAULT                      (bool) NO
/* PikLips: boolean value
 */

/* PikLips: iPhone Specific values, e.g., 320, 480 or 768, 1024
 * The frame is a poor metaphor, as it implies rigidity.  This is more
 * like a water balloon that can change to fit its contents (well, 
 * except that it is always a rectangle).  The frame is what the 
 * superview 'sees', unaware that the subview's bounds may be bigger 
 * than the screen.  The part that confuses most people is whether to 
 * include the status bar when specifying "full screen" frames (the
 * answer is usually 'no').
 */
#define FRAME_VIEWDEFAULT                           CGRectMake((CGFloat) 0.0, (CGFloat) 20.0, (CGFloat) 320.0, (CGFloat) 460.0)
#define FRAME_WINDOWDEFAULT                         CGRectMake((CGFloat) 0.0, (CGFloat) 0.0, (CGFloat) 320.0, (CGFloat) 480.0)
#define FRAME_DEFAULT                               CGRectMake((CGFloat) 0.0, (CGFloat) 0.0, (CGFloat) 320.0, (CGFloat) 480.0)
/* PikLips: 
 * usually for a UIWindow -- window.frame = window.screen.bounds;
 * for a view, usually excludes the status bar - view.frame = window.screen.applicationFrame;
 */

/* PikLips:
 * The default is an empty array, which gets filled by using
 * addGestureRecognizer:. The best way to test for it is to use
 * its count (see below).
 */
#define GESTURERECOGNIZER_DEFAULT                   NSArray *empty

/* PikLips:
 * 
 */
#define GESTURERECOGNIZERCOUNT_VIEWDEFAULT          (NSUInteger) 0
#define GESTURERECOGNIZERCOUNT_WINDOWDEFAULT        (NSUInteger) 0
#define GESTURERECOGNIZERCOUNT_DEFAULT              (NSUInteger) 0
/* PikLips:
 * This property is simple and not to be confused with alpha = 0.0 or
 * opaque = NO, which behave almost the same.  Good ways to lose track 
 * of a subview is to set hidden=YES, opaque=NO, or alpha=0.0 while 
 * calling sendSubviewToBack:
 */
#define HIDDEN_VIEWDEFAULT                          (bool) NO
#define HIDDEN_WINDOWDEFAULT                        (bool) NO
#define HIDDEN_DEFAULT                              (bool) NO
/* PikLips:
 * Limits for iPhone/iPod Touch (origin's x, y  & height, width)
 * CGRectMake((CGFloat) 0.0, (CGFloat) 0.0, (CGFloat) 320.0, (CGFloat) 480.0)
 * CGRectMake((CGFloat) 320.0, (CGFloat) 480.0, (CGFloat) 0.0, (CGFloat) 0.0)
 *
 */

/* PikLips:
 * This is a UIWindow property, and should not apply to UIView,
 * but UIView will take it without complaining.  It indicaes the
 * receiver for keyboard and "non-touch related events."
 */
#define KEYWINDOW_VIEWDEFAULT                       (bool) NO
#define KEYWINDOW_WINDOWDEFAULT                     (bool) YES
#define KEYWINDOW_DEFAULT                           (bool) NO
/* PikLips: UIWindow Property
 * boolean value
 */

/* PikLips:
 * This indicates the view's layer's delegate, see layerClass.
 * If you need to change the delegate, say to OpenGL's CAEAGLLayer,
 * override layerClass with a subclass.
 */
#define LAYERCLASS_VIEWDEFAULT                      (Class) CALayer
#define LAYERCLASS_WINDOWDEFAULT                    (Class) CALayer
#define LAYERCLASS_DEFAULT                          (Class) CALayer

/* PikLips:
 * This allows the view to receive pinches and other gestures that
 * have more than one touch.  Boyfriends wish their girlfriends
 * had this setting, but dad's exclusiveTouch=NO overrides this.
 */
#define MULTIPLETOUCHENABLED_VIEWDEFAULT            (bool) NO
#define MULTIPLETOUCHENABLED_WINDOWDEFAULT          (bool) NO
#define MULTIPLETOUCHENABLED_DEFAULT                (bool) NO
/* PikLips: boolean value
 */

/* PikLips:
 * This implies that the view is solid, but does not guarantee it.
 * The docs say it "provides a hint."  If set to NO, you can still
 * have a completely opaque view if alpha = 1.0 and backgroundColor
 * is not [UIColor clearColor].  Note: setting opaque to YES and alpha 
 * to 1.0 then setting the colors of the objects (including the 
 * backgroundColor) in the view to [UIColor clearColor] or [UIColor 
 * colorWithRed: (CGFloat) 1.0 green: (CGFloat) 1.0 blue:(CGFloat) 
 * 1.0 alpha: (CGFloat) 0.0] will make everything transparent anyway.
 * 
 */
#define OPAQUE_VIEWDEFAULT                          (bool) YES
#define OPAQUE_WINDOWDEFAULT                        (bool) NO
#define OPAQUE_DEFAULT                              (bool) NO
/* PikLips: boolean value
 */

/* PikLips;
 * This is also a UIWindow property, defined to tell the screen that 
 * the Window is displayed upon.  Almost always, it it the screen in 
 * the iPhone/iPod/iPad. However, external monitors can be tied to the
 * these devices, especially the iPad 2.  When they are, this property
 * lets you know.
 */
#define SCREEN_WINDOWDEFAULT                        [UIScreen mainScreen]
#define SCREEN_DEFAULT                              nil
/* Piklips: UIWindow Property Only
 * others found in 
 * int i=0;
 * do
 * {
 *    x = [window.screen.screens objectAtIndex: i];
 * } while (++i < window.screen.scrrens.count;
 * OR -
 * for (UIScreen *theScreen in window.sceen.screens) {
 *    x = theScreen;
 * };
 */

/* PikLips:
 * This contains a NSArray of UIViews, each a subview of this UIView
 * or UIWindow.  It is read only.  To change the subviews, use 
 * methods such as addSubview, removeFromSuperView, transitionFromView,
 * etc.
 */
#define SUBVIEWS_VIEWDEFAULT                        NSArray
#define SUBVIEWS_WINDOWDEFAULT                      NSArray
#define SUBVIEWS_DEFAULT                            NSArray

/* PikLips:
 * This is a property of view.subviews that reveals how many
 * subviews exist for a view.  It is handy to use as a way of 
 * determining how many subviews, if any, are in view.subviews.
 */
#define SUBVIEWSCOUNT_VIEWDEFAULT                   (NSUInteger) 0
#define SUBVIEWSCOUNT_WINDOWDEFAULT                 (NSUInteger) 1
#define SUBVIEWSCOUNT_DEFAULT                       (NSUInteger) 2
/* PikLips:
 * user specified
 * some apps may have all views (subviews) be descendants of window
 */

/* PikLips:
 * This propery is the view's superview, which might also  be its
 * window, or as they say in Xode - (view.window == view.superview).
 * In a View-based application template with one view, this should
 * be true (until you change it).
 */ 
#define SUPERVIEW_VIEWDEFAULT                       nil
#define SUPERVIEW_WINDOWDEFAULT                     nil
#define SUPERVIEW_DEFAULT                           nil
/* PikLips:
 * At least one view should have superview = view.window.
 */

/* PikLips:
 * The tag is a convenience property that allows you to keep 
 * track of your subviews and other UI objects.  An NSInteger that
 * could be treated like an index, it would only work as such if 
 * you keep track of them as you alloc/init and release/dealloc them.
 */
#define TAG_VIEWDEFAULT                             (NSInteger) 0
#define TAG_WINDOWDEFAULT                           (NSInteger) 0
#define TAG_DEFAULT                                 (NSInteger) 0
#define NUMBER_OF_POSSIBLE_TAGS                     (NSInteger) 50 // PikLips: used to test for views in project, adjust accordingly

/* PikLips: 
 * user defined, see tagSet
 */

/* PikLips:
 * If you think about a view's frame being in the set of coordinates 
 * that correspond to its superview's bounds, then you can envision a 
 * mapping between the bounds of the superview and the frame of its
 * subview.  E.g., frame's origin, (0.0, 0.0) = superview point (34,27).
 * Transform remaps the two sets, allowing you to redraw the view in
 * its superview in any 2D way.
 * This transform is the default mapping of the view into its superview.
 * Note that the view's default transform is not the 
 * CGAffineTransformIdentity (see below).
 * Fortunately, these do not need to be recreated to be manipulated.
 * Methods like CGAffineTransformScale do that for you.
 */
#define TRANSFORM_VIEWDEFAULT                       CGAffineTransformMake((CGFloat) 1.0, (CGFloat) 0.0, (CGFloat) 0.0, (CGFloat) 1.0, (CGFloat) 0.0, (CGFloat) 0.0)
#define TRANSFORM_WINDOWDEFAULT                     CGAffineTransformIdentity
#define TRANSFORM_DEFAULT                           CGAffineTransformIdentity
/* PikLips:
 * Create custom --
 * CGAffineTransformMake((CGFloat) 0.0, (CGFloat) 0.0, (CGFloat) 0.0, (CGFloat) 0.0 (CGFloat) 0.0, (CGFloat) 0.0)
 * CGAffineTransformMake((CGFloat) 1.0, (CGFloat) 1.0, (CGFloat) 1.0, (CGFloat) 1.0 (CGFloat) 1.0, (CGFloat) 1.0)
 * More commonly used - (displace context by x & y axis)--
 * CGContextTranslateCTM((CGContextRef) [[NSGraphicsContext currentContext] graphicsPort], (GFloat) 0.0, (CGFloat) 0.0)
 * CGContextScaleCTM((CGContextRef) [[NSGraphicsContext currentContext] graphicsPort], (GFloat) 0.0, (CGFloat) 0.0)
 * CGContextRotateCTM((CGContextRef) [[NSGraphicsContext currentContext] graphicsPort], (GFloat) 0.0, (CGFloat) 0.0)
 */

/* PikLips:
 * This switches on/off the view's ability to receive user events.
 * Like exclusiveTouch and multipleTouchEnabled, this can make
 * your app untouchable.
 */
#define USERINTERACTIONENABLED_VIEWDEFAULT          (bool) YES
#define USERINTERACTIONENABLED_WINDOWDEFAULT        (bool) YES
#define USERINTERACTIONENABLED_DEFAULT              (bool) YES
/* PikLips: boolean value
 */

/* PikLips:
 * This is the view's window or nil if it has none, which is the case
 * until it has been added (e.g., addSubview).  It is a good test to
 * see if your view is there.
 */
#define WINDOW_VIEWDEFAULT                          nil
#define WINDOW_WINDOWDEFAULT                        nil
#define WINDOW_DEFAULT                              nil
/* PikLips:
 * Possible values --
 * usually window.window = nil;
 * usually first view.window = view.superview;
 */

/* PikLips:
 * This is a UIWindow property that indicates what kind of window, 
 * and therefore, the level of that window.  There are three.
 */
#define WINDOWLEVEL_VIEWDEFAULT                     (UIWindowLevel) UIWindowLevelNormal
#define WINDOWLEVEL_WINDOWDEFAULT                   (UIWindowLevel) UIWindowLevelNormal
#define WINDOWLEVEL_DEFAULT                         (UIWindowLevel) UIWindowLevelNormal
/* UIWindow property
 * typedef CGFloat UIWindowLevel -- 
 * UIWindowLevelNormal
 * UIWindowLevelAlert
 * UIWindowLevelStatusBar
 */


/* PikLips:
 * end defines
 */

@protocol PikLipsConstants <NSObject>

@end
