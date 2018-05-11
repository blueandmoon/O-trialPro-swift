//
//  SHAEncoder.m
//  O-trialPro
//
//  Created by zhaoxin on 2017/12/19.
//  Copyright © 2017年 OceanusPlus. All rights reserved.
//

#import "SHAEncoder.h"

@implementation SHAEncoder
- (NSString *)getSha256String:(NSString *)srcString{
    const char *cstr = [srcString cStringUsingEncoding:NSUTF8StringEncoding];
    NSData *data = [NSData dataWithBytes:cstr length:srcString.length];
    
    uint8_t digest[CC_SHA256_DIGEST_LENGTH];
    
    CC_SHA256(data.bytes, data.length, digest);
    
    NSMutableString* result = [NSMutableString stringWithCapacity:CC_SHA256_DIGEST_LENGTH * 2];
    
    for(int i = 0; i < CC_SHA256_DIGEST_LENGTH; i++) {
        [result appendFormat:@"%02x", digest[i]];
    }
    
    return result;
}
@end
