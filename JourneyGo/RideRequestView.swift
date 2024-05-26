//
//  RideRequestView.swift
//  JourneyGo
//
//  Created by Michelle Angela Aryanto on 21/05/24.
//

import SwiftUI

struct RideRequestView: View {
    @State private var selectedRideType: RideType = .walk
    @EnvironmentObject var locationViewModel: LocationSearchViewModel
    
    var body: some View {
        HStack {
            VStack {
                HStack {
                    VStack {
                        Circle()
                            .fill(Color(.systemGray3))
                            .frame(width: 8, height: 8)
                        
                        Rectangle()
                            .fill(Color(.systemGray3))
                            .frame(width: 1, height: 32)
                        
                        Circle()
                            .fill(.black)
                            .frame(width: 8, height: 8)
                    }
                    
                    VStack(alignment: .leading, spacing: 24) {
                        HStack {
                            Text("Current Location")
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundColor(.gray)
                            
                            Spacer()
                            
                            Text(locationViewModel.pickupTime ?? "")
                                .font(.system(size: 14, weight: .semibold))
                                .foregroundColor(.gray)
                        }
                        .padding(.bottom, 10)

                        HStack {
                            if let location = locationViewModel.selectedVehicleLocation {
                                Text(location.title)
                                    .font(.system(size: 16, weight: .semibold))
                            }
                            
                            Spacer()
                            
                            Text(locationViewModel.dropOffTime ?? "")
                                .font(.system(size: 14, weight: .semibold))
                                .foregroundColor(.gray)
                        }
                    }
                    .padding(.leading, 8)
                }
                .padding()
                
                Divider()
                            
                Text("SUGGESTED TRANSPORTATIONS")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .padding()
                    .foregroundColor(.gray)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                VStack(spacing: 8) {
                    ForEach(RideType.allCases) { type in
                            
                        HStack(spacing: 16) {
                            Image(systemName: type.imageName)
                                .fontWeight(.heavy)
                                .padding(.leading, 20)
//                                .resizable()
//                                .frame(width: 50, height: 50)
//                                .scaledToFit()
                            VStack(alignment: .leading, spacing: 2) {
                                HStack(spacing: 4) {
                                    Text(type.description)
                                        .font(.system(size: 20, weight: .semibold))
                                    //
                                    Text("Pts: " + locationViewModel.computeRidePrice(forType: type).toCurrency())
                                        .font(.system(size: 14, weight: .semibold))
                                        .padding()
                                }
                                HStack {
                                    HStack {
                                        Text("⛑️")
                                        Text("\(type.healthRate)")
                                            .font(.subheadline)
//                                            .font(.system(size: 12, weight: .semibold))
                                    }
                                    HStack {
                                        Text("🍃")
                                        Text("\(type.environmentalRate)")
                                            .font(.subheadline)
                                    }
                                    HStack {
                                        Text("🧘")
                                        Text("\(type.antiStressRate)")
                                            .font(.subheadline)
                                    }
                                    HStack {
                                        Text("💨")
                                        Text("\(type.efficiencyRate)")
                                            .font(.subheadline)
                                    }
                                }
                            }
                            Spacer()
                        }
                        .frame(width: 460, height: 100)
                        .foregroundColor(type == selectedRideType ? .white : Color.theme.primaryTextColor)
                        .background(type == selectedRideType ? .blue : Color.theme.secondaryBackgroundColor)
                        .scaleEffect(type == selectedRideType ? 1.05 : 1.0)
                        .cornerRadius(10)
                        .onTapGesture {
                            withAnimation(.spring()) {
                                selectedRideType = type
                            }
                        }
                    }
                }
         
                .padding(.horizontal)
                
                Divider()
                    .padding(.vertical, 8)
                    .opacity(0)
                
                Divider()
                    .padding(.vertical, 4)
                    .opacity(0)

                Button { } label: {
                    Text("JourneyGo!")
                        .fontWeight(/*@START_MENU_TOKEN@*/ .bold/*@END_MENU_TOKEN@*/)
                        .foregroundStyle(Color(.white))
                        .padding(.horizontal)
                        .frame(width: 460, height: 50)
                        .background(Color(.gray))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .scaledToFill()
                }
            }
            .frame(width: 500, height: 750)
            .background(Color.theme.backgroundColor)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            Spacer()
        }
    }
}

#Preview {
    RideRequestView()
}
