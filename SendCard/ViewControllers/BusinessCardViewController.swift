//
//  BusinessCardViewController.swift
//  SendCard
//
//  Created by KpStar on 4/25/18.
//  Copyright © 2018 upwork. All rights reserved.
//

import UIKit
import MessageUI

class BusinessCardViewController: UIViewController, MFMailComposeViewControllerDelegate, MFMessageComposeViewControllerDelegate {
    
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        controller.dismiss(animated: true, completion: nil)
    }
    

    let v_Width: Float = Float(UIScreen.main.bounds.width)
    let v_Height: Float = Float(UIScreen.main.bounds.height)
    let kUserPhoto = "ProfilePhoto"
    var imageView: UIImageView!
    var mView: UIView!
    
    @IBOutlet weak var sendCardBtn: UIButton!
    var fontsize: CGFloat?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sendCardBtn.layer.borderColor = UIColor.darkGray.cgColor
        sendCardBtn.layer.cornerRadius = 5.0
        sendCardBtn.layer.borderWidth = 2.0
        
        let YPos: Float = Float((v_Height - (v_Width/2.0))/2.0)
        mView = UIView.init(frame: CGRect(x: CGFloat(0.0), y: CGFloat(YPos), width: CGFloat(v_Width), height: CGFloat(v_Width/2.0)))
        mView.layer.borderWidth = 2.0
        mView.layer.borderColor = UIColor.darkGray.cgColor
        mView.backgroundColor = UIColor.darkGray
        
        imageView = UIImageView.init(frame: CGRect(x: CGFloat(2.0), y: CGFloat(0.0), width: CGFloat(v_Width/2.0-4.0), height: CGFloat(v_Width/2.0)))
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.imageTapped(_:)))
        self.imageView.isUserInteractionEnabled = true
        self.imageView.addGestureRecognizer(tapGesture)
        
        
        if let avatadata = UserDefaults.standard.value(forKey: kUserPhoto) as? Data {
            imageView.image = UIImage(data: avatadata)
        } else {
            self.imageView.image = UIImage(named: "noimage")
        }
        mView.addSubview(self.imageView)
        
        let subview = UIView.init(frame: CGRect(x: CGFloat(v_Width/2.0), y: CGFloat(0.0), width: CGFloat(v_Width/2.0), height: CGFloat(v_Width/2.0)))
        subview.backgroundColor = UIColor.lightGray
        
        var y = v_Width/2.0 * 0.1
        fontsize = (CGFloat)(v_Width*0.04)
        
        let nameLbl = UILabel(frame: CGRect(x: CGFloat(10), y: CGFloat(y), width: CGFloat(v_Width/2.0-5.0), height: CGFloat(v_Width*0.05)))
        nameLbl.text = UserDefaults.standard.string(forKey: "fullname")
        nameLbl.font = UIFont.boldSystemFont(ofSize: fontsize! + 1.0)
        y = (Float)(y + v_Width * 0.05)
        subview.addSubview(nameLbl)
        
        let jobLbl = UILabel(frame: CGRect(x: CGFloat(10), y: CGFloat(y), width: CGFloat(v_Width/2.0-5.0), height: CGFloat(v_Width*0.05)))
        jobLbl.text = UserDefaults.standard.string(forKey: "jobtitle")
        jobLbl.font = UIFont.systemFont(ofSize: fontsize!)
        y = y + v_Width*0.07
        subview.addSubview(jobLbl)
        
        let companyLbl = UILabel(frame: CGRect(x: CGFloat(10), y: CGFloat(y), width: CGFloat(v_Width/2.0-15.0), height: CGFloat(v_Width*0.08)))
        companyLbl.text = UserDefaults.standard.string(forKey: "companyname")
        
        if ((CGFloat)((companyLbl.text?.count)!) * fontsize!) > (CGFloat)(v_Width/2.0) {
            companyLbl.lineBreakMode = .byWordWrapping
            companyLbl.font = UIFont.boldSystemFont(ofSize: CGFloat(fontsize!*0.8))
            companyLbl.numberOfLines = 0
        } else {
            companyLbl.font = UIFont.boldSystemFont(ofSize: fontsize! + 1.0)
        }
        companyLbl.minimumScaleFactor = 9.0
        y = (Float)(y + v_Width * 0.08)
        subview.addSubview(companyLbl)
        
        let phoneLbl = UILabel(frame: CGRect(x: CGFloat(10), y: CGFloat(y), width: CGFloat(v_Width/2.0-5.0), height: CGFloat(v_Width*0.05)))
        phoneLbl.text = UserDefaults.standard.string(forKey: "phone")
        phoneLbl.font = UIFont.systemFont(ofSize: fontsize! + 1.0)
        y = (Float)(y + v_Width * 0.05)
        subview.addSubview(phoneLbl)
        
        let emailLbl = UILabel(frame: CGRect(x: CGFloat(10), y: CGFloat(y), width: CGFloat(v_Width/2.0-15.0), height: CGFloat(v_Width*0.05)))
        emailLbl.text = UserDefaults.standard.string(forKey: "email")
        if (emailLbl.text?.count)! > 20 {
            emailLbl.adjustsFontSizeToFitWidth = true
        } else {
            emailLbl.font = UIFont.systemFont(ofSize: fontsize!)
        }
        y = (Float)(y + v_Width * 0.05)
        subview.addSubview(emailLbl)
        
        let addressLbl = UILabel(frame: CGRect(x: CGFloat(10), y: CGFloat(y), width: CGFloat(v_Width/2.0-5.0), height: CGFloat(v_Width*0.08)))
        addressLbl.text = UserDefaults.standard.string(forKey: "address")
        if ((CGFloat)((addressLbl.text?.count)!) * fontsize!) > (CGFloat)(v_Width/2.0 - 10.0) {
            addressLbl.lineBreakMode = .byWordWrapping
            addressLbl.font = UIFont.boldSystemFont(ofSize: CGFloat(fontsize!*0.8))
            addressLbl.numberOfLines = 0
        } else {
            addressLbl.font = UIFont.boldSystemFont(ofSize: fontsize! + 1.0)
        }
        addressLbl.minimumScaleFactor = 9.0
        y = (Float)(y + v_Width * 0.08)
        subview.addSubview(addressLbl)
        
        let websiteLbl = UILabel(frame: CGRect(x: CGFloat(10), y: CGFloat(y), width: CGFloat(v_Width/2.0-5.0), height: CGFloat(v_Width*0.05)))
        websiteLbl.text = UserDefaults.standard.string(forKey: "website")
        websiteLbl.font = UIFont.systemFont(ofSize: fontsize!)
        y = (Float)(y + v_Width * 0.05)
        subview.addSubview(websiteLbl)
        
        mView.addSubview(subview)
        
        self.view.addSubview(mView)
    }
    
    @IBAction func cardBtnTapped(_ sender: Any) {
        showPopup(sender: sender)
    }
    
    func showPopup(sender: Any) {
        let optionMenu = UIAlertController(title: "", message: "Choose Action", preferredStyle: .actionSheet)
        if MFMailComposeViewController.canSendMail() {
            let emailAction = UIAlertAction(title: "Send mail", style: .default) { ( UIAlertAction) in
                let image: UIImage = self.mView.getImage()
                let imageData: Data? = UIImageJPEGRepresentation(image, 1)
                let composeVC = MFMailComposeViewController()
                composeVC.setSubject("Business Card")
                composeVC.mailComposeDelegate = self
                //composeVC.setMessageBody(strHtml, isHTML: true)
                composeVC.addAttachmentData(imageData!, mimeType:"image/png", fileName: "image.png")
                composeVC.setMessageBody("Please Share this image on the Social Media platform you choose. Your share & referral will help bring in my next sale. Thank You", isHTML: false)
                self.present(composeVC, animated: true)
            }
            optionMenu.addAction(emailAction)
        }
        if MFMessageComposeViewController.canSendText() && MFMessageComposeViewController.canSendAttachments() {
            let smsAction = UIAlertAction(title: "Send message", style: .default) { (_ UIAlertAction) in
                let controller = MFMessageComposeViewController()
                let image: UIImage = self.mView.getImage()
                let imageData: Data? = UIImageJPEGRepresentation(image, 1)
                controller.body = "Please Share this image on the Social Media platform you choose. Your share & referral will help bring in my next sale. Thank You"
                controller.addAttachmentData(imageData!, typeIdentifier: "kUTTypeJPEG" ,filename: "card.png")
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
    
    private func setupUI() -> [UILabel] {
        var views: [UILabel] = []
        let nameLbl: UILabel = UILabel()
        nameLbl.font = UIFont.boldSystemFont(ofSize: 18.0)
        nameLbl.textColor = UIColor.white
        nameLbl.text = UserDefaults.standard.string(forKey: "fullname")
        views.append(nameLbl)
        return views
    }
    
    @objc func imageTapped(_ sender: Any) {
        let optionMenu = UIAlertController(title: "", message: "Change Photo", preferredStyle: .actionSheet)
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let libraryAction = UIAlertAction(title: "Select From Library", style: .default) { ( UIAlertAction) in
                let imagePicker = UIImagePickerController()
                imagePicker.sourceType = .photoLibrary
                imagePicker.allowsEditing = true
                imagePicker.delegate = self
                self.present(imagePicker, animated: true, completion: nil)
            }
            optionMenu.addAction(libraryAction)
        }
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let cameraAction = UIAlertAction(title: "Take Photo", style: .default) { (_ UIAlertAction) in
                let camera = UIImagePickerController()
                camera.sourceType  = .camera
                camera.allowsEditing = true
                camera.cameraCaptureMode = .photo
                camera.modalPresentationStyle = .fullScreen
                camera.delegate = self
                self.present(camera, animated: true, completion: nil)
            }
            optionMenu.addAction(cameraAction)
        }
        optionMenu.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        if let popoverPresentationController = optionMenu.popoverPresentationController {
            popoverPresentationController.sourceView = self.view
            //popoverPresentationController.sourceRect = sender.boun
        }
        
        self.present(optionMenu, animated: true, completion: nil)
        
    }
    
}

extension BusinessCardViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        picker.dismiss(animated: true) {
            if let photo = info[UIImagePickerControllerEditedImage] as? UIImage {
                self.imageView.image = photo
                if let imageData = UIImageJPEGRepresentation(self.imageView.image!, 1) {
                    UserDefaults.standard.setValue(imageData, forKey: self.kUserPhoto)
                }
            }
        }
    }
}

extension UIView {
    func getImage() -> UIImage {
        UIGraphicsBeginImageContext(frame.size)
        layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return UIImage(cgImage: (image?.cgImage)!)
    }
}

extension UIImage {
    convenience init(view: UIView) {
        UIGraphicsBeginImageContext(view.frame.size)
        view.layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        self.init(cgImage: (image?.cgImage)!)
    }
}
