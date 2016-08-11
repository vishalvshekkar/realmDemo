//
//  ContactsViewController.swift
//  RealmDemo
//
//  Created by Vishal V Shekkar on 10/08/16.
//  Copyright © 2016 Vishal. All rights reserved.
//

import UIKit
import RealmSwift

private typealias TableViewHandling = ContactsViewController
private typealias TargetMethods = ContactsViewController

class ContactsViewController: UIViewController {

    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!
    let realm = try! Realm()
    var contacts: Results<Contact> = { () -> Results<Contact> in
        var contacts: Results<Contact>
        if self.segmentControl.selectedSegmentIndex == 0 {
            contacts = self.realm.objects(Contact.self)
        } else {
            contacts = self.realm
        }
        return contacts
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let rightButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Add, target: self, action: #selector(ContactsViewController.rightBarButtonTapped(_:)))
        rightButton.tintColor = UIColor(colorType: .PinkishRed)
        self.navigationItem.rightBarButtonItem = rightButton
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        var
        
    }
    
}

extension TableViewHandling: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let contactsCell = tableView.dequeueReusableCellWithIdentifier("contactsCell", forIndexPath: indexPath) as? ContactsTableViewCell
        contactsCell?.leftImageView?.backgroundColor = UIColor.darkGrayColor()
        contactsCell?.otherLabel.text = "\(indexPath.row)\(indexPath.row)\(indexPath.row)\(indexPath.row)\(indexPath.row)\(indexPath.row)\(indexPath.row)\(indexPath.row)"
        return contactsCell ?? UITableViewCell()
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
}

extension TargetMethods {
    
    func rightBarButtonTapped(button: UIBarButtonItem) {
        
    }
    
}