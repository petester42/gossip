//
//  GSContactInfo.m
//  MVC Roaming
//
//  Created by Pierre-Marc Airoldi on 2014-08-06.
//  Copyright (c) 2014 Mobila Canada Inc. All rights reserved.
//

#import "GSContactInfo.h"
#import "GSPJUtil.h"

@implementation GSContactInfo

-(instancetype)init {
    
    self = [super init];
    
    if (self) {
        
        _name = @"";
        _address = @"";
    }
    
    return self;
}

-(void)setContactInfo:(pj_str_t *)contactInfo {
    
    NSString *string = [GSPJUtil stringWithPJString:contactInfo];

    _name = [self parseString:string between:@"\"" and:@"\""];
    _address = [[self parseString:string between:@"<" and:@">"] stringByReplacingOccurrencesOfString:@"sip:" withString:@""];
}

-(NSString *)parseString:(NSString *)string between:(NSString *)start and:(NSString *)end {
    
    NSScanner* scanner = [NSScanner scannerWithString:string];
    [scanner setCharactersToBeSkipped:nil];
    [scanner scanUpToString:start intoString:NULL];
    
    if ([scanner scanString:start intoString:NULL]) {
        NSString* result = nil;
        if ([scanner scanUpToString:end intoString:&result]) {
            return result;
        }
    }
    
    return @"";
}

-(NSString *)description {
    
    NSDictionary *dictionary = @{@"name": self.name, @"address": self.address};
    
    return [dictionary description];
}

@end
