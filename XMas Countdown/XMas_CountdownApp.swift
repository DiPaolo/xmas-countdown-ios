//
//  XMas_CountdownApp.swift
//  XMas Countdown
//
//  Created by Pavel Ditenbir on 21.11.2020.
//

//import BackgroundTasks
//import os
//import SwiftUI
//import OSLog

//@main
//struct XMas_CountdownApp: App {
//    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
//
//    let context = PersistentStore.persistentContainer.viewContext
//    
//    init() {
//        let logger = Logger(subsystem: Bundle.main.bundleIdentifier!, category: "common")
//        logger.log("XMas_CountdownApp::init()")
//
//        print("Checking if the persistance container initialized...")
//        if PersistentStore.isContainerInitialized(PersistentStore.persistentContainer) {
//            print("      OK, it's initialized")
//        } else {
//            print("      Not initialized.")
//            
//            print("Initializing...")
//            PersistentStore.initializeContainer(PersistentStore.persistentContainer)
//            PersistentStore.saveContext()
//            
//            print("   Checking if the persistance container initialized...")
//            if PersistentStore.isContainerInitialized(PersistentStore.persistentContainer) {
//                print("      OK, it's initialized")
//            } else {
//                print("      Not initialized.")
//            }
//        }
//    }
//
//    var body: some Scene {
//        WindowGroup {
//            ContentView()
//                .environment(\.managedObjectContext, context)
//                .onAppear() {
//                    UserNotificationHelper.updateBadgeCounter()
//                }
//        }
//    }
//}

//@main
//class AppDelegate: NSObject, UIApplicationDelegate {
//    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
//        let logger = Logger(subsystem: Bundle.main.bundleIdentifier!, category: "common")
//        logger.info("application   didFinishLaunchingWithOptions")
//        if #available(iOS 13, *) {
//            BGTaskScheduler.shared.register(forTaskWithIdentifier: "com.dipaolo.XMas-CountdownBgFetch", using: nil) { task in
//                logger.info("[BGTASK] Perform bg fetch com.dipaolo.XMas-CountdownBgFetch")
//                task.setTaskCompleted(success: true)
//                self.scheduleAppRefresh()
//            }
//        }
//        return true
//    }
//
//    @available(iOS 13.0, *)
//    func scheduleAppRefresh() {
//        let request = BGAppRefreshTaskRequest(identifier: "com.dipaolo.XMas-CountdownBgFetch")
//
//        request.earliestBeginDate = Date(timeIntervalSinceNow: 5 * 60) // Refresh after 5 minutes.
//
//        do {
//            try BGTaskScheduler.shared.submit(request)
//        } catch {
//            print("Could not schedule app refresh task \(error.localizedDescription)")
//        }
//    }
//    
//    func applicationDidEnterBackground(_ application: UIApplication) {
//        let logger = Logger(subsystem: Bundle.main.bundleIdentifier!, category: "common")
//        logger.info("App did enter background")
//        if #available(iOS 13, *) {
//            self.scheduleAppRefresh()
//        }
//    }
//}
