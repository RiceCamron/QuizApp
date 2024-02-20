//
//  IntroModel.swift
//  TestApp
//
//  Created by Artur Avdeev on 02.02.2024.
//

import UIKit

struct IntroData {
    let backgroundImage: UIImage?
    let title: String?
    let description: String?
}

class IntroModel {
    static let shared = IntroModel()

    private let introData: [IntroData] = [
        IntroData(backgroundImage: UIImage(named: "introBg1"), title: "LEARN FOOTBALL LIKE A\nREAL PRO!", description: "Uncover your knowledge of the rules, famous players, become a real expert in this field."),
        IntroData(backgroundImage: UIImage(named: "introBg2"), title: "All basketball information in our app!", description: "Show your strength and become a real basketball quiz champion."),
        IntroData(backgroundImage: UIImage(named: "introBg3"), title: nil, description: nil),
        // Add more intro data as needed
    ]

    func getData(forIndex index: Int) -> IntroData {
        return introData[index]
    }
}
