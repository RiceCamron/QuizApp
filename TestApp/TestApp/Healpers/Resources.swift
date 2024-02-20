//
//  Resources.swift
//  TestApp
//
//  Created by Artur Avdeev on 25.12.2023.
//

import UIKit
enum R {
    enum Colors {
        static var active = UIColor(hexString: "#437BFE")
        static var inactive = UIColor(hexString: "#929DA5")
        
        static var background = UIColor(hexString: "F8F9F9")
        static var separator = UIColor(hexString: "#E8ECEF")
        static var secondary = UIColor(hexString: "#F0F3FF")
        
        static var titleGray = UIColor(hexString: "#545C77")
    }
    
    enum Strings {
//        enum TabBar {
//            static func title(for tab: Tabs) -> String {
//                switch tab {
//                case .map: return "map"
//                case .meets: return "meets"
//                case .notifications: return "notifications"
//                case .profile: return "profile"
//                }
//            }
//        }
    }
    
    enum Images {
//        enum Intro {
//            static func icon(for tab: Tabs) -> UIImage? {
//                switch tab {
//                case .map: UIImage(named: "map")
//                case .meets: UIImage(named: "meets")
//                case .notifications: UIImage(named: "notifications")
//                case .profile: UIImage(named: "profile")
//                }
//            }
//        }
    }
    
    enum Fonts {
        static func helvelticaRegular(with size: CGFloat) -> UIFont {
            UIFont(name: "Helvetica", size: size) ?? UIFont()
        }
    }
}
