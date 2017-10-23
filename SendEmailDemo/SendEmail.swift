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
                print("customer email failed.\(String(describing: error?.code)) \(String(describing: error))")

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
    
    func sendEmailInClear(emailid:String?)
    {
        let session : MCOSMTPSession = MCOSMTPSession()
        session.hostname = "mail.***.com"
        session.port = 25
        session.connectionType = MCOConnectionType.clear
        
        let builder = MCOMessageBuilder()
        builder.header.from = MCOAddress(displayName: " iPad App", mailbox:"INVESTOR@xxx.com")
        builder.header.to = [MCOAddress(displayName: "iPad App", mailbox:emailid)]
        
        builder.header.subject = "Email Link   \(UserDefaults.standard.value(forKey: "branch_id")!)"
        builder.htmlBody = "Thanks for choosing . Here is link you wanted to have in your inbox"
        let data = builder.data()
        
        let sendOperation : MCOSMTPSendOperation = session.sendOperation(with: data)
        UserDefaults.standard.setValue(emailid, forKey: "Customer_EmailId")
        sendOperation.start({
            (error : NSError?) -> Void in
            
            if(error != nil){
                //Keep sending the email till it succeeds.  needs to know for security reasons.
                // self.sendEmailToCustomer(emailid)
                print("customer email failed.\(String(describing: error?.code)) \(String(describing: error))")
                //self.showAlertMessage(MESSAGE_EMAIL_Not_SENT, title:"Email Not Sent", actions: [UIAlertAction(title: "OK", style: .Default) {action in
                //    }], withSound: false)
            }
            else{
                //Email sent successfully.
                
                print("Email sent successfully \(String(describing: emailid))")
                //self.showAlertMessage(MESSAGE_EMAIL_SENT, title:"Email Sent", actions: [UIAlertAction(title: "OK", style: .Default) {action in
                //    }], withSound: false)
                
            }
            } as! (Error?) -> Void)
    }
}

