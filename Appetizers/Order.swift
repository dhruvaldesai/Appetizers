
import Foundation
import SwiftUI

class Order: ObservableObject {
   
      @Published var items: [Appetizer] = []
    
    var totalPrice:Double {
        var sum = 0.0
        for item in items{
            sum = sum + item.price
            
        }
        return sum
    }
    
    func add(_ appetizer:Appetizer){
        items.append(appetizer)
    }
}
