//
//  Card.m
//  Matchismo
//
//  Created by Antonio Malheiros on 05/05/13.
//  Copyright (c) 2013 Antonio Malheiros. All rights reserved.
//

#import "Card.h"

@interface  Card()

@end

@implementation Card

@synthesize contents = _contents;
@synthesize unplayable = _unplayable;

- (NSString *)contents
{
    return _contents;
}

- (void) setContents :(NSString *)contents
{
    _contents = contents;
}

- (BOOL) unplayable
{
    return _unplayable;
}

-(void) setUnplayable:(BOOL)unplayable
{
    _unplayable = unplayable;
}

-(int) match:(NSArray *)otherCards
{
    int score = 0;
    
    for(Card *card in otherCards){
        if([card.contents isEqualToString:self.contents]){
            score = 1;
        }
    }
    
    return score;
}

@end
