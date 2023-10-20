//
//  Start.swift
//  POS
//
//  Created by Malik Muhammad on 7/11/23.
//

import Cocoa
import FirebaseAuth
import Firebase


class Start: NSViewController {

    let db = Firestore.firestore()
    @IBOutlet var email: NSTextField!
    
    @IBOutlet var password: NSSecureTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        view.wantsLayer = true
        view.layer?.backgroundColor = NSColor(deviceRed: 48/255, green: 48/255, blue: 48/255, alpha: 1).cgColor
//        view.window?.center()
    }
    
    @IBAction func loginButtonPressed(_ sender: Any) {
//        db.collection("Gary Community School Corporation").document("Admin").collection("Admin").getDocuments { documents, error in
//            if error == nil {
//                if documents != nil {
//                    for doc in documents!.documents {
//                        let data = doc.data()
//
//
//                        if let email = data["email"] as? String {
//                            if email == self.email.stringValue {
//
//                                Auth.auth().signIn(withEmail: self.email.stringValue, password: self.password.stringValue) { result, error in
//                                    if error == nil {
//
//                                    } else {
//
//                                    }
//                                }
//                            }
//                        }
//                    }
//                }
//            }
//        }
        
        self.performSegue(withIdentifier: "loginToGM", sender: self)
        
        
        
    }
    
    override func prepare(for segue: NSStoryboardSegue, sender: Any?) {
        if segue.identifier == "loginToGM" {
            self.dismiss(true)
        }
    }
    
//    
//    func showToast(message : String, font: NSFont) {
//        
//        
//        let toastLabel = NSTextField(frame: CGRect(x: 0, y: self.view.frame.size.height-180, width: (self.view.frame.width), height: 70))
//        toastLabel.backgroundColor = NSColor.lightGray
//        toastLabel.textColor = NSColor.white
//        toastLabel.font = font
//        toastLabel.wantsLayer = true
//        toastLabel.alignment = .center;
//        toastLabel.stringValue = message
//        toastLabel.alphaValue = 1.0
//        toastLabel.maximumNumberOfLines = 4
//        toastLabel.layer?.cornerRadius = 1
////        toastLabel.clipsToBounds  =  true
//        self.view.addSubview(toastLabel)
//        
//        
//        NSView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
//             toastLabel.alpha = 0.0
//        }, completion: {(isCompleted) in
//            toastLabel.removeFromSuperview()
//        })
//    }
    
}
