import Foundation

protocol SocialMediaViewProtocolInput: AnyObject {
    func viewDidLoad()
    func detachView()
    func item(at index: Int) -> SocialMediaModel
    func numberOfItems() -> Int
}

protocol SocialMediaProtocolOutput: AnyObject {
    func reloadCollectionView()
}

final class SocialMediaPresenter: SocialMediaViewProtocolInput {
    
    weak var output: SocialMediaProtocolOutput?
    private var items: [SocialMediaModel] = []
    
    func detachView() {
        self.output = nil
    }
    
    func viewDidLoad() {
        items = [
            SocialMediaModel(socialBrend: R.SocialMedia.facebook),
            SocialMediaModel(socialBrend: R.SocialMedia.vk),
            SocialMediaModel(socialBrend: R.SocialMedia.twitter),
            SocialMediaModel(socialBrend: R.SocialMedia.instagram),
            SocialMediaModel(socialBrend: R.SocialMedia.odnoklassniki)
        ]
        output?.reloadCollectionView()
    }
    
    func numberOfItems() -> Int {
        items.count
    }
    
    func item(at index: Int) -> SocialMediaModel {
        items[index]
    }
}
