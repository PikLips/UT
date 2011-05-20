//
//  UTViewController.m
//  UT
//
//  Created by Michael Smith on 3/3/11.
//  Copyright 2011 PikLips LLC. 
//  MIT Open Source License, see license.txt for details.
//

#import "UTViewController.h"

@implementation UTViewController

//PikLips: code added --
@synthesize uTPinchGesture, uTRotationGesture, uTTapGesture; // PikLips: create setters/getters (accessor methods)
// PikLips: this is used for UTSubviewController.view --
#define SUBVIEWSIZE_DEFAULT CGRectMake((CGFloat) 80.0, (CGFloat) 115.0, (CGFloat) 160.0, (CGFloat) 230.0)
// PikLips: code ends

- (void)dealloc
{
// PikLips: code added -
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


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];

// PikLips: added code --

/* PikLips:
 * These are the latest gesture recognizers, which reduce the UIEven/UITouch coding required to 
 * pick up a tap. pinch, pan, swipe, or rotate gesture.  This code associates the declared event
 * handlers in the header with methods (below) that handle the results of the gesture, such as
 * the distance, velocity, etc.
 */
        
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
	[self.view addGestureRecognizer:tapGesture]; // PikLips: add to view
    self.uTTapGesture = (UITapGestureRecognizer *)tapGesture; // PikLips: make public
    tapGesture.delegate = self; // PikLips: amke this class be the delegate 
	[tapGesture release]; // PikLips: then release it
// PikLips: code ends

}

/* PikLips:
 * This resizes the view --
 */
- (IBAction) handlePinchGesture:(UIGestureRecognizer *) sender {
    CGFloat factor = [(UIPinchGestureRecognizer *) sender scale]; // PikLips:
    self.view.transform = CGAffineTransformScale(self.view.transform, factor, factor); // PikLips:
}

/* PikLips:
 * This rotates the view
 */
- (IBAction) handleRotationGesture:(UIRotationGestureRecognizer *)sender {
    // PikLips: apply the amount of the rotation (in radians) to the current transform to get the new position --
    self.view.transform = CGAffineTransformRotate(self.view.transform, [sender rotation]); // PikLips:
}

/* PikLips:
 * This hides or unhides the view using an animation to make the prior state "ease out."
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
        /* PikLips: If the view is hidden, then this should not fire.  Once a view is
         * hidden, it should not receive touch events such as this tap.  Therefore, this
         * code should be superflous, and unhiding will need to be done another way, such
         * as through another view controller (see UTAppDelegate).  This is left here
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

// PikLips: code begins
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear: animated];
    NSLog(@"View, %@, with tag %i, Did Appear", [self.view description], self.view.tag);  // PikLips: this illustrates the ViewController instance method that is triggered when the view is displayed 
}
// PikLips: code ends

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

@end
