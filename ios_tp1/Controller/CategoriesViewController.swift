//
//  CollectionViewController.swift
//  ios_tp1
//
//  Created by  on 10/03/2020.
//  Copyright © 2020 dordoloy. All rights reserved.
//

import UIKit

class CategoriesViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var categoriesCollectionView: UICollectionView!
    let cellID:String = "CategoriesCollectionViewCellID"
    let segueCategoryIdentifier = "categoryToList"
    
    var categories: [Category] = []
    
    private let itemsPerRow: CGFloat = 2
    private let sectionInsets = UIEdgeInsets(top: 50.0, left: 20.0, bottom: 50.0, right: 20.0)
    
    var id: Int = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.categoriesCollectionView.dataSource = self
        self.categoriesCollectionView.delegate = self
        
        let nib = UINib(nibName: "CategoryViewCell", bundle: nil)
        categoriesCollectionView.register(nib, forCellWithReuseIdentifier: cellID)
        
        let categoriesRepository = MovieService()
        categoriesRepository.getMovieCategories(id: id, completionHandler: { response in
            if (response?.genres) != nil {
                DispatchQueue.main.async() {
                    self.categories = response!.genres
                    self.categoriesCollectionView.reloadData()
                }
            }
        })

    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! CategoryViewCell
        return cell.loadComponent(cat: categories[indexPath.item])
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: segueCategoryIdentifier, sender: categories[indexPath.item])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueCategoryIdentifier {
            let viewController = segue.destination as! ListViewController
            viewController.currentCatagory = sender as! Category
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        cell.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        UIView.animate(withDuration: 0.4) {
            cell.transform = CGAffineTransform.identity
        }
    }
    
    
    

}
extension CategoriesViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
      let widthPerItem = (view.frame.width - sectionInsets.left * (itemsPerRow + 1)) / itemsPerRow

      return CGSize(width: widthPerItem, height: widthPerItem)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
         return sectionInsets
       }
   func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
     return sectionInsets.left
   }
}
