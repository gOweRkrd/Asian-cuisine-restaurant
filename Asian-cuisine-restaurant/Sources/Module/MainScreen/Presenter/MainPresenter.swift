import Foundation

protocol MainViewProtocolInput: AnyObject {
    func viewDidLoad()
    func detachView()
    func item(at index: Int) -> MainModel
    func numberOfItems() -> Int
}

protocol MainViewProtocolOutput: AnyObject {
    func reloadCollectionView()
}

final class MainPresenter: MainViewProtocolInput {
    
    weak var output: MainViewProtocolOutput?
    private var items: [MainModel] = []
    
    func detachView() {
        self.output = nil
    }
    
    func viewDidLoad() {
        items = [
            MainModel(
                text: R.MainItemRestaurants.menu,
                mainImage: .mainTitle,
                image: .menu
            ),
            MainModel(text: R.MainItemRestaurants.promo, mainImage: nil, image: .promo),
            MainModel(text: R.MainItemRestaurants.restaurants, mainImage: nil, image: .restaurants),
            MainModel(text: R.MainItemRestaurants.delivery, mainImage: nil, image: .delivery),
            MainModel(text: R.MainItemRestaurants.feedback, mainImage: nil, image: .feedback),
            MainModel(text: R.MainItemRestaurants.aboutApp, mainImage: nil, image: .restaurants),
            MainModel(
                text: R.MainItemRestaurants.socialMedia,
                mainImage: nil,
                image: .aboutApp
            )
        ]
        output?.reloadCollectionView()
    }
    
    func numberOfItems() -> Int {
        items.count
    }
    
    func item(at index: Int) -> MainModel {
        items[index]
    }
}
