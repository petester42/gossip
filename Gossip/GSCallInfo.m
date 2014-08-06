//
//  GSCallInfo.m
//  MVC Roaming
//
//  Created by Pierre-Marc Airoldi on 2014-08-06.
//  Copyright (c) 2014 Mobila Canada Inc. All rights reserved.
//

#import "GSCallInfo.h"
#import "GSPJUtil.h"

@implementation GSCallInfo

@synthesize localInfo = _localInfo;
@synthesize remoteInfo = _remoteInfo;
@synthesize state = _state;
@synthesize connectionDuration = _connectionDuration;
@synthesize totalDuration = _totalDuration;

-(instancetype)init {
    
    self = [super init];
    
    if (self) {
        
        _localInfo = [GSContactInfo new];
        _remoteInfo = [GSContactInfo new];
        _state = @"";
    }
    
    return self;
}

+(instancetype)infoFromCallInfo:(pjsua_call_info *)callInfo {
    
    GSCallInfo *info = [[GSCallInfo alloc] init];
    
    [info setCallInfo:callInfo];
    
    return info;
}

-(void)setCallInfo:(pjsua_call_info *)callInfo {
    
    [self.localInfo setContactInfo:&callInfo->local_info];
    [self.remoteInfo setContactInfo:&callInfo->remote_info];
    self.state = [GSPJUtil stringWithPJString:&callInfo->state_text];
    self.connectionDuration = callInfo->connect_duration.sec;
    self.totalDuration = callInfo->total_duration.sec;
}

-(void)setLocalInfo:(GSContactInfo *)localInfo {
    _localInfo = localInfo;
}

-(GSContactInfo *)localInfo {
    return _localInfo;
}

-(void)setRemoteInfo:(GSContactInfo *)remoteInfo {
    _remoteInfo = remoteInfo;
}

-(GSContactInfo *)remoteInfo {
 
    return _remoteInfo;
}

-(void)setState:(NSString *)state {
    _state = state;
}

-(NSString *)state {
    return _state;
}

-(void)setConnectionDuration:(NSTimeInterval)connectionDuration {
    _connectionDuration = connectionDuration;
}

-(NSTimeInterval)connectionDuration {
    return _connectionDuration;
}

-(void)setTotalDuration:(NSTimeInterval)totalDuration {
    _totalDuration = totalDuration;
}

-(NSTimeInterval)totalDuration {
    return _totalDuration;
}

-(NSString *)description {
    
    NSDictionary *dictionary = @{@"localInfo":self.localInfo, @"remoteInfo": self.remoteInfo, @"state":self.state, @"connectionDuration":@(self.connectionDuration), @"totalDurataion": @(self.totalDuration)};
    
    return [dictionary description];
}

@end
