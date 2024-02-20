//
//  SceneDelegate.swift
//  TestApp
//
//  Created by Artur Avdeev on 25.12.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        let controller = UserSettings.username != nil ? TabBarController() : PageController()
        let navigationController = UINavigationController(rootViewController: controller)
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        print(SelectionModel.data.football.clubs.study[0].id)
    }

    
}

