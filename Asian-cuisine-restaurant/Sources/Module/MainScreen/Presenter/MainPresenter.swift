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
            MainModel(text: "МЕНЮ", image: .меню),
            MainModel(text: "АКЦИИ", image: .акции),
            MainModel(text: "РЕСТОРАНЫ", image: .рестораны),
            MainModel(text: "ДОСТАВКА", image: .доставка),
            MainModel(text: "ОСТАВИТЬ ОТЗЫВ", image: .оставитьОтзыв),
            MainModel(text: "О ПРИЛОЖЕНИИ", image: .оПриложении),
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
