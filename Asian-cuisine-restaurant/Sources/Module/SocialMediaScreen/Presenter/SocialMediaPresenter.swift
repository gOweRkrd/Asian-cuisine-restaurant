import Foundation

protocol SocialMediaViewProtocol: AnyObject {
    func reloadCollectionView()
}

final class SocialMediaPresenter {
    
    weak var view: SocialMediaViewProtocol?
    private var items: [SocialMediaModel] = []
    
    func attachView(_ view: SocialMediaViewProtocol) {
        self.view = view
    }
    
    func detachView() {
        self.view = nil
    }
    
    func viewDidLoad() {
        items = [
            SocialMediaModel(socialBrend: R.SocialMedia.facebook),
            SocialMediaModel(socialBrend: R.SocialMedia.vk),
            SocialMediaModel(socialBrend: R.SocialMedia.twitter),
            SocialMediaModel(socialBrend: R.SocialMedia.instagram),
            SocialMediaModel(socialBrend: R.SocialMedia.odnoklassniki)
        ]
        view?.reloadCollectionView()
    }
    
    func numberOfItems() -> Int {
        items.count
    }
    
    func item(at index: Int) -> SocialMediaModel {
        items[index]
    }
}
