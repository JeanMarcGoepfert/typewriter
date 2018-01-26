//
//  StatusMenuController.swift
//  typewriter
//
//  Created by Jean-Marc Goepfert on 26/1/18.
//  Copyright © 2018 Jean-Marc Goepfert. All rights reserved.
//

import Cocoa

class StatusMenuController: NSObject {
    @IBOutlet weak var statusMenu: NSMenu!
    
    
    let keysound = NSSound(named:NSSound.Name(rawValue: "mech"))
    let otherKeySound = NSSound(named:NSSound.Name(rawValue: "otherkey"))
    let statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
    
    override func awakeFromNib() {
        let icon = NSImage(named: NSImage.Name(rawValue: "statusIcon"))
        icon?.isTemplate = true // best for dark mode
        statusItem.image = icon
        statusItem.menu = statusMenu
        
        let mask = NSEvent.EventTypeMask.keyDown;
        
        NSEvent.addGlobalMonitorForEvents(matching: mask, handler: keyDownHandler)
    }
    
    func keyDownHandler(event: NSEvent) {
        if (event.keyCode == 36 || event.keyCode == 51 || event.keyCode == 49) {
            (otherKeySound?.copy() as AnyObject).play();
        } else {
            (keysound?.copy() as AnyObject).play();
        }
        
    }
    
    @IBAction func quitClicked(sender: NSMenuItem) {
        NSApplication.shared.terminate(self)
    }
}

