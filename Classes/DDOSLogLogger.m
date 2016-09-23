// Software License Agreement (BSD License)
//
// Copyright (c) 2016, Deusty, LLC
// All rights reserved.
//
// Redistribution and use of this software in source and binary forms,
// with or without modification, are permitted provided that the following conditions are met:
//
// * Redistributions of source code must retain the above copyright notice,
//   this list of conditions and the following disclaimer.
//
// * Neither the name of Deusty nor the names of its contributors may be used
//   to endorse or promote products derived from this software without specific
//   prior written permission of Deusty, LLC.

#import "DDOSLogLogger.h"
#include <os/log.h>

#if !__has_feature(objc_arc)
#error This file must be compiled with ARC. Use -fobjc-arc flag (or convert project to ARC).
#endif

#if !__has_builtin(__builtin_os_log_format)
#error using OSLog requires Xcode 8 or later
#endif

static BOOL supportedOS(void)
{
    // TODO: more robust checking?
    return &os_log_create != NULL;
}


@implementation DDOSLogLogger
{
    os_log_t nativeLog;
}

- (void)logMessage:(DDLogMessage *)logMessage
{
    NSString *our = logMessage.message;
    if (self.logFormatter) {
        our = [self.logFormatter formatLogMessage:logMessage];
    }
    os_log_type_t nativeLogType = OS_LOG_TYPE_DEFAULT;
    switch (logMessage.level) {
        case DDLogLevelError:
            nativeLogType = OS_LOG_TYPE_FAULT;
            break;
            
        case DDLogLevelWarning:
            nativeLogType = OS_LOG_TYPE_DEBUG;
            break;
            
        case DDLogLevelInfo:
            nativeLogType = OS_LOG_TYPE_DEFAULT;
            break;
            
        case DDLogLevelDebug:
            nativeLogType = OS_LOG_TYPE_DEBUG;
            break;
            
        case DDLogLevelVerbose:
            nativeLogType = OS_LOG_TYPE_INFO;
            break;
            
        default:
            break;
    }
    os_log_with_type(nativeLog, nativeLogType, "%@", our);
}

- (instancetype)init
{
    if (!supportedOS()) {
        return nil;
    }
    if (self = [super init]) {
        nativeLog = OS_LOG_DEFAULT;
    }
    return self;
}

- (instancetype)initWithSubsystem:(NSString*)subsystem category:(NSString*)category
{
    if (!supportedOS()) {
        return nil;
    }
    if (self = [super init]) {
        nativeLog = os_log_create(subsystem.UTF8String, category.UTF8String);
    }
    return self;
}

@end
