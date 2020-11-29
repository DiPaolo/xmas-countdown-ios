//
//  PersistentStore.swift
//  XMas Countdown
//
//  Created by Pavel Ditenbir on 29.11.2020.
//

import CoreData

public class PersistentStore {
    
    public static var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }

    public static var persistentContainer: NSPersistentContainer = {
        let store = NSPersistentContainer(name: "Model")

        store.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        
        store.viewContext.automaticallyMergesChangesFromParent = true
        store.viewContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        
        return store
    }()

    public static func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    public static func isContainerInitialized(_ store: NSPersistentContainer) -> Bool {
        let giftsFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "GiftModel")

        do {
            let fetchedGifts = try store.viewContext.fetch(giftsFetch) as! [GiftModel]
            print("==> \(fetchedGifts.count)")
            for gift in fetchedGifts {
                print("day = \(gift.day), image = \(gift.imageName!)")
            }
            
            return fetchedGifts.count > 0;
        } catch {
            fatalError("Failed to fetch gifts: \(error)")
        }
    }
    
    public static func initializeContainer(_ store: NSPersistentContainer) {
        let days = initShuffledArray(24)
        let imageIndexes = initShuffledArray(24)
        
        for i in 1...24 {
            let gift = GiftModel(context: store.viewContext)
            gift.imageName = "The Star Wars/\(imageIndexes[i - 1])"
            gift.day = Int32(days[i - 1])
            gift.isOpened = false
            
            print("day = \(gift.day), image = \(gift.imageName!)")
        }
    }
}

fileprivate func initShuffledArray(_ size: Int) -> Array<Int> {
    var array = Array(repeating: 0, count: size)
    for i in 0..<size {
        array[i] = i + 1
    }
    
    array.shuffle()
    return array
}
