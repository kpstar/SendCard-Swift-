//
//  SettingViewController.swift
//  SendCard
//
//  Created by KpStar on 4/24/18.
//  Copyright © 2018 upwork. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {

    @IBOutlet weak var fullName: UITextField!
    @IBOutlet weak var jobTitle: UITextField!
    @IBOutlet weak var companyName: UITextField!
    @IBOutlet weak var phone: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var address: UITextField!
    @IBOutlet weak var website: UITextField!
    @IBOutlet weak var googleReviewLink: UITextField!
    @IBOutlet weak var facebookLink: UITextField!
    @IBOutlet weak var changeBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func viewWillAppear(_ animated: Bool) {
        self.navigationItem.hidesBackButton = false
        
        fullName.text = UserDefaults.standard.string(forKey: "fullname")
        jobTitle.text = UserDefaults.standard.string(forKey: "jobtitle")
        companyName.text = UserDefaults.standard.string(forKey: "companyname")
        phone.text = UserDefaults.standard.string(forKey: "phone")
        email.text = UserDefaults.standard.string(forKey: "email")
        address.text = UserDefaults.standard.string(forKey: "address")
        website.text = UserDefaults.standard.string(forKey: "website")
        googleReviewLink.text = UserDefaults.standard.string(forKey: "googlereview")
        facebookLink.text = UserDefaults.standard.string(forKey: "facebook")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationItem.hidesBackButton = true
    }
    
    @IBAction func buttonTapped(_ sender: Any) {
        if fullName.text == "" {
            self.displayMyAlertMessage(titleMsg: "Alert", alertMsg: "Please insert your Full Name")
            return
        } else if (email.text == "") {
            self.displayMyAlertMessage(titleMsg: "Alert", alertMsg: "Please insert you Email")
            return
        }
        
        UserDefaults.standard.set(fullName.text, forKey: "fullname")
        UserDefaults.standard.set(jobTitle.text, forKey: "jobtitle")
        UserDefaults.standard.set(companyName.text, forKey: "companyname")
        UserDefaults.standard.set(phone.text, forKey: "phone")
        UserDefaults.standard.set(email.text, forKey: "email")
        UserDefaults.standard.set(address.text, forKey: "address")
        UserDefaults.standard.set(website.text, forKey: "website")
        UserDefaults.standard.set(googleReviewLink.text, forKey: "googlereview")
        UserDefaults.standard.set(facebookLink.text, forKey: "facebook")
        
        self.displayMyAlertMessage(titleMsg: "Success", alertMsg: "Successfully changed.")
        
    }
    
    private func displayMyAlertMessage( titleMsg: String, alertMsg: String) {
        let alertdialog = UIAlertController(title: titleMsg, message: alertMsg , preferredStyle: UIAlertControllerStyle.alert)
        alertdialog.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default){(ACTION) in
        })
        self.present(alertdialog,animated: true)
    }
}
