import UIKit

protocol FeedBackViewProtocolInput: AnyObject {
    func viewDidLoad()
    func numberOfItems() -> Int
    func detachView()
    func item(at index: Int) -> FeedBackModel
}

protocol FeedBackProtocolOutput: AnyObject {
    func reloadCollectionView()
    func cartButtonTapped()
    func restaurantButtonTapped()
    func deliviryButtonTapped()
    func plusButtonTapped()
    func sendButtonTapped()
    func updateCellVisibility(in collectionView: UICollectionView)
}

final class FeedBackPresenter: FeedBackViewProtocolInput {
    
    weak var output: FeedBackProtocolOutput?
    private var items: [FeedBackModel] = []
    
    func detachView() {
        self.output = nil
    }
    
    func viewDidLoad() {
        items = [
            FeedBackModel(image: .restaurantsView1),
            FeedBackModel(image: .restaurantsView2),
            FeedBackModel(image: .restaurantsView3)
            
        ]
        output?.reloadCollectionView()
    }
    
    func numberOfItems() -> Int {
        items.count
    }
    
    func item(at index: Int) -> FeedBackModel {
        items[index]
    }
    
    func updateCellVisibility(in collectionView: UICollectionView) {
        let visibleIndexes = collectionView.indexPathsForVisibleItems
        
        for indexPath in visibleIndexes {
            guard let cell = collectionView.cellForItem(at: indexPath) as? FeedBackViewCell else {
                continue
            }
            
            let cellFrame = collectionView.layoutAttributesForItem(at: indexPath)?.frame ?? CGRect.zero
            
            if !collectionView.bounds.contains(cellFrame) {
                cell.contentView.alpha = 0.5
            } else {
                cell.contentView.alpha = 1.0
            }
        }
    }
    
    func cartButtonTapped() {
        print(#function)
    }
    
    func restaurantButtonTapped() {
        print(#function)
    }
    
    func deliviryButtonTapped() {
        print(#function)
    }
    
    func plusButtonTapped() {
        print(#function)
    }
    
    func sendButtonTapped() {
        print(#function)
    }
}
