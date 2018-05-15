//
//  RegisterViewController.swift
//  SendCard
//
//  Created by KpStar on 4/24/18.
//  Copyright © 2018 upwork. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var fullNameTxt: UITextField!
    @IBOutlet weak var jobTitleTxt: UITextField!
    @IBOutlet weak var companyTxt: UITextField!
    @IBOutlet weak var phoneTxt: UITextField!
    @IBOutlet weak var EmailTxt: UITextField!
    @IBOutlet weak var addressTxt: UITextField!
    @IBOutlet weak var websiteTxt: UITextField!
    @IBOutlet weak var googleReviewTxt: UITextField!
    @IBOutlet weak var facebookTxt: UITextField!
    @IBOutlet weak var registerBtn: UIButton!
    
    let fullname: String? = UserDefaults.standard.value(forKey: "fullname") as? String ?? ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if fullname != "" {
            enterToRegisterMode()
        }
    }

    @IBAction func buttonTapped(_ sender: Any) {
        if fullNameTxt.text == "" {
            self.displayMyAlertMessage(titleMsg: "Alert", alertMsg: "Please insert your Full Name")
            return
        } else if (EmailTxt.text == "") {
            self.displayMyAlertMessage(titleMsg: "Alert", alertMsg: "Please insert you Email")
            return
        }
        
        UserDefaults.standard.set(fullNameTxt.text, forKey: "fullname")
        UserDefaults.standard.set(jobTitleTxt.text, forKey: "jobtitle")
        UserDefaults.standard.set(companyTxt.text, forKey: "companyname")
        UserDefaults.standard.set(phoneTxt.text, forKey: "phone")
        UserDefaults.standard.set(EmailTxt.text, forKey: "email")
        UserDefaults.standard.set(addressTxt.text, forKey: "address")
        UserDefaults.standard.set(websiteTxt.text, forKey: "website")
        UserDefaults.standard.set(googleReviewTxt.text, forKey: "googlereview")
        UserDefaults.standard.set(facebookTxt.text, forKey: "facebook")
        
        enterToRegisterMode()
    }
    
    private func enterToRegisterMode() {
        let mainstory: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let desVC = mainstory.instantiateViewController(withIdentifier: "TabBarControl") as! TabBarViewController
        self.navigationController?.pushViewController(desVC, animated: true)
    }
    
    private func displayMyAlertMessage( titleMsg: String, alertMsg: String) {
        let alertdialog = UIAlertController(title: titleMsg, message: alertMsg , preferredStyle: UIAlertControllerStyle.alert)
        alertdialog.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default){(ACTION) in
        })
        self.present(alertdialog,animated: true)
    }
}
