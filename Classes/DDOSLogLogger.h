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


// Disable legacy macros
#ifndef DD_LEGACY_MACROS
    #define DD_LEGACY_MACROS 0
#endif

#import "DDLog.h"

NS_ASSUME_NONNULL_BEGIN

NS_AVAILABLE(10_12, 10_0)
@interface DDOSLogLogger : DDAbstractLogger

- (instancetype)init;
- (instancetype)initWithSubsystem:(NSString*)subsystem category:(NSString*)category;

@end

NS_ASSUME_NONNULL_END
