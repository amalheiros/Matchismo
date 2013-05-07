//
//  Deck.h
//  Matchismo
//
//  Created by Antonio Malheiros on 05/05/13.
//  Copyright (c) 2013 Antonio Malheiros. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

-(void)addCard:(Card *)card atTop:(BOOL)atTop;

-(Card *)drawRandomCard;

@end
