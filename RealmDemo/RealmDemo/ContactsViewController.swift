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
    var contacts: Results<Contact>
    
    required init?(coder aDecoder: NSCoder) {
        contacts = realm.objects(Contact.self).sorted("firstName", ascending: true)
        super.init(coder: aDecoder)
        
    }
    
    private func fetchAndUpdateContacts() {
        var parameterToSortBasedOn = "lastName"
        if let selectedIndex = segmentControl?.selectedSegmentIndex where selectedIndex == 1 {
            parameterToSortBasedOn = "firstName"
        }
        contacts = realm.objects(Contact.self).sorted(parameterToSortBasedOn, ascending: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let rightButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Add, target: self, action: #selector(ContactsViewController.rightBarButtonTapped(_:)))
        rightButton.tintColor = UIColor(colorType: .PinkishRed)
        self.navigationItem.rightBarButtonItem = rightButton
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        
    }
    
}

extension TableViewHandling: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let contactsCell = tableView.dequeueReusableCellWithIdentifier("contactsCell", forIndexPath: indexPath) as? ContactsTableViewCell
        contactsCell?.otherLabel.text = "\(indexPath.row)\(indexPath.row)\(indexPath.row)\(indexPath.row)\(indexPath.row)\(indexPath.row)\(indexPath.row)\(indexPath.row)"
        return contactsCell ?? UITableViewCell()
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        if let detailVC: ContactDetailViewController = UIStoryboard.StoryboardType.Main.instantiateViewController() {
//            detailVC.contactDetails = contacts[indexPath.row]
            self.navigationController?.presentViewController(detailVC, animated: true, completion: {
                //Transition Completed
            })
            CFRunLoopWakeUp(CFRunLoopGetCurrent())
            // http://stackoverflow.com/questions/21075540/presentviewcontrolleranimatedyes-view-will-not-appear-until-user-taps-again
            //
        }
    }
    
}

extension TargetMethods {
    
    func rightBarButtonTapped(button: UIBarButtonItem) {
        
    }
    
}