import Foundation

protocol FeedBackViewProtocolInput: AnyObject {
    func viewDidLoad()
}

protocol FeedBackProtocolOutput: AnyObject {
    func cartButtonTapped()
    func restaurantButtonTapped()
    func deliviryButtonTapped()
}

final class FeedBackPresenter: FeedBackViewProtocolInput {
    
    weak var output: FeedBackProtocolOutput?
    
    func viewDidLoad() {}
    
    func cartButtonTapped() {
        print(#function)
    }
    
    func restaurantButtonTapped() {
        print(#function)
    }
    
    func deliviryButtonTapped() {
        print(#function)
    }
}
