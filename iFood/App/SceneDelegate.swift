//
//  SceneDelegate.swift
//  iFood
//
//  Created by Lucas Carvalho on 07/12/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    // MARK: - Internal Attributes

    var window: UIWindow?

    // MARK: - Private Attributes

    private var assembler: DependencyGraphProtocol?

    // MARK: - Internal Functions

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        applyNavigationAppearances()
        presentStartFlow(windowScene: windowScene)
    }
    
    // MARK: - Private Functions
    
    private func presentStartFlow(windowScene: UIWindowScene) {
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = UINavigationController()
        if let navigationController = window?.rootViewController as? UINavigationController {
            assembler = DependencyGraph(navigationController: navigationController)
            let flowController = assembler?.makeFlowController()
            flowController?.start()
        }
        window?.makeKeyAndVisible()
    }
    
    private func applyNavigationAppearances() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .primary
        appearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]

        let navBarAppearance = UINavigationBar.appearance()
        navBarAppearance.standardAppearance = appearance;
        navBarAppearance.scrollEdgeAppearance = navBarAppearance.standardAppearance
        navBarAppearance.tintColor = .white
        navBarAppearance.barTintColor = .white
        navBarAppearance.isTranslucent = true
    }
}

