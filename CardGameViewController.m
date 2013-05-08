//
//  amalheirosViewController.m
//  Matchismo
//
//  Created by Antonio Malheiros on 05/05/13.
//  Copyright (c) 2013 Antonio Malheiros. All rights reserved.
//

#import "CardGameViewController.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"

@interface CardGameViewController ()

@property (strong, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) int flipCount;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (strong, nonatomic) IBOutlet UILabel *scoreLabel;
@property (strong,nonatomic) CardMatchingGame *game;
@property (strong, nonatomic) UIImage* cardBackImage;

@end

@implementation CardGameViewController

- (CardMatchingGame *) game
{
    if(!_game) _game = [[CardMatchingGame alloc] initWithCardCount:self.cardButtons.count usingDeck:[[PlayingCardDeck alloc]init]];
    
    return _game;
}

- (void) setFlipCount:(int)flipCount
{
    _flipCount = flipCount;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d",self.flipCount];
}

- (void) setCardButtons:(NSArray *)cardButtons
{
    _cardButtons = cardButtons;
    [self updateUI];
}

- (UIImage *)cardBackImage {
    if (!_cardBackImage) _cardBackImage = [UIImage imageNamed:@"white.jpg"];
    
    return _cardBackImage;
}

- (void) updateUI
{
    for(UIButton *cardButton in self.cardButtons){
        Card *card = [self.game cardAtIndex:[self.cardButtons indexOfObject:cardButton]];
        [cardButton setTitle:card.contents forState: UIControlStateSelected];
        [cardButton setTitle:card.contents forState: UIControlStateSelected|UIControlStateDisabled];
        cardButton.selected = card.isFaceUp;
        cardButton.enabled = !card.isUnplayable;
         [cardButton setBackgroundImage:self.cardBackImage forState: UIControlStateSelected|UIControlStateDisabled];
        cardButton.alpha = (card.isUnplayable ? 0.8 : 1.0);
    }
    
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d", self.game.score];
    
}
- (IBAction)reset {
    UIAlertView *updateAlert = [[UIAlertView alloc] initWithTitle: @"Matchismo" message: @"Do you really want to reset the game?" delegate: self cancelButtonTitle: @"Yes"  otherButtonTitles:@"No",nil];
    
    [updateAlert show];
}


- (IBAction)flipCard:(UIButton *)sender
{
    [self.game flipCardAtIndex:[self.cardButtons indexOfObject:sender]];
    self.flipCount++;
    [self updateUI];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(buttonIndex==0)
    {
        self.flipCount = 0;
        self.game = nil;
        [self updateUI];
    }
    
}


@end
