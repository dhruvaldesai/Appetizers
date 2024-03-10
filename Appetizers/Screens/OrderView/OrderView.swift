
import SwiftUI

struct OrderView: View {
    @EnvironmentObject var order: Order
    
    //@State var orders = MockData.orderItemMenu
    
    var body: some View {

        NavigationStack{
            
            ZStack{
//                if !orders.isEmpty{
                if !order.items.isEmpty{
                    VStack{
                        List($order.items,  editActions: .delete){ $appetizer in
                            AppetizerTitleView(appetizer: appetizer)
                            
                        }
                        .listStyle(.plain)
                         Spacer()
                        
                        Button{
                            
                        }label: {
                            Text("$\(order.totalPrice, specifier: "%.2f") - Place Order")
                                .font(.title2)
                                .fontWeight(.semibold)
                        }
                        .buttonStyle(.borderedProminent)
                        .controlSize(.large)
                        .tint(.brandPrimary)
                        .padding(.bottom, 25)
                    
                    
                    }
                    
                }
                
                else {
                    EmptyState(imageName: "emptyOrder", textMessage: "Please add dishes to cart ")
                }
                
            }
            .navigationTitle("🛒 Orders")
            
        }
        
    }
}

#Preview {
    OrderView()
}
