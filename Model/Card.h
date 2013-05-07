//
//  Card.h
//  Matchismo
//
//  Created by Antonio Malheiros on 05/05/13.
//  Copyright (c) 2013 Antonio Malheiros. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (strong,nonatomic) NSString *contents;


@property (nonatomic, getter = isFaceUp) BOOL faceUp;
@property (nonatomic, getter = isUnplayable) BOOL unplayable;

- (int) match: (NSArray *)otherCards;

@end
