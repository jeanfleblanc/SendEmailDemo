//
//  ViewController.swift
//  SendEmailDemo
//
//  Created by Jean-Francois Leblanc on 17-10-22.
//  Copyright © 2017 Jean-Francois Leblanc. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func sendEmailButton(_ sender: NSButton) {
        
        SendEmail.send()
    }
    
}

