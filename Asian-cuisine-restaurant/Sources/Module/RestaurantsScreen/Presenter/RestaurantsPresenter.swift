import UIKit

protocol RestaurantsViewProtocolInput: AnyObject {
    func viewDidLoad()
    func numberOfItems() -> Int
    func detachView()
    func item(at index: Int) -> RestaurantsModel
    func cartButtonTapped()
}

protocol RestaurantsProtocolOutput: AnyObject {
    func reloadCollectionView()
}

final class RestaurantsPresenter: RestaurantsViewProtocolInput {
    
    weak var output: FeedBackProtocolOutput?
    private var items: [RestaurantsModel] = []
    
    func detachView() {
        self.output = nil
    }
    
    func viewDidLoad() {
        items = [
            RestaurantsModel(
                nameRestaurants: "Водный стадион: Нияма и Пицца-Пи",
                address: "Головинсое шоссе, 5, к 1",
                photoRestaurants: .restaurantsView1
            ),
            RestaurantsModel(
                nameRestaurants: "Мытищи: Нияма и Пицца-Пи",
                address: "Шараповский пр-д, 2, ТРЦ «Крсный кит», 3-й этаж",
                photoRestaurants: .restaurantsView2
            ),
            RestaurantsModel(
                nameRestaurants: "Адмирала Ушакова:: Нияма и Пицца-Пи",
                address: "Адмирала Лазарева, 2, ТЦ «Виктория», 3-й этаж",
                photoRestaurants: .restaurantsView3
            ),
            
            RestaurantsModel(
                nameRestaurants: "ул. Ленина:: Нияма и Пиф-паф",
                address: "ул.Ленина, 2, ТЦ «Виктория», 3-й этаж",
                photoRestaurants: .restaurantsView4
            )
        ]
        output?.reloadCollectionView()
    }
    
    func numberOfItems() -> Int {
        items.count
    }
    
    func item(at index: Int) -> RestaurantsModel {
        items[index]
    }
    
    func cartButtonTapped() {
        print(#function)
    }
    
    func forMapsButtonTapped() {
        print(#function)
    }
    
    func allButtonTapped() {
        print(#function)
    }
}
