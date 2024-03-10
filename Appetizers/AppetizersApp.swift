import SwiftUI

@main
struct AppetizersApp: App {
    
    @StateObject var order = Order()
    
    var body: some Scene {
        WindowGroup {
            AppetizerTabView().environmentObject(order)
        }
    }
}
