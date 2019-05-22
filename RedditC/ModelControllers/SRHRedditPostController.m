//
//  SRHRedditPostController.m
//  RedditC
//
//  Created by Bobba Kadush on 5/22/19.
//  Copyright © 2019 Bobba Kadush. All rights reserved.
//

#import "SRHRedditPostController.h"
#import "SRHRedditPost.h"
#import <UIKit/UIKit.h>

static NSString * const baseURLString = @"http://www.reddit.com/.json";

@implementation SRHRedditPostController

+ (instancetype)shared
{
    static SRHRedditPostController *shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [SRHRedditPostController new];
    });
    return shared;
}

- (void)fetchPosts:(void (^)(BOOL))completin
{
    NSURL *url = [[NSURL alloc] initWithString:baseURLString];
    
    [[[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error){
            NSLog(@"Error Fetching post :%@", error.localizedDescription);
            completin(false);
            return;
        }
        if (!data){
            NSLog(@"data is missing");
            completin(false);
            return;
        }
        NSDictionary *topLevelJson = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        NSDictionary *datadictionary = topLevelJson[@"data"];
        NSArray<NSDictionary*> *childrenArray =datadictionary[@"children"];
        NSMutableArray<SRHRedditPost *> *arrayofPosts = [NSMutableArray new];
        for (NSDictionary *currentDictionary in childrenArray) {
            SRHRedditPost *post = [[SRHRedditPost alloc] initWithDictionary:currentDictionary];
            [arrayofPosts addObject:post];
        }
        
        SRHRedditPostController.shared.posts = arrayofPosts;
        completin(true);
        
    }] resume];
}

- (void)fetchImageForPost:(SRHRedditPost *)post completion:(void (^)(UIImage * _Nullable))completion
{
    NSURL *url = [NSURL URLWithString:post.thumbnail];
    [[[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error){
            NSLog(@"error");
            completion(nil);
            return;
        }
        if (!data){
            NSLog(@"check the mirror");
            completion(nil);
            return;
        }
        UIImage *image = [UIImage imageWithData:data];
        completion(image);
        
    }]resume];
}

@end
