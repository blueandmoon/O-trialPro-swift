//
//  SHAEncoder.h
//  O-trialPro
//
//  Created by zhaoxin on 2017/12/19.
//  Copyright © 2017年 OceanusPlus. All rights reserved.
//

#import <Foundation/Foundation.h>
#import<CommonCrypto/CommonDigest.h>

@interface SHAEncoder : NSObject
- (NSString *)getSha256String:(NSString *)srcString;
@end
