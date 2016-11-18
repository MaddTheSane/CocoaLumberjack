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

/**
 * This class provides a logger for Sierra's new \c os_log functionality.
 *
 * This maps the \c DDLogFlag values to \c os_log_type_t and passes them to 
 * <code>os_log</code>.
 *
 * The mapping is as follows:
 * \code
 * DDLogFlagError = OS_LOG_TYPE_FAULT
 * DDLogFlagWarning = OS_LOG_TYPE_ERROR
 * DDLogFlagInfo = OS_LOG_TYPE_DEFAULT
 * DDLogFlagDebug = OS_LOG_TYPE_DEBUG
 * DDLogFlagVerbose = OS_LOG_TYPE_INFO
 * \endcode
 *
 * Special formatting available to \c os_log is not preserved.
 **/
__API_AVAILABLE(macosx(10.12), ios(10.0), watchos(3.0), tvos(10.0))
@interface DDOSLogLogger : DDAbstractLogger

/**
 * Creates a new log with \c OS_LOG_DEFAULT as the target.
 *
 * Will return \c nil if the OS does not support \c os_log
 */
- (instancetype)init;

/**
 * Creates a new log using the specified subsystem and category. See the documentation
 * for \c os_log for more info.
 *
 * Will return \c nil if the OS does not support \c os_log
 */
- (instancetype)initWithSubsystem:(NSString*)subsystem category:(NSString*)category;

@end

NS_ASSUME_NONNULL_END
