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
    let contactsManager = ContactsManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let rightButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Add, target: self, action: #selector(ContactsViewController.rightBarButtonTapped(_:)))
        rightButton.tintColor = UIColor(colorType: .PinkishRed)
        self.navigationItem.rightBarButtonItem = rightButton
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        refreshList()
    }
    
    private func refreshList() {
        var attribute = ContactsManager.firstName
        if segmentControl.selectedSegmentIndex != 0 {
            attribute = ContactsManager.lastName
        }
        contactsManager?.refreshContactsList(attribute)
        let range = NSMakeRange(0, self.tableView.numberOfSections)
        let sections = NSIndexSet(indexesInRange: range)
        tableView.reloadSections(sections, withRowAnimation: UITableViewRowAnimation.Automatic)
    }
    
}

extension TableViewHandling: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactsManager?.contacts.count ?? 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let contactsCell = tableView.dequeueReusableCellWithIdentifier("contactsCell", forIndexPath: indexPath) as? ContactsTableViewCell
        if let contact = contactsManager?.contacts[indexPath.row] {
            var nameLabelText = "\(contact.firstName) \(contact.lastName)"
            if segmentControl.selectedSegmentIndex != 0 {
                nameLabelText = "\(contact.lastName), \(contact.firstName)"
            }
            contactsCell?.nameLabel.text = nameLabelText
                contactsCell?.otherLabel.text = contact.address
        }
        return contactsCell ?? UITableViewCell()
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        if let detailVC: ContactDetailViewController = UIStoryboard.StoryboardType.Main.instantiateViewController() {
            detailVC.contactDetails = contactsManager?.contacts[indexPath.row]
            dispatch_async(dispatch_get_main_queue(), {
                self.navigationController?.presentViewController(detailVC, animated: true, completion: {
                    //Transition Completed
                })
            })
//            CFRunLoopWakeUp(CFRunLoopGetCurrent())
            // http://stackoverflow.com/questions/21075540/presentviewcontrolleranimatedyes-view-will-not-appear-until-user-taps-again
        }
    }
    
}

extension TargetMethods {
    
    func rightBarButtonTapped(button: UIBarButtonItem) {
        if let addContactVC: AddContactViewController = UIStoryboard.StoryboardType.Main.instantiateViewController() {
            addContactVC.contactsManager = contactsManager
            dispatch_async(dispatch_get_main_queue(), {
                self.navigationController?.presentViewController(addContactVC, animated: true, completion: {
                    //Transition Complete
                })
            })
        }
    }
    
    @IBAction func segmentControlValueChanged(sender: AnyObject) {
        refreshList()
    }
    
}