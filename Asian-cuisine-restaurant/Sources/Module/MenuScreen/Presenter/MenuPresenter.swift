import UIKit

protocol MenuViewProtocolInput: AnyObject {
    func viewDidLoad()
    func detachView()
    func item(at index: Int) -> MenuModel
    func numberOfItems() -> Int
    func cartButtonTapped()
    func searchButtonTapped(textField: UITextField)
}

protocol MenuViewProtocolOutput: AnyObject {
    func reloadCollectionView()
}

final class MenuPresenter: MenuViewProtocolInput {
    
    weak var output: MenuViewProtocolOutput?
    private var items: [MenuModel] = []
    
    func detachView() {
        self.output = nil
    }
    
    func viewDidLoad() {
        items = [
            MenuModel(
                menu: "Летнее меню",
                image: .menu1
            ),
            MenuModel(
                menu: "Роллы",
                image: .menu2
            ),
            MenuModel(
                menu: "Сеты",
                image: .menu1
            ),
            
            MenuModel(
                menu: "Cуши",
                image: .menu2
            )
        ]
        output?.reloadCollectionView()
    }
    
    func numberOfItems() -> Int {
        items.count
    }
    
    func item(at index: Int) -> MenuModel {
        items[index]
    }
    
    func cartButtonTapped() {
        print(#function)
    }
    
    func searchButtonTapped(textField: UITextField) {
        print(#function)
        textField.isHidden = !textField.isHidden
    }
}
