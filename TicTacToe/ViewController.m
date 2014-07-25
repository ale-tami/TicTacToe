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

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void) findLabelUsingPoint:(CGPoint)point
{
    
}

- (IBAction)onLabelTapped:(UITapGestureRecognizer *)sender
{
    [sender locationInView:self.view];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
