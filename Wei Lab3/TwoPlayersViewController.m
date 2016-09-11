//
//  TwoPlayersViewController.m
//  Wei Lab3
//
//  Created by weiqi on 9/23/15.
//  Copyright (c) 2015 Qi Wei. All rights reserved.
//

#import "TwoPlayersViewController.h"
#import "AppDelegate.h"
#import "ViewController.h"

@interface TwoPlayersViewController ()

@end

@implementation TwoPlayersViewController;

@synthesize button1;
@synthesize button2;
@synthesize button3;
@synthesize button4;
@synthesize button5;
@synthesize button6;
@synthesize button7;
@synthesize button8;
@synthesize button9;
@synthesize oGoesButton;
@synthesize xGoesButton;
@synthesize randomGoesButton;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.whoGoesFirst.text = @"Please choose who should go first";
    [self initBoard];   
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */
-(void) viewDidAppear: (BOOL)animated{
    [super viewDidAppear:animated];
    [self askOrder];
}

-(void) askOrder{
    AppDelegate *appDelegate=[[UIApplication sharedApplication] delegate];
    
    if([appDelegate.gameMode  isEqual: @"one"]){
        
        UIAlertController *askWhoGoesFirst = [UIAlertController
                                              alertControllerWithTitle:@"Who goes first?"
                                              message: nil
                                              preferredStyle:(UIAlertControllerStyleAlert)];
        UIAlertAction *youFirst = [UIAlertAction
                                   actionWithTitle:@"You first"
                                   style:(UIAlertActionStyleDefault)
                                   handler:^(UIAlertAction *action) {
                                       youAndComputer = @"you";
                                   }];
        UIAlertAction *computerFirst = [UIAlertAction
                                        actionWithTitle:@"Computer first"
                                        style:(UIAlertActionStyleDefault)
                                        handler:^(UIAlertAction *action) {
                                            youAndComputer = @"computer";
                                        }];
        [askWhoGoesFirst addAction:youFirst];
        [askWhoGoesFirst addAction:computerFirst];
        [self presentViewController:askWhoGoesFirst animated:(YES) completion:^{}];
        self.gameModeLable.text = @"Single Player Mode";
    }else{
        self.gameModeLable.text = @"Two Players Mode";
    }
    self.whoGoesFirst.text = @"Please choose a player for you";
    [randomGoesButton setTitle:@"Random" forState:UIControlStateNormal];
    [oGoesButton setTitle:@"\"O\"" forState:UIControlStateNormal];
    [xGoesButton setTitle:@"\"X\"" forState:UIControlStateNormal];
        
}


- (IBAction)oGoesFirst:(id)sender {
    if([playerTurn  isEqual: @"E"]){
        AppDelegate *appDelegate=[[UIApplication sharedApplication] delegate];
        if([appDelegate.gameMode  isEqual: @"one"]){
            if([youAndComputer  isEqual: @"you"]){
                playerTurn = @"O";
                self.whoseTurn.text = @"O's turn";
                self.whoseTurn.text = @"O's turn";
            }else{
                playerTurn = @"X";
                self.whoseTurn.text = @"X's turn";
                [self computerGoes];
            }
        }else{
            playerTurn = @"O";
            self.whoseTurn.text = @"O's turn";
        }
    }
    
}
- (IBAction)xGoesFirst:(id)sender {
    if([playerTurn  isEqual: @"E"]){
        AppDelegate *appDelegate=[[UIApplication sharedApplication] delegate];
        if([appDelegate.gameMode  isEqual: @"one"]){
            if([youAndComputer  isEqual: @"you"]){
                playerTurn = @"X";
                self.whoseTurn.text = @"X's turn";
                self.whoseTurn.text = @"X's turn";
            }else{
                playerTurn = @"O";
                self.whoseTurn.text = @"O's turn";
                [self computerGoes];
            }
        }else{
            playerTurn = @"X";
            self.whoseTurn.text = @"X's turn";
        }
    }
}
- (IBAction)randomGoesFirst:(id)sender {
    
    if([playerTurn  isEqual: @"E"]){
        AppDelegate *appDelegate=[[UIApplication sharedApplication] delegate];
        if([appDelegate.gameMode  isEqual: @"one"]){
            if([youAndComputer  isEqual: @"you"]){
                int player = arc4random() % 2;
                if (player == 0){
                    playerTurn = @"O";
                    self.whoseTurn.text = @"O's turn";
                    
                }else{
                    playerTurn = @"X";
                    self.whoseTurn.text = @"X's turn";
                }
            }else{
                int player = arc4random() % 2;
                if (player == 0){
                    playerTurn = @"O";
                    self.whoseTurn.text = @"O's turn";
                    
                }else{
                    playerTurn = @"X";
                    self.whoseTurn.text = @"X's turn";
                }
                [self computerGoes];
            }
        }else{
            int player = arc4random() % 2;
            if (player == 0){
                playerTurn = @"O";
                self.whoseTurn.text = @"O's turn";
                
            }else{
                playerTurn = @"X";
                self.whoseTurn.text = @"X's turn";
            }
        }
    }
}

- (IBAction)pressReset:(id)sender {
    [self resetBoard];
}
- (IBAction)pressButton1:(id)sender {
    if(![playerTurn isEqualToString:@"E"]){
        if([gameBoard[0][0]  isEqual: @"E"]){
            AppDelegate *appDelegate=[[UIApplication sharedApplication] delegate];
            [self showBoardImage:0 :0];
            if([self checkIfWin]){
                [self alertWinner];
            }
            [self updateGameInfo];
            if ([appDelegate.gameMode isEqual:@"one"]){
                [self computerGoes];
            }
            
        }
    }
}

- (IBAction)pressButton2:(id)sender {
    if(![playerTurn isEqualToString:@"E"]){
        if([gameBoard[0][1]  isEqual: @"E"]){
            AppDelegate *appDelegate=[[UIApplication sharedApplication] delegate];
            [self showBoardImage:0 :1];
            if([self checkIfWin]){
                [self alertWinner];
            }
            [self updateGameInfo];
            if ([appDelegate.gameMode isEqual:@"one"]){
                [self computerGoes];
            }
        }
    }
}
- (IBAction)pressButton3:(id)sender {
    if(![playerTurn isEqualToString:@"E"]){
        if([gameBoard[0][2]  isEqual: @"E"]){
            AppDelegate *appDelegate=[[UIApplication sharedApplication] delegate];
            [self showBoardImage:0 :2];
            if([self checkIfWin]){
                [self alertWinner];
            }
            [self updateGameInfo];
            if ([appDelegate.gameMode isEqual:@"one"]){
                [self computerGoes];
            }
        }
    }
}
- (IBAction)pressButton4:(id)sender {
    if(![playerTurn isEqualToString:@"E"]){
        if([gameBoard[1][0]  isEqual: @"E"]){
            AppDelegate *appDelegate=[[UIApplication sharedApplication] delegate];
            [self showBoardImage:1 :0];
            if([self checkIfWin]){
                [self alertWinner];
            }
            [self updateGameInfo];
            if ([appDelegate.gameMode isEqual:@"one"]){
                [self computerGoes];
            }
        }
    }
}
- (IBAction)pressButton5:(id)sender {
    if(![playerTurn isEqualToString:@"E"]){
        if([gameBoard[1][1]  isEqual: @"E"]){
            AppDelegate *appDelegate=[[UIApplication sharedApplication] delegate];
            [self showBoardImage:1 :1];
            if([self checkIfWin]){
                [self alertWinner];
            }
            [self updateGameInfo];
            if ([appDelegate.gameMode isEqual:@"one"]){
                [self computerGoes];
            }
        }
    }
}
- (IBAction)pressButton6:(id)sender {
    if(![playerTurn isEqualToString:@"E"]){
        if([gameBoard[1][2]  isEqual: @"E"]){
            AppDelegate *appDelegate=[[UIApplication sharedApplication] delegate];
            [self showBoardImage:1 :2];
            if([self checkIfWin]){
                [self alertWinner];
            }
            [self updateGameInfo];
            if ([appDelegate.gameMode isEqual:@"one"]){
                [self computerGoes];
            }
        }
    }
}
- (IBAction)pressButton7:(id)sender {
    if(![playerTurn isEqualToString:@"E"]){
        if([gameBoard[2][0]  isEqual: @"E"]){
            AppDelegate *appDelegate=[[UIApplication sharedApplication] delegate];
            [self showBoardImage:2 :0];
            if([self checkIfWin]){
                [self alertWinner];
            }
            [self updateGameInfo];
            if ([appDelegate.gameMode isEqual:@"one"]){
                [self computerGoes];
            }
        }
    }
}
- (IBAction)pressButton8:(id)sender {
    if(![playerTurn isEqualToString:@"E"]){
        if([gameBoard[2][1]  isEqual: @"E"]){
            AppDelegate *appDelegate=[[UIApplication sharedApplication] delegate];
            [self showBoardImage:2 :1];
            if([self checkIfWin]){
                [self alertWinner];
            }
            [self updateGameInfo];
            if ([appDelegate.gameMode isEqual:@"one"]){
                [self computerGoes];
            }
        }
    }

}
- (IBAction)pressButton9:(id)sender {
    if(![playerTurn isEqualToString:@"E"]){
        if([gameBoard[2][2]  isEqual: @"E"]){
            AppDelegate *appDelegate=[[UIApplication sharedApplication] delegate];
            [self showBoardImage:2 :2];
            if([self checkIfWin]){
                [self alertWinner];
            }
            [self updateGameInfo];
            if ([appDelegate.gameMode isEqual:@"one"]){
                [self computerGoes];
            }
        }
    }
}
- (void) showBoardImage: (NSInteger)i : (NSInteger) j{
    if(i == 0 & j == 0){
        if([playerTurn  isEqual: @"O"]){
            gameBoard[i][j]= @"O" ;
            [button1 setImage:[UIImage imageNamed:@"o.png"] forState:UIControlStateNormal];
        }else{
            gameBoard[i][j]= @"X" ;
            [button1 setImage:[UIImage imageNamed:@"x.png"] forState:UIControlStateNormal];
        }
    }else if (i == 0 & j == 1){
        if([playerTurn  isEqual: @"O"]){
            gameBoard[i][j]= @"O" ;
            [button2 setImage:[UIImage imageNamed:@"o.png"] forState:UIControlStateNormal];
        }else{
            gameBoard[i][j]= @"X" ;
            [button2 setImage:[UIImage imageNamed:@"x.png"] forState:UIControlStateNormal];
        }
    }else if (i == 0 & j == 2){
        if([playerTurn  isEqual: @"O"]){
            gameBoard[i][j]= @"O" ;
            [button3 setImage:[UIImage imageNamed:@"o.png"] forState:UIControlStateNormal];
        }else{
            gameBoard[i][j]= @"X" ;
            [button3 setImage:[UIImage imageNamed:@"x.png"] forState:UIControlStateNormal];
        }
    }else if(i == 1 & j == 0){
        if([playerTurn  isEqual: @"O"]){
            gameBoard[i][j]= @"O" ;
            [button4 setImage:[UIImage imageNamed:@"o.png"] forState:UIControlStateNormal];
        }else{
            gameBoard[i][j]= @"X" ;
            [button4 setImage:[UIImage imageNamed:@"x.png"] forState:UIControlStateNormal];
        }
    }else if (i == 1 & j == 1){
        if([playerTurn  isEqual: @"O"]){
            gameBoard[i][j]= @"O" ;
            [button5 setImage:[UIImage imageNamed:@"o.png"] forState:UIControlStateNormal];
        }else{
            gameBoard[i][j]= @"X" ;
            [button5 setImage:[UIImage imageNamed:@"x.png"] forState:UIControlStateNormal];
        }
    }else if (i == 1 & j == 2){
        if([playerTurn  isEqual: @"O"]){
            gameBoard[i][j]= @"O" ;
            [button6 setImage:[UIImage imageNamed:@"o.png"] forState:UIControlStateNormal];
        }else{
            gameBoard[i][j]= @"X" ;
            [button6 setImage:[UIImage imageNamed:@"x.png"] forState:UIControlStateNormal];
        }
    }else if(i == 2 & j == 0){
        if([playerTurn  isEqual: @"O"]){
            gameBoard[i][j]= @"O" ;
            [button7 setImage:[UIImage imageNamed:@"o.png"] forState:UIControlStateNormal];
        }else{
            gameBoard[i][j]= @"X" ;
            [button7 setImage:[UIImage imageNamed:@"x.png"] forState:UIControlStateNormal];
        }
    }else if (i == 2 & j == 1){
        if([playerTurn  isEqual: @"O"]){
            gameBoard[i][j]= @"O" ;
            [button8 setImage:[UIImage imageNamed:@"o.png"] forState:UIControlStateNormal];
        }else{
            gameBoard[i][j]= @"X" ;
            [button8 setImage:[UIImage imageNamed:@"x.png"] forState:UIControlStateNormal];
        }
    }else if (i == 2 & j == 2){
        if([playerTurn  isEqual: @"O"]){
            gameBoard[i][j]= @"O" ;
            [button9 setImage:[UIImage imageNamed:@"o.png"] forState:UIControlStateNormal];
        }else{
            gameBoard[i][j]= @"X" ;
            [button9 setImage:[UIImage imageNamed:@"x.png"] forState:UIControlStateNormal];
        }
    }
    
}
- (void) updateGameInfo{
    if ([playerTurn  isEqual: @"X"]){
        playerTurn = @"O";
        self.whoseTurn.text = @"O's turn";
    }
    
    else if ([playerTurn  isEqual: @"O"]){
        playerTurn = @"X";
        self.whoseTurn.text = @"X's turn";
    }
}

-(BOOL) checkIfWin{
    //return YES;
    for (int i = 0; i<3; i++){
        for (int j = 0; j < 3; j++){
            NSLog(@"[%d][%d]: %@", i,j,gameBoard[i][j]);
        }
    }
    if((![gameBoard[0][0]  isEqual: @"E"]) & (gameBoard[0][0] == gameBoard[0][1]) & (gameBoard[0][0] == gameBoard[0][2])){
        if ([gameBoard[0][0]  isEqual: @"O"]){
            return YES;
        }else{
            return YES;
        }
    }
    else if((![gameBoard[1][0]  isEqual: @"E"]) & (gameBoard[1][0] == gameBoard[1][1]) & (gameBoard[1][0] == gameBoard[1][2])){
        if ([gameBoard[1][0]  isEqual: @"O"]){
            return YES;
        }else{
            return YES;
        }
    }else if((![gameBoard[2][0]  isEqual: @"E"]) & (gameBoard[2][0] == gameBoard[2][1]) & (gameBoard[2][0] == gameBoard[2][2])){
        if ([gameBoard[2][0]  isEqual: @"O"]){
            return YES;
        }else{
            return YES;
        }
    }
    else if((![gameBoard[0][0]  isEqual: @"E"]) & (gameBoard[0][0] == gameBoard[1][0]) & (gameBoard[0][0] == gameBoard[2][0])){
        if ([gameBoard[0][0]  isEqual: @"O"]){
            NSLog(@"1 O wins!");
            return YES;
        }else{
            NSLog(@"1 X wins!");
            return YES;
        }
    }

    else if((![gameBoard[0][1]  isEqual: @"E"]) & (gameBoard[0][1] == gameBoard[1][1]) & (gameBoard[0][1] == gameBoard[2][1])){
        if ([gameBoard[0][1]  isEqual: @"O"]){
            return YES;
        }else{
            return YES;
        }
    }
    else if((![gameBoard[0][2]  isEqual: @"E"]) & (gameBoard[0][2] == gameBoard[1][2]) & (gameBoard[0][2] == gameBoard[2][2])){
        if ([gameBoard[0][2]  isEqual: @"O"]){
            NSLog(@"1 O wins!");
            return YES;
        }else{
            NSLog(@"1 X wins!");
            return YES;
        }
    }
    else if((![gameBoard[0][0]  isEqual: @"E"]) & (gameBoard[0][0] == gameBoard[1][1]) & (gameBoard[0][0] == gameBoard[2][2])){
        if ([gameBoard[0][0]  isEqual: @"O"]){
            NSLog(@"1 O wins!");
            return YES;
        }else{
            NSLog(@"1 X wins!");
            return YES;
        }
    }
    else if((![gameBoard[0][2]  isEqual: @"E"]) & (gameBoard[0][2] == gameBoard[1][1]) & (gameBoard[0][2] == gameBoard[2][0])){
        if ([gameBoard[0][2]  isEqual: @"O"]){
            NSLog(@"1 O wins!");
            return YES;
        }else{
            NSLog(@"1 X wins!");
            return YES;
        }
    }
    return NO;
}

- (void) resetBoard{
    [button1 setImage:nil forState:UIControlStateNormal];
    [button2 setImage:nil forState:UIControlStateNormal];
    [button3 setImage:nil forState:UIControlStateNormal];
    [button4 setImage:nil forState:UIControlStateNormal];
    [button5 setImage:nil forState:UIControlStateNormal];
    [button6 setImage:nil forState:UIControlStateNormal];
    [button7 setImage:nil forState:UIControlStateNormal];
    [button8 setImage:nil forState:UIControlStateNormal];
    [button9 setImage:nil forState:UIControlStateNormal];
    [self initBoard];
    [self askOrder];
}

- (void) initBoard {
    ///choose who first , alert
    gameBoard = [[NSMutableArray alloc] initWithCapacity:3];
    for(int i = 0; i < 3; i++){
        [gameBoard insertObject:[NSMutableArray arrayWithObjects:@"E",@"E",@"E",nil] atIndex:i];
    }
    playerTurn = @"E";
    self.whoseTurn.text = @"";
}

-(void) alertWinner{
    NSString *alertMessage;
    if ([playerTurn  isEqual: @"X"]){
        alertMessage = @" \"x\" is the winner!";
    }else{
        alertMessage = @" \"0\" is the winner!";
    }
   
    UIAlertController *alertWinner = nil;
    alertWinner = [UIAlertController
                   alertControllerWithTitle:@"Game Over"
                   message:alertMessage
                   preferredStyle:(UIAlertControllerStyleAlert)];
    UIAlertAction *ok = [UIAlertAction
                         actionWithTitle:@"OK"
                         style:(UIAlertActionStyleDefault)
                         handler:^(UIAlertAction *action) {
                             UIAlertController *nextStep = nil;
                             nextStep = [UIAlertController
                                         alertControllerWithTitle:@"Do you want to ..."
                                         message:nil
                                         preferredStyle:UIAlertControllerStyleActionSheet];
                             UIAlertAction *playAgain = [UIAlertAction
                                                         actionWithTitle:@"Try Again"
                                                         style:(UIAlertActionStyleDefault)
                                                         handler:^(UIAlertAction *action) {
                                                             [self resetBoard];
                                                         }];
          
                             UIAlertAction *cancle = [UIAlertAction
                                                      actionWithTitle:@"Cancle"
                                                      style:(UIAlertActionStyleCancel)
                                                      handler:^(UIAlertAction *action){}];

                             [nextStep addAction: playAgain];
                             [nextStep addAction: cancle];
                             [self presentViewController:nextStep animated:(YES) completion:^{}];
                         }];
    
    [alertWinner addAction:ok];
    [self presentViewController:alertWinner animated:(YES) completion:^{}];
}

-(void) computerGoes{
    NSString *computerMark  = playerTurn;
    NSString *humanMark;
    if([computerMark isEqual:@"O"]){
        humanMark = @"X";
    }else{
        humanMark = @"O";
    }

    //first, if computer can win, make the winning move
    for (int i = 0; i < 3 ; i++){
        for(int j = 0; j < 3; j++){
            if([gameBoard[i][j]  isEqual: @"E"]){
                if([gameBoard[(i+1)%3][j] isEqual: computerMark] & [gameBoard[(i+2)%3][j] isEqual: computerMark]){
                     //column
                    gameBoard[i][j] = computerMark;
                    [self showBoardImage:i :j];
                    if([self checkIfWin]){
                        [self alertWinner];
                        return;
                    }
                    [self updateGameInfo];
                    return;
                }else if([gameBoard[i][(j+1)%3] isEqual: computerMark] & [gameBoard[i][(j+2)%3] isEqual: computerMark]){
                    //row
                    gameBoard[i][j] = computerMark;
                    [self showBoardImage:i :j];
                    if([self checkIfWin]){
                        [self alertWinner];
                        return;
                    }
                    [self updateGameInfo];
                    return;
                }else if([gameBoard[(i+1)%3][(j+1)%3] isEqual: computerMark] & [gameBoard[(i+2)%3][(j+2)%3] isEqual: computerMark]){
                    //diagonal
                    gameBoard[i][j] = computerMark;
                    [self showBoardImage:i :j];
                    if([self checkIfWin]){
                        [self alertWinner];
                        return;
                    }
                    [self updateGameInfo];
                    return;
                }
                else if([gameBoard[(i+1)%3][(j+2)%3] isEqual: computerMark] & [gameBoard[(i+2)%3][(j+1)%3] isEqual: computerMark]){
                    //diagonal
                    gameBoard[i][j] = computerMark;
                    [self showBoardImage:i :j];
                    if([self checkIfWin]){
                        [self alertWinner];
                        return;
                    }
                    [self updateGameInfo];
                    return;
                }
            }
        }
    }
    
    
    //second, if human can win , block the winning spot.
    for (int i = 0; i < 3 ; i++){
        for(int j = 0; j < 3; j++){
            if([gameBoard[i][j]  isEqual: @"E"]){
                if([gameBoard[(i+1)%3][j] isEqual: humanMark] & [gameBoard[(i+2)%3][j] isEqual: humanMark]){
                    gameBoard[i][j] = computerMark;
                    [self showBoardImage:i :j];
                    [self updateGameInfo];
                    if([self checkIfWin]){
                        [self alertWinner];
                        return;
                    }
                    return;
                }else if([gameBoard[i][(j+1)%3] isEqual: humanMark] & [gameBoard[i][(j+2)%3] isEqual: humanMark]){
                    gameBoard[i][j] = computerMark;
                    [self showBoardImage:i :j];
                    [self updateGameInfo];
                    if([self checkIfWin]){
                        [self alertWinner];
                        return;
                    }
                    return;
                }else if([gameBoard[(i+1)%3][(j+1)%3] isEqual: humanMark] & [gameBoard[(i+2)%3][(j+2)%3] isEqual: humanMark]){
                    //diagonal
                    gameBoard[i][j] = computerMark;
                    [self showBoardImage:i :j];
                    [self updateGameInfo];
                    if([self checkIfWin]){
                        [self alertWinner];
                        return;
                    }
                    return;
                }
                else if([gameBoard[(i+1)%3][(j+2)%3] isEqual: humanMark] & [gameBoard[(i+2)%3][(j+1)%3] isEqual: humanMark]){
                    //diagonal
                    gameBoard[i][j] = computerMark;
                    [self showBoardImage:i :j];
                    [self updateGameInfo];
                    if([self checkIfWin]){
                        [self alertWinner];
                        return;
                    }
                    return;
                }
            }
        }
    }
    
    
    //otherwise, make a move
    
    if([gameBoard[1][1]  isEqual: @"E"]){
        gameBoard[1][1] = computerMark;
        [self showBoardImage:1 :1];
        [self updateGameInfo];
        if([self checkIfWin]){
            [self alertWinner];
            return;
        }
        return;
    }
    
    for (int i = 0; i < 3; i++){
        for (int j = 0; j < 3; j++){
            if([gameBoard[i][j]  isEqual: @"E"]){
                if ( [gameBoard[(i+1)%3][j] isEqual: computerMark] || [gameBoard[(i+2)%3][j] isEqual: computerMark]
                    || [gameBoard[i][(j+1)%3] isEqual: computerMark] || [gameBoard[i][(j+2)%3] isEqual: computerMark]){
                    gameBoard[i][j] = computerMark;
                    [self showBoardImage:i :j];
                    [self updateGameInfo];
                    if([self checkIfWin]){
                        [self alertWinner];
                        return;
                    }
                    return;
                }
            }
        }
    }
    for (int i = 0; i < 3; i++){
        for (int j = 0; j < 3; j++){
            if([gameBoard[i][j]  isEqual: @"E"]){
                gameBoard[i][j] = computerMark;
                [self showBoardImage:i :j];
                [self updateGameInfo];
                if([self checkIfWin]){
                    [self alertWinner];
                    return;
                }
                return;
            }
        }
    }
    
}

@end
