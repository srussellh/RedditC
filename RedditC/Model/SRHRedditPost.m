//
//  SRHRedditPost.m
//  RedditC
//
//  Created by Bobba Kadush on 5/22/19.
//  Copyright © 2019 Bobba Kadush. All rights reserved.
//

#import "SRHRedditPost.h"

@implementation SRHRedditPost

- (instancetype)initWithTitle:(NSString *)title thumbnail:(NSString *)thumbnail
{
    self = [super init];
    if (self){
        _title = title;
        _thumbnail = thumbnail;
    }
    return self;
}
@end

@implementation SRHRedditPost (JSONConvertable)

-(instancetype)initWithDictionary:(NSDictionary<NSString *,id> *)dictionary
{
    NSDictionary *data = dictionary[@"data"];
    NSString *title = data[@"title"];
    NSString *thumbnail = data[@"thumbnail"];
    
    return [self initWithTitle:title thumbnail:thumbnail];
}
@end


