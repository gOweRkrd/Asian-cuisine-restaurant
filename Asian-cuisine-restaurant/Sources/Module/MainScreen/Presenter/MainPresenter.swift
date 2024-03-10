import Foundation

protocol MainViewProtocol: AnyObject {
    func reloadCollectionView()
}

final class MainPresenter {
    
    weak var view: MainViewProtocol?
    private var items: [MainModel] = []
    
    func attachView(_ view: MainViewProtocol) {
        self.view = view
    }
    
    func detachView() {
        self.view = nil
    }
    
    func viewDidLoad() {
        items = [
            MainModel(
                text: R.MainItemRestaurants.menu,
                nameRestaurants: R.MainItemRestaurants.nameRestaurants,
                image: .меню
            ),
            MainModel(text: R.MainItemRestaurants.promo, nameRestaurants: nil, image: .акции),
            MainModel(text: R.MainItemRestaurants.restaurants, nameRestaurants: nil, image: .рестораны),
            MainModel(text: R.MainItemRestaurants.delivery, nameRestaurants: nil, image: .доставка),
            MainModel(text: R.MainItemRestaurants.feedback, nameRestaurants: nil, image: .оставитьОтзыв),
            MainModel(text: R.MainItemRestaurants.aboutApp, nameRestaurants: nil, image: .рестораны),
            MainModel(
                text: R.MainItemRestaurants.socialMedia,
                nameRestaurants: nil,
                image: .оПриложении
            )
        ]
        view?.reloadCollectionView()
    }
    
    func numberOfItems() -> Int {
        items.count
    }
    
    func item(at index: Int) -> MainModel {
        items[index]
    }
}
