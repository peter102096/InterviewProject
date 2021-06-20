//
//  SecondViewController.swift
//  InterviewProject
//
//  Created by Peter on 2021/6/21.
//

import UIKit

class SecondViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var titleTop: NSLayoutConstraint!
    
    @IBOutlet weak var mScrollView: UIScrollView!
    
    var barImageView: UIView? = nil
    let minAlphaOffset:CGFloat = 64.0
    let maxAlphaOffset:CGFloat = 200.0
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setCustomNavigationBar(.white)
        print(customNavigationBar?.items)
        
        let mNavigationItem = UINavigationItem()
        let lbtn = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: nil, action: #selector(back))
        mNavigationItem.setLeftBarButton(lbtn, animated: true)
        let titleView = UILabel()
        titleView.text = "PeterLin"
        titleView.textColor = .black
        mNavigationItem.titleView = titleView
        customNavigationBar?.items = [mNavigationItem]

        titleTop.constant = UIApplication.shared.statusBarFrame.height * 3
        print(customNavigationBar?.items)
    }
    
    override func viewDidAppear(_ animated: Bool) {

        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.restoreNavigationBar()
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let statusBarHeight = UIApplication.shared.statusBarFrame.height
        // 最大偏移量
        let maxAlphaOffset = CGFloat(200)
        // 最小偏移量
        let minAlphaOffset = CGFloat(0)

        let offset = scrollView.contentOffset.y + statusBarHeight
        
        // 照比例算alpha，值需在0~1
        let a = max(min((offset - minAlphaOffset) / (maxAlphaOffset - minAlphaOffset), 1), 0)
        setCustomNavigationBarColor(alpha: a)
        customNavigationBar!.tintColor = UIColor(red: 1 - a, green: 1 - a, blue: 1 - a, alpha: 1)
        customNavigationBar!.items!.first!.titleView!.alpha = a
    }
    

    @objc func back() {
        pop(toRoot: false)
    }

}
