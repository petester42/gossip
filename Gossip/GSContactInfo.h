//
//  GSContactInfo.h
//  MVC Roaming
//
//  Created by Pierre-Marc Airoldi on 2014-08-06.
//  Copyright (c) 2014 Mobila Canada Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PJSIP.h"

@interface GSContactInfo : NSObject

@property NSString *name;
@property NSString *address;

-(void)setContactInfo:(pj_str_t *)contactInfo;

@end
