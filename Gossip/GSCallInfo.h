//
//  GSCallInfo.h
//  MVC Roaming
//
//  Created by Pierre-Marc Airoldi on 2014-08-06.
//  Copyright (c) 2014 Mobila Canada Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GSContactInfo.h"
#import "PJSIP.h"

@interface GSCallInfo : NSObject

@property (nonatomic, readonly) GSContactInfo *localInfo;
@property (nonatomic, readonly) GSContactInfo *remoteInfo;
@property (nonatomic, readonly) NSString *state;
@property (nonatomic, readonly) NSTimeInterval connectionDuration;
@property (nonatomic, readonly) NSTimeInterval totalDuration;

+(instancetype)infoFromCallInfo:(pjsua_call_info *)callInfo;

@end
