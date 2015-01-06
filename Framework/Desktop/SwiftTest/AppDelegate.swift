//
//  AppDelegate.swift
//  SwiftTest
//
//  Created by C.W. Betts on 9/5/14.
//
//

import Cocoa
import CocoaLumberjack
import CocoaLumberjackSwift

let ourLogLevel = DDLogLevel.Verbose

private func printSomething() {
    DDLogVerbose("Verbose")
    DDLogDebug("Debug")
    DDLogInfo("Info")
    DDLogWarn("Warn")
    DDLogError("Error")
}

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
	@IBOutlet weak var window: NSWindow!
    
	func applicationDidFinishLaunching(aNotification: NSNotification?) {
        DDLog.addLogger(DDTTYLogger.sharedInstance())
		
        DDLogVerbose("Verbose")
        DDLogDebug("Debug")
        DDLogInfo("Info")
        DDLogWarn("Warn")
        DDLogError("Error")
        
        printSomething()
        
        defaultDebugLevel = ourLogLevel
        
        DDLogVerbose("Verbose")
        DDLogDebug("Debug")
        DDLogInfo("Info")
        DDLogWarn("Warn")
        DDLogError("Error")
        
        printSomething()
        
        DDLogVerbose("Verbose", level: ourLogLevel);
        DDLogDebug("Debug", level: ourLogLevel)
        DDLogInfo("Info", level: ourLogLevel);
        DDLogWarn("Warn", level: ourLogLevel);
        DDLogError("Error", level: ourLogLevel);
        
        DDLogVerbose("Verbose", level: DDLogLevel.Warning);
        DDLogDebug("Debug", level: DDLogLevel.Warning)
        DDLogInfo("Info", level: DDLogLevel.Warning);
        DDLogWarn("Warn", level: DDLogLevel.Warning);
        DDLogError("Error", level: DDLogLevel.Warning);
        
        defaultDebugLevel = .Warning
        
        DDLogVerbose("Verbose")
        DDLogDebug("Debug")
        DDLogInfo("Info")
        DDLogWarn("Warn")
        DDLogError("Error")
        
        printSomething()
        
        DDLogError("Error %i", level: ourLogLevel, args: 5);
        DDLogError("Error \(5)", level: ourLogLevel)
    }

	func applicationWillTerminate(aNotification: NSNotification?) {
		// Insert code here to tear down your application
	}
}
