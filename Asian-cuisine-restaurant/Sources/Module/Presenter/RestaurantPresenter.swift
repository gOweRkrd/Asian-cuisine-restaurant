import Foundation

protocol RestaurantViewProtocol: AnyObject {
    func reloadCollectionView()
}

final class RestaurantPresenter {
    
    weak var view: RestaurantViewProtocol?
    private var items: [RestaurantModel] = []
    
    func attachView(_ view: RestaurantViewProtocol) {
        self.view = view
    }
    
    func detachView() {
        self.view = nil
    }
    
    func viewDidLoad() {
        items = [
            RestaurantModel(text: "НИЯМА", image: .ниама),
            RestaurantModel(text: "АКЦИИ", image: .акции),
            RestaurantModel(text: "МЕНЮ", image: .меню),
            RestaurantModel(text: "РЕСТОРАНЫ", image: .рестораны),
            RestaurantModel(text: "ДОСТАВКА", image: .доставка),
            RestaurantModel(text: "ОСТАВИТЬ ОТЗЫВ", image: .оставитьОтзыв),
            RestaurantModel(text: "О ПРИЛОЖЕНИИ", image: .акции),
        ]
        view?.reloadCollectionView()
    }
    
    func numberOfItems() -> Int {
        items.count
    }
    
    func item(at index: Int) -> RestaurantModel {
        items[index]
    }
}
