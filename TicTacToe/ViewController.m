//
//  ViewController.m
//  TicTacToe
//
//  Created by Alejandro Tami on 24/07/14.
//  Copyright (c) 2014 Alejandro Tami. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *myLabelOne;
@property (weak, nonatomic) IBOutlet UILabel *myLabelTwo;
@property (weak, nonatomic) IBOutlet UILabel *myLabelThree;
@property (weak, nonatomic) IBOutlet UILabel *myLabelFour;
@property (weak, nonatomic) IBOutlet UILabel *myLabelFive;
@property (weak, nonatomic) IBOutlet UILabel *myLabelSix;
@property (weak, nonatomic) IBOutlet UILabel *myLabelSeven;
@property (weak, nonatomic) IBOutlet UILabel *myLabelEight;
@property (weak, nonatomic) IBOutlet UILabel *myLabelNine;
@property (weak, nonatomic) IBOutlet UILabel *whichPlayerLabel;

@property CGRect labelGridRect;

@end

@implementation ViewController

enum player{
    x,o
};

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Labels will remain constant in size and location, for more fancy manners, create constants
	self.labelGridRect = CGRectMake(self.myLabelOne.frame.origin.x,
                                self.myLabelOne.frame.origin.y,
                                self.myLabelOne.frame.size.width * 3.0,
                                self.myLabelOne.frame.size.width * 3.0) ;
}

- (UILabel *) findLabelUsingPoint:(CGPoint)point
{
    UILabel * referencedLabel = nil;
    //making sure that the label the user touches is one in the grid
    if (CGRectContainsPoint(self.labelGridRect, point)){
        referencedLabel = (UILabel*)[self.view hitTest:point withEvent:nil];
    }
    
    self.myLabelOne.userInteractionEnabled = YES;
    
    bool blah = [self.myLabelOne pointInside:point withEvent:nil];
    
    return referencedLabel;
}

- (IBAction)onLabelTapped:(UITapGestureRecognizer*)sender {

    UILabel *referencedLabel = [self findLabelUsingPoint: [sender locationInView:self.view]];
    
    referencedLabel.text = @"8=D";
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
