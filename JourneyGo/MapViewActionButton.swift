//
//  MapViewActionButton.swift
//  JourneyGo
//
//  Created by Michelle Angela Aryanto on 20/05/24.
//

import SwiftUI

struct MapViewActionButton: View {
    @Binding var mapState: MapViewState
    @EnvironmentObject var viewModel: LocationSearchViewModel

    var body: some View {
        if mapState != .noInput {
            Button {
                withAnimation(.spring()) {
                    actionForState(mapState)
                }
            } label: {
                Image(systemName: imageNameForState(mapState))
                    .font(.title2)
                    .foregroundColor(.black)
                    .padding()
                    .background(.white)
                    .clipShape(Circle())
                    .shadow(radius: 6)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }

    func actionForState(_ state: MapViewState) {
        switch state {
        case .searchingForLocation:
            mapState = .noInput

        case .locationSelected, .polylineAdded:
            mapState = .noInput
            viewModel.selectedVehicleLocation = nil
        case .noInput:
            break
        }
    }

    func imageNameForState(_ state: MapViewState) -> String {
        switch state {
        case .searchingForLocation, .locationSelected, .polylineAdded:
            return "arrow.left"
        case .noInput:
            return ""
        }
    }
}

#Preview {
    MapViewActionButton(mapState: .constant(.noInput))
}
