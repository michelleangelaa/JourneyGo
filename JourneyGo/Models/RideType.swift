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

    var healthRate: Int {
        switch self {
        case .walk: return 10
        case .bike: return 8
        case .motorbike: return 4
        case .car: return 2
        }
    }

    var timeRate: Int {
        switch self {
        case .walk: return 2
        case .bike: return 4
        case .motorbike: return 8
        case .car: return 10
        }
    }

    var environmentalRate: Int {
        switch self {
        case .walk: return 10
        case .bike: return 8
        case .motorbike: return 3
        case .car: return 1
        }
    }

    var antiStressRate: Int {
        switch self {
        case .walk: return 8
        case .bike: return 6
        case .motorbike: return 4
        case .car: return 5
        }
    }

    var efficiencyRate: Int {
        switch self {
        case .walk: return 3
        case .bike: return 5
        case .motorbike: return 10
        case .car: return 8
        }
    }
    
    func computeScore() -> Int {
        return (healthRate + timeRate + environmentalRate + antiStressRate + efficiencyRate) / 5
    }

    var baseFare: Double {
        switch self {
        case .walk:
            return Double(computeScore())
        case .bike:
            return Double(computeScore())
        case .motorbike:
            return Double(computeScore())
        case .car:
            return Double(computeScore())
        }
    }

    func computerPrice(for distanceInMeters: Double) -> Double {
        let distanceInMiles = distanceInMeters / 1600

        switch self {
        case .walk: return distanceInMiles * 0.3 + baseFare
        case .bike: return distanceInMiles * 1 + baseFare
        case .motorbike: return distanceInMiles * 3 + baseFare
        case .car: return distanceInMiles * 5 + baseFare
        }
    }
}
