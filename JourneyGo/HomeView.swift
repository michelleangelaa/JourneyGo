//
//  HomeView.swift
//  JourneyGo
//
//  Created by Michelle Angela Aryanto on 19/05/24.
//

import SwiftUI

struct HomeView: View {
    @State private var mapState = MapViewState.noInput
    @EnvironmentObject var locationViewModel: LocationSearchViewModel

    var body: some View {
        ZStack(alignment: .bottom) {
            ZStack(alignment: .top) {
                JourneyMapViewRepresentable(mapState: $mapState)
                    .ignoresSafeArea()

                if mapState == .searchingForLocation {
                    LocationSearchView(mapState: $mapState)
                        .transition(.move(edge: .bottom))
                    JourneyMapViewRepresentable(mapState: $mapState)
                        .padding(.leading, 500)
                        .ignoresSafeArea()

                } else if mapState == .noInput {
                    ZStack(alignment: .bottomLeading) {
                        VStack {
                            Spacer()
                            HStack {
                                LocationSearchActivationView()
                                    .padding(.bottom, 72)
                                    .onTapGesture {
                                        withAnimation(.spring()) {
                                            mapState = .searchingForLocation
                                        }
                                    }
                                Spacer()
                            }
                        }
                        .padding(.leading, 20)
                       
                    }
                }
                ZStack {
                    MapViewActionButton(mapState: $mapState)
                        .padding(.leading)
                        .padding(.top, 4)
                }
               
            }
          
            if mapState == .locationSelected || mapState == .polylineAdded {
                RideRequestView()
                JourneyMapViewRepresentable(mapState: $mapState)
                    .padding(.leading, 500)
                    .ignoresSafeArea()
                
              
            }
           
            
    
        }
        .edgesIgnoringSafeArea(.bottom)
        .onReceive(LocationManager.shared.$userLocation, perform: { location in
            if let location = location {
                locationViewModel.userLocation = location
            }
        })
    }
}

#Preview {
    HomeView()
}
