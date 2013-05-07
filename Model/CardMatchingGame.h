//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by Antonio Malheiros on 05/05/13.
//  Copyright (c) 2013 Antonio Malheiros. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"
#import "Deck.h"

@interface CardMatchingGame : NSObject

- (id) initWithCardCount : (NSUInteger)count
                usingDeck:(Deck *) deck;

-(void) flipCardAtIndex:(NSUInteger) index;

-(Card *) cardAtIndex:(NSUInteger) index;

@property (readonly,nonatomic) int score;

@end
