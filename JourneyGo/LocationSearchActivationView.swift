//
//  LocationSearchActivationView.swift
//  JourneyGo
//
//  Created by Michelle Angela Aryanto on 20/05/24.
//

import SwiftUI

struct LocationSearchActivationView: View {
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
            Text("Where to go?")
                .foregroundColor(Color(.darkGray))
            
            Spacer()
        }
        .padding(.leading, 20)
        .frame(width: 450, height: 50)

        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.white)
                .shadow(radius: 1)
                
        )
    }
}

#Preview {
    LocationSearchActivationView()
}
