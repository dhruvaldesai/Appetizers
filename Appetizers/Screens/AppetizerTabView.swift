import SwiftUI

struct AppetizerTabView: View {
    @EnvironmentObject var order: Order
    
    var body: some View {
        TabView{
            AppetizerListView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            
            AccountView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Account")
                }
            
            OrderView()
                .tabItem {
                    Image(systemName: "cart")
                    Text("Order")
                }
                .badge(order.items.count)
            
        }
        .tint(Color("brandPrimary"))
        
            
    }
}

#Preview {
    AppetizerTabView()
}
