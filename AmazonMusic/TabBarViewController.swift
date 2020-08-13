//
//  TabBarViewController.swift
//  AmazonMusic
//
//  Created by Monali's Mac on 12/08/20.
//  Copyright © 2020 Monali's Mac. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tabBar.barTintColor = UIColor.black
        self.view.backgroundColor = UIColor.black
        self.tabBar.isTranslucent = false
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
