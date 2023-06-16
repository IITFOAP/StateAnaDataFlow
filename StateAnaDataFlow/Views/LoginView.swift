//
//  LoginView.swift
//  StateAnaDataFlow
//
//  Created by Alexey Efimov on 14.06.2023.
//

import SwiftUI

struct LoginView: View {
    @State private var name = ""
    @State private var color = Color(.red)
    @State private var isButtonDisable = true
    @StateObject private var user = StorageManager.shared
    
    private var count: Int {
        return name.filter{ $0.isLetter }.count
    }
    
    var body: some View {
        VStack {
            HStack {
                TextField("Enter your name...", text: $name)
                    .multilineTextAlignment(.center)
                    .onChange(of: name) { _ in
                        changeColor()
                    }
                Text("\(count)")
                    .foregroundColor(color)
            }
            Button(action: login) {
                HStack {
                    Image(systemName: "checkmark.circle")
                    Text("OK")
                }
            }
            .disabled(isButtonDisable)
        }
        .padding()
    }
    
    private func login() {
        if count >= 3 {
            user.name = name
            user.isLoggedIn.toggle()
        }
    }
    
    private func changeColor() {
        if count >= 3 {
            color = .green
            isButtonDisable = false
        } else {
            color = .red
            isButtonDisable = true
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
