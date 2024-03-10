//
//  AppetizerTitleView.swift
//  Appetizers
//
//  Created by Dhruval Desai on 24/02/24.
//

import SwiftUI
import CachedAsyncImage


struct AppetizerTitleView: View {
    
    var appetizer: Appetizer
    
    var body: some View {
        
        HStack {
            CachedAsyncImage(url: URL(string: appetizer.imageURL)) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                ProgressView()
            }
            .frame(width: 120, height: 90)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            
            
            
            VStack(alignment: .leading, spacing: 5) {
//                Text(MockData.sampleAppetizer.name)
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.medium)
                
//                Text( "$\(MockData.sampleAppetizer.price, specifier:"%.2f")")
                Text( "$\(appetizer.price, specifier:"%.2f")")
                    .font(.title3)
                    .foregroundStyle(.secondary)
                    .fontWeight(.semibold)
            }
            .padding(.leading)
            
        }
    }
}

#Preview {
    AppetizerTitleView(appetizer: MockData.sampleAppetizer)
}
