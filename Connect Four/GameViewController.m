//
//  GameViewController.m
//  Connect Four
//
//  Created by Jared Bergman on 6/18/13.
//  Copyright (c) 2013 iD Tech Camps. All rights reserved.
//

#import "GameViewController.h"

@interface GameViewController ()

@end

@implementation GameViewController

-(IBAction)placePiece:(id)sender {
    UIButton *pressed = (UIButton *)sender;
    for (int i = 0; i < 7; i++) {
        if (pressed == buttonArray[i]) {
            for (int j = 5; j >= 0; j--) {
                if (gameGrid[i][j] == 0) {
                    gameGrid[i][j] = player;
                    player = (player == 1 ? 2 : 1);
                    break;
                }
            }
            if (gameGrid[i][0] != 0) {
                [buttonArray[i] setEnabled:NO];
            }
            break;
        }
    }
    [gameGridView reloadData];
    
    int check = [self checkVictory];
    if (check) {
        NSString *victor = (check == 1 ? @"Red" : @"Yellow");
        (check == 1 ? redScore++ : yellowScore++);
        UIAlertView *victory = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"Winner!"]
                                                          message:[NSString stringWithFormat:@"%@ has won!", victor]
                                                         delegate:self
                                                cancelButtonTitle:@"Quit"
                                                otherButtonTitles:@"New Game", nil];
        [victory show];
    }
    
    /*for (int i = 0; i < 7; i++) {
        for (int j = 0; j < 6; j++) {
            printf("%d ", gameGrid[i][j]);
        }
        printf("\n");
    }*/
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    
    
    return self;
}

-(int)checkVictory {
    // Vertical
    for (int i = 0; i < 7; i++) {
        for (int j = 0; j < 3; j++) {
            if (gameGrid[i][j] == gameGrid[i][j+1] &&
                gameGrid[i][j+1] == gameGrid[i][j+2] &&
                gameGrid[i][j+2] == gameGrid[i][j+3] &&
                gameGrid[i][j] != 0) {
                return gameGrid[i][j];
            }
        }
    }
    
    // Horizontal
    for (int i = 0; i < 3; i++) {
        for (int j = 0; j< 6; j++) {
            if (gameGrid[i][j] == gameGrid[i+1][j] &&
                gameGrid[i+1][j] == gameGrid[i+2][j] &&
                gameGrid[i+2][j] == gameGrid[i+3][j] &&
                gameGrid[i][j] != 0) {
                return gameGrid[i][j];
            }
        }
    }
    
    // Right down to left diagonal
    // Diagonal 1
    for (int i = 0; i < 4; i++) {
        for (int j = 0; j < 3; j++) {
            if (gameGrid[i][j] == gameGrid[i+1][j+1] &&
                gameGrid[i+1][j+1] == gameGrid[i+2][j+2] &&
                gameGrid[i+2][j+2] == gameGrid[i+3][j+3] &&
                gameGrid[i][j] != 0) {
                return gameGrid[i][j];
            }
        }
    }
    
    // Left down to right diagonal
    // Diagonal 2
    for (int i = 0; i < 4; i++) {
        for (int j = 6; j > 3; j--) {
            if (gameGrid[i][j] == gameGrid[i+1][j-1] &&
                gameGrid[i+1][j-1] == gameGrid[i+2][j-2] &&
                gameGrid[i+2][j-2] == gameGrid[i+3][j-3] &&
                gameGrid[i][j] != 0) {
                return gameGrid[i][j];
            }
        }
    }
    
    return 0;
}

-(void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 0) {
        [self.navigationController popViewControllerAnimated:YES];
    }
    else {
        [self resetGame];
    }
}

-(void)resetGame {
    gameLabel.text = [NSString stringWithFormat:@"Red: %d\tYellow: %d", redScore, yellowScore];
    player = 1;
    
    for (int i = 0; i < 7; i++) {
        for (int j = 0; j < 6; j++) {
            gameGrid[i][j] = 0; // initialize or re-initialize grid
        }
    }
    
    for (UIButton *b in buttonArray) {
        b.enabled = YES;
    }
    [gameGridView reloadData];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    gameLabel.text = @"";
    redScore = yellowScore = 0;
	// Do any additional setup after loading the view.
    
    buttonArray = [[NSArray alloc] initWithObjects: columnButton1,columnButton2,columnButton3,
                                            columnButton4,columnButton5,columnButton6,
                                            columnButton7,nil];
    [self resetGame];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    buttonArray = nil;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 6;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 7;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    int row = indexPath.row;
    int sec = indexPath.section;
    
    [cell setBackgroundColor:(gameGrid[row][sec] != 0 ? (gameGrid[row][sec] == 1 ? [UIColor redColor] : [UIColor yellowColor])
                                                        : [UIColor whiteColor])];
    return cell;
}

@end
