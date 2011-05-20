//
//  UTSubviewController.m
//  UT
//
//  Created by Michael Smith on 3/3/11.
//  Copyright 2011 PikLips LLC. 
//  MIT Open Source License, see license.txt for details.
//

#import "UTSubviewController.h"


@implementation UTSubviewController
// PikLips: added code --
@synthesize  uTPanColorControlGesture, uTPinchGesture, uTRotationGesture, uTTapGesture; // PikLips: builds setters/getters

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
// PikLips: added code -
    [uTPanColorControlGesture release]; // PikLips: memory management    
    [uTPinchGesture release]; // PikLips: memory management
    [uTRotationGesture release]; // PikLips: memory management   
    [uTTapGesture release]; // PikLips: memory management
// PikLips: code ends
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
    /* PikLips: added code --
     * Allocate an instance of the UIView that is centered but only one fourth the size
     * of an iPhone screen (minus the status bar, which is 20x320) in points not pixels,
     * just so that it will stand out in the example and flag some default test 'errors' --
     */
    self.view = [[UTView alloc] initWithFrame:CGRectMake((CGFloat) 80.0, (CGFloat) 115.0, (CGFloat) 160.0, (CGFloat) 230.0)]; // PikLips:  special size to allow the view to be seen behind it.
// PikLips: code ends
}



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];

/* PikLips: added code --
 * These are the latest gesture recognizers, which reduce the UIEven/UITouch coding required to 
 * pick up a tap. pinch, pan, swipe, or rotate gesture.  This code associates the declared event
 * handlers in the header with methods (below) that handle the results of the gesture, such as
 * the distance, velocity, etc.
 */
    
    /* PikLips: 
     * Create a pan gesture recognizer for the subview.
     */
    UIGestureRecognizer *panColorControlGesture = [[UIPanGestureRecognizer alloc] 
                                                   initWithTarget:self 
                                                   action:@selector(handlePanColorControlGesture:)]; // PikLips:
    [self.view addGestureRecognizer:panColorControlGesture]; // PikLips:
    self.uTPanColorControlGesture = (UIPanGestureRecognizer *)panColorControlGesture; // PikLips:
    panColorControlGesture.delegate = self; // PikLips:
    [panColorControlGesture release]; // PikLips:
    
    /* PikLips
     * Create a pinch gesture recognizer for the subview.
     */
    UIGestureRecognizer *pinchGesture = [[UIPinchGestureRecognizer alloc] 
                                         initWithTarget:self 
                                         action:@selector(handlePinchGesture:)]; // PikLips:
    [self.view addGestureRecognizer:pinchGesture]; // PikLips:
    self.uTPinchGesture = (UIPinchGestureRecognizer *)pinchGesture; // PikLips:
    pinchGesture.delegate = self; // PikLips:
    [pinchGesture release]; // PikLips:
    
    /* PikLips
     * Create a rotation gesture recognizer for the subview.
     */
	UIGestureRecognizer *rotationGesture = [[UIRotationGestureRecognizer alloc] 
                                            initWithTarget:self 
                                            action:@selector(handleRotationGesture:)]; // PikLips:
	[self.view addGestureRecognizer:rotationGesture]; // PikLips:
    self.uTRotationGesture = (UIRotationGestureRecognizer *)rotationGesture; // PikLips:
    rotationGesture.delegate = self; // PikLips:
	[rotationGesture release]; // PikLips:
    
    /* PikLips
     * Create a tap gesture recognizer for the subview.
     */
	UIGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] 
                                       initWithTarget:self 
                                       action:@selector(handleTapGesture:)]; // PikLips: assign our method
	[self.view addGestureRecognizer:tapGesture]; // PikLips: add to window (view)
    self.uTTapGesture = (UITapGestureRecognizer *)tapGesture; // PikLips: make public
    tapGesture.delegate = self; // PikLips: make this class be the delegate 
	[tapGesture release]; // PikLips: then release it
// PikLips: code ends
    
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (YES); // interfaceOrientation == UIInterfaceOrientationPortrait);
}

/* PikLips: added code --
 * These are the event handlers for the gestures.  They get the results of the gesture
 * without having to figure out what the gesture was (e.g., pan verses swipe).
 */

/* PikLips:
 * This changes the background color of the subview.  It uses pans to control imaginary RGB 
 * color bars, divided into thirds of the view, see illustration.
 * To change each primary color, you pan up or down.  To change the alpha, pan right or left.
 * Black is all down and white is all up.  Pan left to increase alpha to 1.0 (visible), right
 * to 0.0 (transparent).
 */
- (IBAction) handlePanColorControlGesture:(UIPanGestureRecognizer *) sender {
    CGPoint rgbPoint = [sender locationInView:self.view]; // PikLips:
    CGPoint translate = [sender velocityInView:self.view]; // PikLips:
    
    // PikLips: get the current view background color --
    UIColor * uTNewColor = self.view.backgroundColor; // PikLips: baseline
    CGColorRef uTCGColor = uTNewColor.CGColor; // PikLips: extract values
    const CGFloat *uTColorComponents = CGColorGetComponents(uTCGColor); // PikLips: parse them
    float uTRed = uTColorComponents[0]; // PikLips: 
    float uTGreen = uTColorComponents[1]; // PikLips:
    float uTBlue = uTColorComponents[2]; // PikLips:
    float uTAlpha = uTColorComponents[3]; // PikLips: 
    
    int uTComponentIndex = floor((rgbPoint.x / (self.view.frame.size.width / 3)));   // PikLips: this is a third of the frame
    float uTColor = 0;
    if ((uTColorComponents[uTComponentIndex] >= (float) 0.0) &&
        (uTColorComponents[uTComponentIndex] <= (float) 1.0)) {  // PikLips:
        uTColor = uTColorComponents[uTComponentIndex] - (translate.y / 5000); // PikLips:
        if (uTColor < 0.0) uTColor = 0.0; // PikLips:
        if (uTColor > 1.0) uTColor = 1.0; // PikLips:
    } // PikLips:
    else NSLog(@"invalid color %f", uTColorComponents[uTComponentIndex]);
    
    if ((uTAlpha >= (float) 0.0) &&
        (uTAlpha <= (float) 1.0)) {  // PikLips:
        uTAlpha = uTAlpha - (translate.x / 5000); // PikLips:
        if (uTAlpha < 0.0) uTAlpha = 0.0; // PikLips:
        if (uTAlpha > 1.0) uTAlpha = 1.0; // PikLips
    } // PikLips:
    
    switch (uTComponentIndex) {
        case 0:
            uTRed = uTColor;
            break;
        case 1:
            uTGreen = uTColor;
            break;
        case 2:
            uTBlue = uTColor;
            break;
        default:
            break;
    }
    self.view.backgroundColor = [UIColor colorWithRed: (uTRed) green: (uTGreen) blue: (uTBlue) alpha: uTAlpha]; // PikLips:
    
}

/* PikLips:
 * This resizes the subview --
 */
- (IBAction) handlePinchGesture:(UIGestureRecognizer *) sender {
    CGFloat factor = [(UIPinchGestureRecognizer *) sender scale]; // PikLips:
    self.view.transform = CGAffineTransformScale(self.view.transform, factor, factor); // PikLips:
}

/* PikLips:
 * This rotates the subview
 */
- (IBAction) handleRotationGesture:(UIRotationGestureRecognizer *)sender {
    // PikLips: apply the amount of the rotation (in radians) to the current transform to get the new position --
    self.view.transform = CGAffineTransformRotate(self.view.transform, [sender rotation]); // PikLips:
}

/* PikLips:
 * This hides or unhides the subview using an animation to make the prior state "ease out."
 * The hidden property cannot be animated, so we animate the alpha instead to get the 
 * effect, restoring it to its original value after we hide or before we unhide.
 */
- (IBAction) handleTapGesture:(UITapGestureRecognizer *)sender {
    if (self.view.hidden == NO)
    {
        CGFloat uTAlpha = self.view.alpha; // PikLips: save current transparency
        [UIView animateWithDuration:1.0
                              delay: 0.0
                            options: UIViewAnimationOptionCurveEaseOut
                         animations:^{
                             self.view.alpha = 0.0;
                         }
                         completion:^(BOOL finished){
                             self.view.hidden=YES; // PikLips: really hide it now
                             self.view.alpha = uTAlpha; // PikLips: then reset the alpha
                         }];
    }
    else
    {
        /* PikLips: If the subview is hidden, then this should not fire.  Once a view is
         * hidden, it should not receive touch events such as this tap.  Therefore, this
         * code should be superflous, and unhiding will need to be done another way, such
         * as through another view controller (see UTViewControler).  This is left here
         * just in case you copy it to use for another purpose, such as making the view
         * semi-transparent, which will still be able to receive touch events.
         */
        CGFloat uTAlpha = self.view.alpha;
        self.view.alpha = 0.0; // PikLips: really hid it now
        self.view.hidden = NO; // PikLips: begin to unhide it
        [UIView animateWithDuration:1.0
                              delay: 0.0
                            options: UIViewAnimationOptionCurveEaseIn
                         animations:^{
                             self.view.alpha = uTAlpha;
                         }
                         completion:^(BOOL finished){
                             int noOp = 0; // PikLips: then no op - you may want to do something else here
                         }];
    }
}

/* PikLips:
 * This is a simple way to hide or unhide the subview without the special animation --
 
- (IBAction) handleTapGesture:(UITapGestureRecognizer *)sender {
    if (self.view.hidden == NO) self.view.hidden = YES; // PikLips: unhide if hidden
    else self.view.hidden = NO; // PikLips: // hide if unhidden
}
 */

/* PikLips:
 * These are instance methods for UIViewController that act as warnings when your view has changed.  They 
 * are here just to show you how they are triggered.
 */

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear: animated];
    NSLog(@"Subview %@ with Tag %i Did Appear", [self.view description], self.view.tag);  // PikLips: for debugging
}

// PikLips: added code ends


@end
