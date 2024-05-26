//
//  RideType.swift
//  JourneyGo
//
//  Created by Michelle Angela Aryanto on 21/05/24.
//

import Foundation

enum RideType: Int, CaseIterable, Identifiable {
    case walk
    case bike
    case motorbike
    case car

    var id: Int { return rawValue }

    var description: String {
        switch self {
        case .walk: return "Walk"
        case .bike: return "Bike"
        case .motorbike: return "Motorbike"
        case .car: return "Car"
        }
    }

    var imageName: String {
        switch self {
        case .walk: return "figure.walk"
        case .bike: return "bicycle"
        case .motorbike: return "figure.indoor.cycle"
        case .car: return "car"
        }
    }

    var healthRate: Double {
        switch self {
        case .walk: return 10
        case .bike: return 8
        case .motorbike: return 4
        case .car: return 2
        }
    }

    var timeRate: Double {
        switch self {
        case .walk: return 2
        case .bike: return 4
        case .motorbike: return 8
        case .car: return 10
        }
    }

    var environmentalRate: Double {
        switch self {
        case .walk: return 10
        case .bike: return 8
        case .motorbike: return 3
        case .car: return 1
        }
    }

    var antiStressRate: Double {
        switch self {
        case .walk: return 8
        case .bike: return 6
        case .motorbike: return 4
        case .car: return 5
        }
    }

    var efficiencyRate: Double {
        switch self {
        case .walk: return 3
        case .bike: return 5
        case .motorbike: return 8
        case .car: return 10
        }
    }

//    var baseFare: Double {
//        switch self {
//        case .uberX: return 5
//        case .black: return 20
//        case .uberXL: return 10
//        }
//    }
//
//    func computerPrice(for distanceInMeters: Double) -> Double {
//        let distanceInMiles = distanceInMeters / 1600
//
//        switch self {
//        case .uberX: return distanceInMiles * 1.5 + baseFare
//        case .black: return distanceInMiles * 2.0 + baseFare
//        case .uberXL: return distanceInMiles * 1.75 + baseFare
//        }
//    }
}
