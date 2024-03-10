//
//  AccountViewModel.swift
//  Appetizers
//
//  Created by Dhruval Desai on 27/02/24.
//

import Foundation
import SwiftUI

class AccountViewModel: ObservableObject {
    
    @AppStorage("user") var userData: Data?
    
    @Published var user = User()
    @Published var isShowingAlert = false
    @Published var alertError: AlertItem?
    
    var isValidForm: Bool{
        guard !user.firstName.isEmpty && !user.lastName.isEmpty && !user.emailId.isEmpty else{
            alertError = AlertItemContext.invelidForm
            return false
        }
        guard isValidEmail(user.emailId) else{
            alertError = AlertItemContext.invelidEmail
            return false
        }
        
        return true
    }
    
    func saveChanges(){
        
        guard isValidForm else {
            isShowingAlert = true
            
            return
        }
        
        do {
            let encoder = JSONEncoder()
            userData = try encoder.encode(user)
            alertError = AlertItemContext.userDataSaved
        }
        catch {
            alertError = AlertItemContext.failedToSaved
        }
        isShowingAlert = true

    }

    
    func getUserData(){
        guard let data = userData else {
            return
        }
        do {
            let decoder = JSONDecoder()
            user = try decoder.decode(User.self, from: data)
        }
        catch {
            alertError = AlertItemContext.failedToLoad
            isShowingAlert = true
        }
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
}


