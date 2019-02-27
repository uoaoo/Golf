//
//  HomeViewController.swift
//  Golf
//
//  Created by 陈钢强 on 2019/2/27.
//  Copyright © 2019 陈钢强. All rights reserved.
//

import UIKit
import ColorMatchTabs

class HomeViewController: ColorMatchTabsViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.font = UIFont.navigationTitleFont()
        // to hide bottom button remove the following line
        popoverViewController = ExamplePopoverViewController()
        popoverViewController?.delegate = self
        
        colorMatchTabDataSource = self
        reloadData()
    }
    
}

extension HomeViewController: ColorMatchTabsViewControllerDataSource {
    
    func numberOfItems(inController controller: ColorMatchTabsViewController) -> Int {
        return TabItemsProvider.items.count
    }
    
    func tabsViewController(_ controller: ColorMatchTabsViewController, viewControllerAt index: Int) -> UIViewController {
        return StubContentViewControllersProvider.viewControllers[index]
    }
    
    func tabsViewController(_ controller: ColorMatchTabsViewController, titleAt index: Int) -> String {
        return TabItemsProvider.items[index].title
    }
    
    func tabsViewController(_ controller: ColorMatchTabsViewController, iconAt index: Int) -> UIImage {
        return TabItemsProvider.items[index].normalImage
    }
    
    func tabsViewController(_ controller: ColorMatchTabsViewController, hightlightedIconAt index: Int) -> UIImage {
        return TabItemsProvider.items[index].highlightedImage
    }
    
    func tabsViewController(_ controller: ColorMatchTabsViewController, tintColorAt index: Int) -> UIColor {
        return TabItemsProvider.items[index].tintColor
    }
    
}

extension HomeViewController: PopoverViewControllerDelegate {
    
    func popoverViewController(_ popoverViewController: PopoverViewController, didSelectItemAt index: Int) {
        selectItem(at: index)
    }
    
}
