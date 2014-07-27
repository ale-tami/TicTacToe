//
//  ViewController.m
//  TicTacToe
//
//  Created by Alejandro Tami on 24/07/14.
//  Copyright (c) 2014 Alejandro Tami. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIAlertViewDelegate>

typedef enum {
    X_PLAYER = 0,
    O_PLAYER = 1,
    NONE = 2
} Player;

//TAGS set in story board
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
@property (weak, nonatomic) IBOutlet UILabel *myFirstMoveChip;

@property BOOL gameBegun;
@property CGRect labelGridRect;
@property Player playerTurn;
//@property (strong, nonatomic) NSMutableArray *grid;

@end


@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Labels will remain constant in size and location, for more fancy manners, create constants
	self.labelGridRect = CGRectMake(self.myLabelOne.frame.origin.x,
                                self.myLabelOne.frame.origin.y,
                                self.myLabelOne.frame.size.width * 3.0,
                                self.myLabelOne.frame.size.height * 3.0) ;
    
    self.playerTurn = X_PLAYER; //x starts
    
    self.gameBegun = NO;
}

- (UILabel *) findLabelUsingPoint:(CGPoint)point
{
    UILabel * referencedLabel = nil;
    
    //making sure that the label the user touches is one in the grid
    if (CGRectContainsPoint(self.labelGridRect, point)){
        // User interaction enabled from storyboard
        referencedLabel = (UILabel*)[self.view hitTest:point withEvent:nil];
    }
        
    return referencedLabel;
}

- (IBAction)onLabelTapped:(UITapGestureRecognizer*)sender {
    
    if (self.gameBegun) {
        
        [NSTimer scheduledTimerWithTimeInterval:10.0
                                         target:self
                                       selector:@selector(forfeitTurn)
                                       userInfo:nil
                                        repeats:NO];
    
        UILabel *referencedLabel = [self findLabelUsingPoint: [sender locationInView:self.view]];
        
        if (referencedLabel.text.length == 0) {
        
            if (self.playerTurn == X_PLAYER) {
                
                referencedLabel.text = @"X";
                referencedLabel.textColor = [UIColor redColor];
                
                self.whichPlayerLabel.textColor = [UIColor blueColor];
                self.whichPlayerLabel.text = @"O";
                
                self.playerTurn = O_PLAYER;
                
            } else {
                
                referencedLabel.text = @"O";
                referencedLabel.textColor = [UIColor blueColor];
                
                self.whichPlayerLabel.textColor = [UIColor redColor];
                self.whichPlayerLabel.text = @"X";
                
                self.playerTurn = X_PLAYER;
                
            }

        }
        
        NSString *winner = [self whoWon];
        
        if (winner.length != 0) {
            
            self.whichPlayerLabel.text = [winner stringByAppendingString:@" You won!"];
            self.whichPlayerLabel.textColor = [UIColor greenColor];
            
            UIAlertView * alertView = [[UIAlertView alloc]init];
            
            alertView.delegate = self;
            
            alertView.title = @"We have a winner!";
            alertView.message = [winner stringByAppendingString:@" You won!"];
            [alertView addButtonWithTitle:@"Play again"];
            
            [alertView show];
        }
    
    }
    
}


- (void) forfeitTurn {

    
    if (self.playerTurn == X_PLAYER) {
        
        self.whichPlayerLabel.textColor = [UIColor blueColor];
        self.whichPlayerLabel.text = @"O";
        
        self.playerTurn = O_PLAYER;
        
    } else {
        
        self.whichPlayerLabel.textColor = [UIColor redColor];
        self.whichPlayerLabel.text = @"X";
        
        self.playerTurn = X_PLAYER;
        
    }

    
    
}


- (NSString *) whoWon
{
    
    if ([self checkWinForPlayer:@"X"]){
        return @"X";
    } else if ([self checkWinForPlayer:@"Y"]){
        return @"Y";
    } else {
        return @"";
    }
    
}

- (BOOL) checkWinForPlayer:(NSString*) player
{
    
    // Original idea was to check in a matrix the game state but, too large to code, so...
    // going for the infamous if


    if (([self.myLabelOne.text isEqualToString:player] &&
         [self.myLabelTwo.text isEqualToString:player] &&
         [self.myLabelThree.text isEqualToString:player]) ||  //across the bottom
       
        ([self.myLabelFour.text isEqualToString:player] &&
         [self.myLabelFive.text isEqualToString:player] &&
         [self.myLabelSix.text isEqualToString:player]) || //across the middle
        
        ([self.myLabelSeven.text isEqualToString:player] &&
         [self.myLabelEight.text isEqualToString:player] &&
         [self.myLabelNine.text isEqualToString:player]) || //across the top
        
        ([self.myLabelOne.text isEqualToString:player] &&
         [self.myLabelFour.text isEqualToString:player] &&
         [self.myLabelSeven.text isEqualToString:player]) || //down the left side
        
        ([self.myLabelTwo.text isEqualToString:player] &&
         [self.myLabelFive.text isEqualToString:player] &&
         [self.myLabelEight.text isEqualToString:player]) || //down the middle
        
        ([self.myLabelThree.text isEqualToString:player] &&
         [self.myLabelSix.text isEqualToString:player] &&
         [self.myLabelNine.text isEqualToString:player]) || //down the right side
        
        ([self.myLabelOne.text isEqualToString:player] &&
         [self.myLabelFive.text isEqualToString:player] &&
         [self.myLabelNine.text isEqualToString:player]) || //diagonal
        
        ([self.myLabelThree.text isEqualToString:player] &&
         [self.myLabelFive.text isEqualToString:player] &&
         [self.myLabelSeven.text isEqualToString:player])){// other diagonal
            
            return YES;
        
        
        } else {
            
            return NO;
        }

}


- (IBAction)onLabelDragged:(UIPanGestureRecognizer*)sender {
    
    CGPoint point = [sender translationInView:self.view];
    
    self.myFirstMoveChip.transform = CGAffineTransformMakeTranslation(point.x, point.y);
    
    point.x += self.myFirstMoveChip.center.x;
    point.y += self.myFirstMoveChip.center.y;
    
    
    if (sender.state == UIGestureRecognizerStateEnded){
        
        //thank you brain for the findLabelUsingPoint method
        self.myFirstMoveChip.alpha = 0.0;
        self.myFirstMoveChip.userInteractionEnabled = NO;

        UILabel *referencedLabel = [self findLabelUsingPoint: [sender locationInView:self.view]];
    
        //I could not repeat this code, but, not today
        if (CGRectContainsPoint(referencedLabel.frame, point))
        {
            referencedLabel.text = @"X";
            referencedLabel.textColor = [UIColor redColor];
            
            self.whichPlayerLabel.textColor = [UIColor blueColor];
            self.whichPlayerLabel.text = @"O";
            
            self.playerTurn = O_PLAYER;
            
            self.gameBegun = YES;
            
            [NSTimer scheduledTimerWithTimeInterval:10.0
                                             target:self
                                           selector:@selector(forfeitTurn)
                                           userInfo:nil
                                            repeats:NO];

        }

    }

}




- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    
    self.myLabelOne.text = @"";
    self.myLabelTwo.text = @"";
    self.myLabelThree.text = @"";
    self.myLabelFour.text = @"";
    self.myLabelFive.text = @"";
    self.myLabelSix.text = @"";
    self.myLabelSeven.text = @"";
    self.myLabelEight.text = @"";
    self.myLabelNine.text = @"";
    
    self.whichPlayerLabel.text = @"X";
    self.whichPlayerLabel.textColor = [UIColor redColor];
    
    self.playerTurn = X_PLAYER;
    
}



- (IBAction)goBack:(UIStoryboardSegue *) sender
{
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
