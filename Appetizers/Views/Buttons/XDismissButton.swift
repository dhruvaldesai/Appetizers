//
//  XDismissButton.swift
//  Appetizers
//
//  Created by Dhruval Desai on 27/02/24.
//

import SwiftUI

struct XDismissButton: View {
    var body: some View {
        ZStack{
            Circle()
                .frame(width: 25, height: 25)
                .foregroundColor(.white)
                .opacity(0.6)
            
            Image(systemName: "xmark")
                .foregroundStyle(.black)
                .imageScale(.small)
                .frame(width: 40, height: 40)
        }
    }
}

#Preview {
    XDismissButton()
}
