//
//  SceneDelegate.swift
//  TableViewApp
//
//  Created by Toleu Bakhauddin on 13.11.2025.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    // MARK: - Scene Lifecycle
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Configure and attach UIWindow to the scene
        guard let _ = (scene as? UIWindowScene) else { return }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Release scene resources when disconnected
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Resume tasks when scene becomes active
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Pause tasks when scene will become inactive
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Update UI when transitioning to foreground
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Save data when transitioning to background
    }
}

