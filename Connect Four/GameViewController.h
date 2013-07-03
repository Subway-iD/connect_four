//
//  GameViewController.h
//  Connect Four
//
//  Created by Jared Bergman on 6/18/13.
//  Copyright (c) 2013 iD Tech Camps. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GameViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate, UIAlertViewDelegate> {
    IBOutlet UIButton *columnButton1;
    IBOutlet UIButton *columnButton2;
    IBOutlet UIButton *columnButton3;
    IBOutlet UIButton *columnButton4;
    IBOutlet UIButton *columnButton5;
    IBOutlet UIButton *columnButton6;
    IBOutlet UIButton *columnButton7;
    NSArray *buttonArray;
    
    IBOutlet UICollectionView *gameGridView;
    
    IBOutlet UILabel *gameLabel;
    
    int gameGrid[7][6];
    
    int player;
    
    int redScore, yellowScore;
}

-(IBAction)placePiece:(id)sender;

@end
