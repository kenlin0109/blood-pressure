//
//  blood_pressureApp.swift
//  blood pressure
//
//  Created by 林秀謙 on 2023/8/25.
//

import SwiftUI

@main
struct blood_pressureApp: App {
    var body: some Scene {
        let bloodPressureController = BloodPressureController.shared
        //用於將託管物件內容注入環境的程式碼
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, bloodPressureController.container.viewContext)
        }
    }
}
