//
//  StorageManager.swift
//  StateAnaDataFlow
//
//  Created by Рома Баранов on 16.06.2023.
//

import SwiftUI

final class StorageManager: ObservableObject {
    static let shared = StorageManager()
    
    @AppStorage("isLoggedIn") var isLoggedIn = false
    @AppStorage("name") var name = ""
    
    private init() {}
}
