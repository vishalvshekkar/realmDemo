//
//  RealmExtension.swift
//  RealmDemo
//
//  Created by Vishal on 18/08/16.
//  Copyright © 2016 Vishal. All rights reserved.
//

import UIKit
import RealmSwift

protocol CascadingDeletable {
    func childrenToDelete() -> [AnyObject?]
}

extension Agency: CascadingDeletable {
    func childrenToDelete() -> [AnyObject?] {
        return [_address, logos]
    }
}

func cascadingDelete(object: AnyObject?) {
    if let deletable = object as? CascadingDeletable {
        deletable.childrenToDelete().forEach{ child in
            cascadingDelete(child)
        }
    }
    
    if let realmArray = object as? RLMArray {
        let array = realmArray.flatMap{$0}
        array.forEach { item in
            cascadingDelete(item)
        }
    }
    
    if let realmObject = object as? RLMObject {
        transactionWithBlock { [weak self] in
            self?.realm.deleteObject(realmObject)
        }
    }
}