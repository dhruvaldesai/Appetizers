
import Foundation
import SwiftUI

struct AlertItem {
    let title: String
    let message: String
    let dismissButton: Alert.Button
}

struct AlertItemContext {
    static var invalidData          = AlertItem(title: "Server Error",
                                            message: "Wrong Data",
                                            dismissButton: .default(Text("ok")) )
    
    static var invalidURL           = AlertItem(title: "Server Error",
                                            message: "Wrongv URL",
                                            dismissButton: .default(Text("ok")) )
    
    static var invalidResponse      = AlertItem(title: "Server Error",
                                            message: "Wrong response",
                                            dismissButton: .default(Text("ok")) )
    
    static var unableToComplete     = AlertItem(title: "Server Error",
                                            message: "internet problem",
                                            dismissButton: .default(Text("ok")) )
    
    static var invelidForm          = AlertItem(title: "Server Error",
                                                message: "Please fill up all the details",
                                                dismissButton: .default(Text("Ok")))
    
    static var invelidEmail         = AlertItem(title: "Server Error",
                                                message: "Please enter valid email address",
                                                dismissButton: .default(Text("Ok")))
    
    static var userDataSaved         = AlertItem(title: "Server Error",
                                                message: "Data saved successfully",
                                                dismissButton: .default(Text("Ok")))
    
    static var failedToSaved         = AlertItem(title: "Server Error",
                                                message: "Data Not saved properly",
                                                dismissButton: .default(Text("Ok")))
    
    static var failedToLoad         = AlertItem(title: "Server Error",
                                                message: "Failed To Load Account Details",
                                                dismissButton: .default(Text("Ok")))
    
    
    
    
}
