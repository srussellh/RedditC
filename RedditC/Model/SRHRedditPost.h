//
//  SRHRedditPost.h
//  RedditC
//
//  Created by Bobba Kadush on 5/22/19.
//  Copyright © 2019 Bobba Kadush. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SRHRedditPost : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy, nullable) NSString *thumbnail;

-(instancetype) initWithTitle:(NSString *)title thumbnail:(NSString *)thumbnail;



@end

@interface SRHRedditPost (JSONConvertable);

-(instancetype) initWithDictionary: (NSDictionary<NSString *, id> *)dictionary;


@end

NS_ASSUME_NONNULL_END
