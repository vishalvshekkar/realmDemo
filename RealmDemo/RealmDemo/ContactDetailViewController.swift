//
//  ContactDetailViewController.swift
//  RealmDemo
//
//  Created by Vishal on 11/08/16.
//  Copyright © 2016 Vishal. All rights reserved.
//

import UIKit

class ContactDetailViewController: UIViewController, StoryboardIdentity {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var firstNameLabel: UITextField!
    @IBOutlet weak var lastNameLabel: UITextField!
    @IBOutlet weak var addressLabel: UITextField!
    var contactDetails: Contact?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.layer.cornerRadius = 50
        imageView.layer.borderColor = UIColor(colorType: UIColor.ColorType.PinkishRed).CGColor
        imageView.layer.borderWidth = 1
        if let contactDetails = contactDetails {
            firstNameLabel.text = contactDetails.firstName
            lastNameLabel.text = contactDetails.lastName
            addressLabel.text = contactDetails.address
        }
    }

    @IBAction func doneButtonClicked(sender: AnyObject) {
        self.dismissViewControllerAnimated(true) { 
            //Completed Dismiss
        }
    }
    
}
