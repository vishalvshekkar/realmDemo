//
//  AddContactViewController.swift
//  RealmDemo
//
//  Created by Vishal V Shekkar on 16/08/16.
//  Copyright © 2016 Vishal. All rights reserved.
//

import UIKit

class AddContactViewController: UIViewController, StoryboardIdentity {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    var contact = Contact()
    var contactsManager: ContactsManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.layer.cornerRadius = 50
        imageView.layer.borderColor = UIColor(colorType: UIColor.ColorType.PinkishRed).CGColor
        imageView.layer.borderWidth = 1
    }

    @IBAction func doneButtonClicked(sender: AnyObject) {
        contact.firstName = firstNameTextField.text ?? ""
        contact.lastName = lastNameTextField.text ?? ""
        contact.address = addressTextField.text ?? ""
        contactsManager?.addContact(contact)
        self.dismissViewControllerAnimated(true) { 
            //Transition Completed
        }
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesBegan(touches, withEvent: event)
        self.view.endEditing(true)
    }
}
