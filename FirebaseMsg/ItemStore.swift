//
//  ItemStore.swift
//  FirebaseMsg
//
//  Created by 현식 김 on 2017. 4. 21..
//  Copyright © 2017년 현식 김. All rights reserved.
//

import UIKit

class ItemStore {
    var allItmes = [Item]()
    
    let itemAchiveURL: URL = {
        let documentsDirectories = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDirectory = documentsDirectories.first!
        return documentDirectory.appendingPathComponent("items.archive")
    }()
    
    init(){
        if let archivedItems = NSKeyedUnarchiver.unarchiveObject(withFile: itemAchiveURL.path) as? [Item]{
            allItmes = archivedItems
        }
    }
    
    @discardableResult func createItem() -> Item {
        let newItem = Item(random: true)
        allItmes.append(newItem)
        return newItem
    }
    
    func moveItem(from fromIndex: Int, to toIndex: Int){
        if fromIndex == toIndex{
            return
        }
        let movedItem = allItmes[fromIndex]
        allItmes.remove(at: fromIndex)
        allItmes.insert(movedItem, at: toIndex)
    }
    
    func removeItem(_ item: Item){
        if let index = allItmes.index(of: item){
            allItmes.remove(at: index)
        }
    }
    
    func saveChanges() -> Bool{
        print("Saving items to: \(itemAchiveURL.path)")
        return NSKeyedArchiver.archiveRootObject(allItmes, toFile: itemAchiveURL
        .path)
    }
    
}
