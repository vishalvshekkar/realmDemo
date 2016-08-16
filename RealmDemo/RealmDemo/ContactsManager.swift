//
//  ContactsManager.swift
//  RealmDemo
//
//  Created by Vishal V Shekkar on 16/08/16.
//  Copyright © 2016 Vishal. All rights reserved.
//

import Foundation
import RealmSwift

private typealias ManagerConstants = ContactsManager

class ContactsManager {
    
    let realm: Realm
    var contacts: Results<Contact>
    
    init?() {
        do {
            realm = try Realm()
        } catch let error {
            print(error)
            return nil
        }
        contacts = realm.objects(Contact.self).sorted(ContactsManager.firstName, ascending: true)
    }
    
    func refreshContactsList(sortedByAttribute: String) {
        contacts = realm.objects(Contact.self).sorted(sortedByAttribute, ascending: true)
    }
    
    func addContact(withContact: Contact) {
        do {
            try realm.write({ 
                realm.add(withContact)
            })
//            try realm.commitWrite()
        } catch let error {
            print(error)
        }
    }
    
}

extension ManagerConstants {
    
    static let firstName = "firstName"
    static let lastName = "lastName"
    
}