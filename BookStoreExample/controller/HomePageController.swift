//
//  HomePageController.swift
//  BookStoreExample
//
//  Created by Monali Das on 07/11/20.
//  Copyright © 2020 Monali Das. All rights reserved.
//

import UIKit

class HomePageController: UIViewController {

    
    @IBOutlet weak var searcBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var bookListing : BooksModel?
    var searchTimer: Timer!
    var searchtext = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searcBar.delegate = self
        searcBar.tintColor = .white
        setUpTableView()
       
        
        
    }
    
    fileprivate func setUpTableView() {
        tableView.backgroundColor = .black
        view.backgroundColor = .black
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "BooklLstingCell", bundle: nil), forCellReuseIdentifier: "BooklLstingCell")
       
    }
    
    
    

}
//MARK:- Tableview deleagte and datasource
typealias tableViewProtocols = UITableViewDelegate & UITableViewDataSource
extension HomePageController : tableViewProtocols {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "BooklLstingCell") as! BooklLstingCell
          cell.backgroundColor = UIColor.black
          cell.featureSectionCollectionView.delegate = self
          cell.featureSectionCollectionView.dataSource = self
          cell.featureSectionCollectionView.backgroundColor = UIColor.clear
          if let layout = cell.featureSectionCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
                layout.scrollDirection = .horizontal
         }
         cell.featureSectionCollectionView.tag = indexPath.section
         cell.featureSectionCollectionView.register(UINib(nibName: "EachBookItemCell", bundle: nil), forCellWithReuseIdentifier: "EachBookItemCell")
          cell.featureSectionCollectionView.reloadData()
         return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
         return 350
    }
    
}

//MARK:- Collectionview deleagte and datasource
typealias collectionViewProtocols = UICollectionViewDelegate & UICollectionViewDataSource & UICollectionViewDelegateFlowLayout
extension HomePageController : collectionViewProtocols {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "EachBookItemCell", for: indexPath) as! EachBookItemCell
        cell.titleOfBook.text = self.bookListing?.items[indexPath.row].volumeInfo?.title
        cell.subtitleOfBook.text = self.bookListing?.items[indexPath.row].volumeInfo?.subtitle
        cell.imageOfBook.backgroundColor = .red
        cell.priceButton.setTitle("$124", for: .normal)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return  CGSize(width: (UIScreen.main.bounds.size.width / 2) - 10 , height: UIScreen.main.bounds.size.width / 2 + 40)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {

        return UIEdgeInsets(top: 10, left: 5, bottom: 0, right: 5)
    }
}

extension HomePageController : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if (self.searchTimer != nil) {
            self.searchTimer.invalidate()
            self.searchTimer = nil;
        }
        searchtext = searchText
        self.searchTimer = Timer.scheduledTimer(timeInterval: 1.2, target: self, selector: #selector(self.startSearch), userInfo: nil, repeats: false)
        self.searcBar.resignFirstResponder()
    }
    
    @objc func startSearch(){
        let netWorkUrl = "https://www.googleapis.com/books/v1/volumes" + "?q=\(searchtext)"
        NetworkingCall.shared.getHomePageSearchData(url: netWorkUrl) { result in
            switch result {

            case .success(let bookDetails):
                DispatchQueue.main.async {
                    self.bookListing = bookDetails
                    self.tableView.reloadData()
                }
                break

            case .failure(let error):
                print(error)
                break

            }
        }
    }
}
