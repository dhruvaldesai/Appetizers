//
//  EmptyState.swift
//  Appetizers
//
//  Created by Dhruval Desai on 28/02/24.
//

import SwiftUI

struct EmptyState: View {
    var imageName: String
    var textMessage:String
    
    var body: some View {
        
        VStack{
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(height: 175)
            
            Text(textMessage)
                 .font(.title2)
                 .fontWeight(.semibold)
                 .foregroundStyle(.secondary)
                 .multilineTextAlignment(.center)
                 .lineLimit(nil)
                 .padding()
         }
        }
        
      
}

#Preview {
    EmptyState(imageName: "emptyOrder", textMessage: "Please add some dishes to order")
}
