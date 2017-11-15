#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "Jack.h"
#import "JackFileManager.h"
#import "JackHTTPLogger.h"
#import "JackLogFormatter.h"
#import "JackOSLogger.h"

FOUNDATION_EXPORT double JackVersionNumber;
FOUNDATION_EXPORT const unsigned char JackVersionString[];

