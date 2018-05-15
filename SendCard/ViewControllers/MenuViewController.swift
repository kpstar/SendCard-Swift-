//
//  MenuViewController.swift
//  SendCard
//
//  Created by KpStar on 4/24/18.
//  Copyright © 2018 upwork. All rights reserved.
//

import UIKit
import MessageUI

class MenuViewController: UIViewController, MFMailComposeViewControllerDelegate, MFMessageComposeViewControllerDelegate {
    
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
    
        controller.dismiss(animated: true, completion: nil)
    }
    

    @IBOutlet weak var businessCardBtn: UIButton!
    @IBOutlet weak var websiteLinkBtn: UIButton!
    @IBOutlet weak var reviewRequest: UIButton!
    @IBOutlet weak var thankyouBtn: UIButton!
    @IBOutlet weak var imgProfile: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setupUI()
    }
    
    private func setupUI() {
        
        businessCardBtn.layer.borderColor = UIColor.black.cgColor
        businessCardBtn.layer.cornerRadius = 3
        businessCardBtn.layer.borderWidth = 1
        websiteLinkBtn.layer.borderColor = UIColor.black.cgColor
        websiteLinkBtn.layer.cornerRadius = 3
        websiteLinkBtn.layer.borderWidth = 1
        reviewRequest.layer.borderColor = UIColor.black.cgColor
        reviewRequest.layer.cornerRadius = 3
        reviewRequest.layer.borderWidth = 1
        thankyouBtn.layer.borderColor = UIColor.black.cgColor
        thankyouBtn.layer.cornerRadius = 3
        thankyouBtn.layer.borderWidth = 1
    }
    
    @IBAction func buttonTapped(_ sender: Any) {
        let btnType: UIButton = sender as! UIButton
        var subject: String = ""
        var message: String = ""
        if btnType == websiteLinkBtn {
//            if MFMailComposeViewController.canSendMail() {
            
//            } else {
//                self.displayMyAlertMessage(titleMsg: "Sorry", alertMsg: "This device doesn't allow you to send email")
//            }
            subject = "Invitation!";
            message = "Please visit our website at: " + UserDefaults.standard.string(forKey: "website")!
        } else if btnType == reviewRequest {
            subject = "Review!"
            message = "Can you please help me by writing a review. Your review will hopefully bring me my next customer! Please click on the links below:\n\n" + UserDefaults.standard.string(forKey: "googlereview")! + "\n" + UserDefaults.standard.string(forKey: "facebook")!
        } else {
            subject = "Thank You!"
            message = "Hello, Just wanted to say thank you again for your business at " + UserDefaults.standard.string(forKey: "companyname")! + "."
        }
        
        UserDefaults.standard.set(subject, forKey: "subject")
        UserDefaults.standard.set(message, forKey: "message")
        
        showPopup(sender: sender)
    }
    
    func showPopup(sender: Any) {
        let optionMenu = UIAlertController(title: "", message: "Choose Action", preferredStyle: .actionSheet)
        if MFMailComposeViewController.canSendMail() {
            let emailAction = UIAlertAction(title: "Send mail", style: .default) { ( UIAlertAction) in
                let mail = MFMailComposeViewController()
                mail.setSubject(UserDefaults.standard.string(forKey: "subject")!)
                mail.mailComposeDelegate = self
                mail.setMessageBody(UserDefaults.standard.string(forKey: "message")!, isHTML: false)
                self.present(mail, animated: true)
            }
            optionMenu.addAction(emailAction)
        }
        if MFMessageComposeViewController.canSendText() {
            let smsAction = UIAlertAction(title: "Send message", style: .default) { (_ UIAlertAction) in
                let controller = MFMessageComposeViewController()
                controller.body = UserDefaults.standard.string(forKey: "message")
                controller.messageComposeDelegate = self
                self.present(controller, animated: true, completion: nil)
            }
            optionMenu.addAction(smsAction)
        }
        optionMenu.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        if let popoverPresentationController = optionMenu.popoverPresentationController {
            popoverPresentationController.sourceView = self.view
            popoverPresentationController.sourceRect = (sender as AnyObject).bounds
        }
        
        self.present(optionMenu, animated: true, completion: nil)
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        if error != nil {
            self.displayMyAlertMessage(titleMsg: "Error", alertMsg: (error?.localizedDescription)!)
        }
        controller.dismiss(animated: true, completion: nil)
    }
    
    private func displayMyAlertMessage( titleMsg: String, alertMsg: String) {
        let alertdialog = UIAlertController(title: titleMsg, message: alertMsg , preferredStyle: UIAlertControllerStyle.alert)
        alertdialog.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default){(ACTION) in
        })
        self.present(alertdialog,animated: true)
    }
}
