import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let presenter = MainPresenter()
        let socialMediaPresenter = SocialMediaPresenter()
        let aboutPresenter = AboutAppPresenter()
        let firstVC = MainViewController(
            presenter: presenter,
            socialMediaPresenter: socialMediaPresenter, 
            aboutPresenter: aboutPresenter
        )
        
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.makeKeyAndVisible()
        let navController = UINavigationController(rootViewController: firstVC)
        window?.rootViewController = navController
        window?.overrideUserInterfaceStyle = .light
        
    }
}
