//
//  SRHRedditPostController.h
//  RedditC
//
//  Created by Bobba Kadush on 5/22/19.
//  Copyright © 2019 Bobba Kadush. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SRHRedditPost;

NS_ASSUME_NONNULL_BEGIN

@interface SRHRedditPostController : NSObject

@property (nonatomic, copy) NSArray<SRHRedditPost *> *posts;

+(instancetype)shared;

-(void)fetchPosts:(void(^)(BOOL))completin;

-(void)fetchImageForPost:(SRHRedditPost *)post completion:(void(^) (UIImage * _Nullable))completion;

@end

NS_ASSUME_NONNULL_END
