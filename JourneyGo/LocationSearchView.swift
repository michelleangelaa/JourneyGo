//
//  LocationSearchView.swift
//  JourneyGo
//
//  Created by Michelle Angela Aryanto on 20/05/24.
//

import SwiftUI

struct LocationSearchView: View {
    @State private var startLocationText = ""
    @Binding var mapState: MapViewState
    @EnvironmentObject var viewModel: LocationSearchViewModel
    
    var body: some View {
        HStack {
            VStack {
                HStack {
                    VStack {
                        Circle()
                            .fill(Color(.systemGray3))
                            .frame(width: 6, height: 6)
                        
                        Rectangle()
                            .fill(Color(.systemGray3))
                            .frame(width: 1, height: 24)
                        
                        Circle()
                            .fill(.black)
                            .frame(width: 6, height: 6)
                    }
                    VStack {
                        TextField("Current Location", text: $startLocationText)
                            .padding(.leading, 4)
                            .frame(height: 32)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color(.systemGray4))
                                    .padding(.trailing, 8)
                            )
                        TextField("Where to?", text: $viewModel.queryFragment)
                            .padding(.leading, 4)
                            .frame(height: 32)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color(.systemGroupedBackground))
                                    .padding(.trailing, 8)
                            )
                    }
                }
                .padding(.horizontal)
                .padding(.top, 64)
                
                Divider()
                    .padding(.vertical)
                
                ScrollView {
                    VStack(alignment: .leading) {
                        ForEach(viewModel.results, id: \.self) { result in
                            LocationSearchResultCell(title: result.title, subtitle: result.subtitle)
                                .onTapGesture {
                                    withAnimation(.spring) {
                                        viewModel.selectLocation(result)
                                        mapState = .locationSelected
                                    }
                                }
                        }
                    }
                }
            }
            .frame(width: 500)
            .background(Color.theme.backgroundColor)
            
            Spacer()
        }
    }
}

#Preview {
    LocationSearchView(mapState: .constant(.searchingForLocation))
}
