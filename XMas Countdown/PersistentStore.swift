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

    private init() {
        
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

        print("Checking if the persistance container initialized...")
        if isContainerInitialized(store) {
            print("   OK, it's initialized")
        } else {
            print("   Not initialized.")
            
            print("Initializing...")
            initializeContainer(store)
            
            print("Checking if the persistance container initialized...")
            if isContainerInitialized(store) {
                print("   OK, it's initialized")
            } else {
                print("   Not initialized.")
            }
        }
        
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
    
    private static func isContainerInitialized(_ store: NSPersistentContainer) -> Bool {
        let giftsFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "GiftModel")

        do {
            let fetchedGifts = try store.viewContext.fetch(giftsFetch) as! [GiftModel]
            print("==> \(fetchedGifts.count)")
            for gift in fetchedGifts {
                print("  \(gift.imageName!)")
            }
            
            return fetchedGifts.count > 0;
        } catch {
            fatalError("Failed to fetch employees: \(error)")
        }
    }
    
    private static func initializeContainer(_ store: NSPersistentContainer) {
        for i in 1...24 {
            let gift = GiftModel(context: store.viewContext)
            gift.imageName = "The Star Wars/\(i)"
            gift.day = Int32(i)
            gift.isOpened = false
        }
    }
}
