//
//  ViewController.swift
//  Today
//
//  Created by Konrad Cureau on 29/03/2022.
//

import UIKit

class ReminderListViewController: UICollectionViewController {
    var dataSource: DataSource!
    var reminders: [Reminder] = Reminder.sampleData
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create a new list layout.
        let listLayout = listLayout()
        // Assign the list layout to the collection view layout.
        collectionView.collectionViewLayout = listLayout
        
        
        let cellRegistration = UICollectionView.CellRegistration(handler: cellRegistrationHandler)
        
        // Create a new data source.
        dataSource = DataSource(collectionView: collectionView) { (collectionView: UICollectionView, indexPath: IndexPath, itemIdentifier: Reminder.ID) in
            // Dequeue and return a cell using the cell registration.
            return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: itemIdentifier)
        }
        
        updateSnapshot()
        
        // Assign the data source to the collection view.
        collectionView.dataSource = dataSource
        
    }
    
    private func listLayout() -> UICollectionViewCompositionalLayout {
        // UICollectionLayoutListConfiguration creates a section in a list layout.
        var listConfiguration = UICollectionLayoutListConfiguration(appearance: .grouped)
        // Disable separators, and change the background color to clear.
        listConfiguration.showsSeparators = false
        listConfiguration.backgroundColor = .clear
        // Return a new compositional layout with the list configuration.
        return UICollectionViewCompositionalLayout.list(using: listConfiguration)
    }
    
}

