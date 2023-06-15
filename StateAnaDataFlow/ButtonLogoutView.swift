//
//  ButtonLogoutView.swift
//  StateAnaDataFlow
//
//  Created by Рома Баранов on 15.06.2023.
//

import SwiftUI

struct ButtonLogoutView: View {
    @EnvironmentObject private var user: UserSettings
    
    var body: some View {
        Button(action: logout) {
            Text("Logout")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
        }
        .frame(width: 200, height: 60)
        .background(.red)
        .cornerRadius(20)
        .overlay {
            RoundedRectangle(cornerRadius: 20)
                .stroke(.black, lineWidth: 4)
        }
    }
    
    private func logout() {
        user.isLoggedIn.toggle()
    }
}

struct ButtonStartView: View {
    @ObservedObject var timer: TimeCounter
    
    var body: some View {
        Button(action: timer.startTimer) {
            Text(timer.buttonTitle)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
        }
        .frame(width: 200, height: 60)
        .background(.green)
        .cornerRadius(20)
        .overlay {
            RoundedRectangle(cornerRadius: 20)
                .stroke(.black, lineWidth: 4)
        }
    }
}

