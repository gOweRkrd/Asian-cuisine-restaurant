import UIKit

protocol PromoViewProtocolInput: AnyObject {
    func viewDidLoad()
    func numberOfItems() -> Int
    func detachView()
    func item(at index: Int) -> PromoModel
    func cartButtonTapped()
}

protocol PromoProtocolOutput: AnyObject {
    func reloadCollectionView()
}

final class PromoPresenter: PromoViewProtocolInput {
    
    weak var output: PromoProtocolOutput?
    private var items: [PromoModel] = []
    
    func detachView() {
        self.output = nil
    }
    
    func viewDidLoad() {
        items = [
            PromoModel(
                image: .promo1,
                date: "5 июля 2024",
                title: "ВCЕ АЛКОГОЛЬНЫЕ КОКТЕЛИ 299 р.!"
            ),
            
            PromoModel(
                image: .promo2,
                date: "12 августа 2024",
                title: "ВСЕ БОКАЛЫ ШАМПАНСКОГО 399 р.!"
            ),
            
            PromoModel(
                image: .promo3,
                date: "9 мая 2024",
                title: "КУПИ БОКАЛ ПИВА ПОЛУЧУ ЕЩЕ 1 БЕСПЛАТНО!"
            ),
            
            PromoModel(
                image: .promo4,
                date: "12 мая 2024",
                title: "ВСЯ ЗАКУСКА БЕСПЛАТНА!"
            )
        ]
        output?.reloadCollectionView()
    }
    
    func numberOfItems() -> Int {
        items.count
    }
    
    func item(at index: Int) -> PromoModel {
        items[index]
    }
    
    func cartButtonTapped() {
        print(#function)
    }
}
