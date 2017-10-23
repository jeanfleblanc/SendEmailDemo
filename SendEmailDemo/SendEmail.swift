//
//  SendEmail.swift
//  SecretSanta
//
//  Created by Jean-Francois Leblanc on 17-10-22.
//  Copyright © 2017 Jean-Francois Leblanc. All rights reserved.
//

import Foundation
import Cocoa

class SendEmail: NSObject {
    
    static func send() {
        let smtpSession = MCOSMTPSession()
        
        smtpSession.hostname = "xxxxx"
        smtpSession.port = 25
        smtpSession.connectionType = MCOConnectionType.clear
        
        //smtpSession.hostname = "smtp.gmail.com"
        //smtpSession.username = "xxxxxx@gmail.com"
        //smtpSession.password = "xxxxxx"
        //smtpSession.port = 465
        //smtpSession.authType = MCOAuthType.saslPlain
        //smtpSession.connectionType = MCOConnectionType.TLS
        smtpSession.connectionLogger = {(connectionID, type, data) in
        if data != nil {
        if let string = NSString(data: data!, encoding: String.Encoding.utf8.rawValue){
        NSLog("Connectionlogger: \(string)")
        }
        }
        }
        
        let builder = MCOMessageBuilder()
        builder.header.to = [MCOAddress(displayName: "Rool", mailbox: "xxxx@gmail.com")]
        builder.header.from = MCOAddress(displayName: "Matt R", mailbox: "xxxxx@gmail.com")
        builder.header.subject = "My message"
        builder.htmlBody = "Yo JF, this is a test message!"
        
             let data = builder.data()
        
        let sendOperation : MCOSMTPSendOperation = smtpSession.sendOperation(with: data)
        sendOperation.start({
            (error : NSError?) -> Void in
            
            if(error != nil){
                //Keep sending the email till it succeeds.  needs to know for security reasons.
                // self.sendEmailToCustomer(emailid)
                print("customer email failed.\(error?.code) \(error)")

            }
            else{
                //Email sent successfully.
                
                print("Email sent successfully")
                
            }
        
       // let rfc822Data = builder.data()
       // let sendOperation = smtpSession.sendOperation(with: rfc822Data!)
       // sendOperation?.start { (error) -> Void in
       // if (error != nil) {
       //     NSLog("Error sending email: \(String(describing: error))")
      //  } else {
      //  NSLog("Successfully sent email!")
      //  }
      //  }
      //      } as! (Error?) -> Void
            } as! (Error?) -> Void)
    }
}

