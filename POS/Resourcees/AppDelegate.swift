//
//  AppDelegate.swift
//  POS
//
//  Created by Malik Muhammad on 7/2/23.
//

import Cocoa
import Firebase

@main
class AppDelegate: NSObject, NSApplicationDelegate {

    override init() {
        FirebaseApp.configure()
    }
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        
        
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
        return true
    }


}

