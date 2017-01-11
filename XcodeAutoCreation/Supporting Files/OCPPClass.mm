//
//  OCPPClass.m
//  XcodeAutoCreation
//
//  Created by Hoang Chi Quan on 12/20/16.
//  Copyright © 2016 Hoang Chi Quan. All rights reserved.
//

#import "OCPPClass.h"
#import "xprojFileAdder.h"

@implementation OCPPClass: NSObject

+ (void)addFiles:(NSString *)sourceFilePathCSV toProject:(NSString *)projectFileLocation {
    std::string project = [projectFileLocation cStringUsingEncoding:[NSString defaultCStringEncoding]];
    std::string source = [sourceFilePathCSV cStringUsingEncoding:[NSString defaultCStringEncoding]];
    addFilesToXproj(project, source);
}

@end
