//
//  UTView.m
//  UT
//
//  Created by Michael Smith on 3/6/11.
//  Copyright 2011 PikLips LLC. 
//  MIT Open Source License, see license.txt for details.
//

#import "UTView.h"


@implementation UTView
/* PikLips: this assigns tags for views
 * This ensure that tags are unique and views with tags do not get a second tag.
 * This is not an index and does not imply any ordering in the view hierarchy!
 */
NSInteger uTTag = 0; // PikLips keep track of the UIView tag count
// PikLips: code ends


/* PikLips: code begins
 * Creating a view using Objective-C usually used initWithFrame.  If you choose to use
 * initWithCoder, you will need to modify that method (below) instead.
 */
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        /* PikLips: code begins
         * Since generating a ViewController in Xcode is not exactly the same as creating a 
         * xib in IB, these properties are not defaulted to the same values. Therefore,
         * they need to be set here in order to equal the xib defaults for UIView.
         */
        self.clearsContextBeforeDrawing = NO; // PikLips: default needs to be set
        // self.view.backgroundColor = BACKGROUNDCOLOR_VIEWDEFAULT; // PikLips: default
        /* PikLips:
         * Or, we set the backgroundColor to something different, otherwise it may blend into 
         * the other view, if it uses the same default color, and be indistinguishable.
         */
        self.backgroundColor = [UIColor redColor]; // PikLips: just to make it standout
        // PikLips: code ends
        self.tag = ++uTTag; // PikLips: set tag to known value
    }
    return self;
}

/* PikLips: code begins
 * When you subclass a UIView of IB's, you need to override initWithCoder instead of 
 * initWithFrame, as IB will not use it.
 */
- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        // Initialization code        
        /* PikLips: code begins
         * We demonstrate how to set the background to an image.  If not set, IB will default
         * to the BACKGROUNDCOLOR_VIEWDEFAULT.
         */
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"demoImage.png"]];
        // PikLips: code ends
        self.tag = ++uTTag;  // PikLips: set tag to known value
    }
    return self;
}
// PikLips: code ends

-(void) setTag:(NSInteger)tag {
    [super setTag:tag]; // PikLips: This is what the default setter does
    NSLog(@"View, %@, tag %i, was set to tag %i", self, self.tag, tag);
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

/* PikLips:
 * These are instance methods for UIView that act as warnings when your view has changed.  They 
 * are here just to show you how they are triggered.
 */
-(void) didAddSubview:(UIView *)subview {;
    NSLog(@"PikLips: Another subview was added to this subview - tag %i", subview.tag);
    
}
-(void) didMoveToSuperview {
    NSLog(@"PikLips: Our custom view, %@, tag %i, was moved to superview, tag %i", [self description], self.tag, self.superview.tag);
    
}
-(void) didMoveToWindow {
    NSLog(@"PikLips: Our custom view, %@, tag %i, was moved to another window, tag %i", [self description], self.tag, self.superview.window.tag);
    
}
// PikLips: code ends

- (void)dealloc
{
    [super dealloc];
}

@end
