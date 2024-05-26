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
                
                VStack(spacing: 4) {
                    ForEach(RideType.allCases) { type in
                            
                        HStack {
                            Image(systemName: type.imageName)
                                .fontWeight(.medium)
//                                .resizable()
//                                .frame(width: 50, height: 50)
//                                .scaledToFit()
                            VStack (alignment: .leading) {
                                HStack(spacing: 4) {
                                    Text(type.description)
                                        .font(.system(size: 20, weight: .semibold))
                                        //
                                        //                                    Text("Rp " + locationViewModel .computeRidePrice(forType: type).toCurrency())
                                        //                                        .font(.system(size: 14, weight: .semibold))
    //                                    .padding()
                                }
                                HStack {
                                    HStack {
                                        Text("⚡️")
                                        Text(" 23")
                                            .font(.system(size: 12, weight: .semibold))

                                    }
                                    HStack {
                                        Text("⚡️")
                                        Text(" 23")
                                    }
                                    HStack {
                                        Text("⚡️")
                                        Text(" 23")
                                    }
                                    HStack {
                                        Text("⚡️")
                                        Text(" 23")
                                    }
                                    HStack {
                                        Text("⚡️")
                                        Text(" 23")
                                    }
                                    
                                }
                            }
                        }
                        
                           
                        .frame(width: 480, height: 80)
                        .foregroundColor(type == selectedRideType ? .white : Color.theme.primaryTextColor)
                        .background(type == selectedRideType ? .blue : Color.theme.secondaryBackgroundColor)
                        .scaleEffect(type == selectedRideType ? 1.2 : 1.0)
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

                HStack(spacing: 12) {
                    Text("Visa")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .padding(6)
                        .background(Color.theme.secondaryBackgroundColor)
                        .clipShape(RoundedRectangle(cornerRadius: 4))
                        .foregroundStyle(.white)
                        .padding(.leading)
                    
                    Text("**** 1234")
//                        .fontWeight(.bold)
                    
                    Spacer()
                    
                    Image(systemName: "chevron.right")
                        .imageScale(/*@START_MENU_TOKEN@*/ .medium/*@END_MENU_TOKEN@*/)
                        .padding()
                }
                .frame(height: 50)
                .background(Color(.systemGroupedBackground))
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding(.horizontal)
                
                Divider()
                    .padding(.vertical, 4)
                    .opacity(0)

                Button {} label: {
                    Text("CONFIRM RIDE")
                        .fontWeight(/*@START_MENU_TOKEN@*/ .bold/*@END_MENU_TOKEN@*/)
                        .foregroundStyle(Color(.white))
                        .padding(.horizontal)
                        .frame(width: UIScreen.main.bounds.width - 32, height: 50)
                        .background(Color(.blue))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .scaledToFill()
                }
            }
            .frame(width: 500, height: UIScreen.main.bounds.height)
            .background(Color.theme.backgroundColor)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            Spacer()
        }
    }
}

#Preview {
    RideRequestView()
}
