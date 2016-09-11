//
//  TwoPlayersViewController.h
//  Wei Lab3
//
//  Created by weiqi on 9/23/15.
//  Copyright (c) 2015 Qi Wei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface TwoPlayersViewController : UIViewController{
    NSString * playerTurn;
    NSMutableArray *gameBoard;
    NSString *youAndComputer;
    UIButton *button1;
    UIButton *button2;
    UIButton *button3;
    UIButton *button4;
    UIButton *button5;
    UIButton *button6;
    UIButton *button7;
    UIButton *button8;
    UIButton *button9;
}

//- (IBAction)spaceMarker:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *oGoesButton;
@property (weak, nonatomic) IBOutlet UIButton *xGoesButton;
@property (weak, nonatomic) IBOutlet UIButton *randomGoesButton;
@property (weak, nonatomic) IBOutlet UILabel *whoseTurn;
@property (weak, nonatomic) IBOutlet UILabel *whoGoesFirst;
@property (weak, nonatomic) IBOutlet UILabel *gameModeLable;
@property (weak, nonatomic) IBOutlet UIButton *resetGame;
@property (nonatomic) IBOutlet UIButton *button1;
@property (nonatomic) IBOutlet UIButton *button2;
@property (nonatomic) IBOutlet UIButton *button3;
@property (nonatomic) IBOutlet UIButton *button4;
@property (nonatomic) IBOutlet UIButton *button5;
@property (nonatomic) IBOutlet UIButton *button6;
@property (nonatomic) IBOutlet UIButton *button7;
@property (nonatomic) IBOutlet UIButton *button8;
@property (nonatomic) IBOutlet UIButton *button9;

- (void) askOrder;
- (void) updateGameInfo;
- (BOOL) checkIfWin;
- (void) resetBoard;
- (void) initBoard;
- (void) alertWinner;
- (void) computerGoes;
- (void) showBoardImage: (NSInteger)i : (NSInteger) j;

@end
