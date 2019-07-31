//
//  ViewController.swift
//  wdyBannerScrollViewSwift
//
//  Created by Macmini on 2019/7/31.
//  Copyright © 2019 Macmini. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //MARK: ========== 全局变量 ==========
    var leftImageView: UIImageView!
    var centerImageView: UIImageView!
    var rightImageView: UIImageView!
    
    //MARK: ========== viewDidLoad ==========
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.viewModel.imagesArr.insert(self.viewModel.imagesArr.object(at: self.viewModel.imagesArr.count - 1), at: 0)
        self.viewModel.imagesArr.removeObject(at: self.viewModel.imagesArr.count - 1)
        print(viewModel.imagesArr)
        
        self.view.addSubview(self.scrollView)
        
        for i in 0..<3 {
            let imageX = CGFloat(i)
            let imageView = UIImageView.init(frame: CGRect.init(x: imageX*self.scrollView.frame.width, y: 0, width: self.scrollView.frame.width, height: self.scrollView.frame.height))
            imageView.image = UIImage.init(named: self.viewModel.imagesArr.object(at: i) as! String)
            self.scrollView.addSubview(imageView)

            switch i {
            case 0:
                self.leftImageView = imageView
            case 1:
                self.centerImageView = imageView
            case 2:
                self.rightImageView = imageView
            default:
                print(i)
            }
            
        }
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //MARK: ========== 懒加载 ==========
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView.init(frame: CGRect(x: 0, y: kNavigationBarHeight, width: kScreenWidth, height: kFitHeight(y: 200)))
        scrollView.contentSize = CGSize(width: kScreenWidth*3, height: 0)
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.delegate = self
        scrollView.contentOffset = CGPoint.init(x: kScreenWidth, y: 0)
        return scrollView
    }()
    
    lazy var viewModel: ViewModel = {
        let viewModel = ViewModel.init()
        return viewModel
    }()
    
    
    
}

//MARK: ========== UIScrollViewDelegate ==========
extension ViewController: UIScrollViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.x/kScreenWidth == 2 {
            self.viewModel.imagesArr.insert(self.viewModel.imagesArr.object(at: 0), at: self.viewModel.imagesArr.count - 1)
            self.viewModel.imagesArr.removeObject(at: 0)
        }
        if scrollView.contentOffset.x/kScreenWidth == 0 {
            self.viewModel.imagesArr.insert(self.viewModel.imagesArr.object(at: self.viewModel.imagesArr.count - 1), at: 0)
            self.viewModel.imagesArr.removeObject(at: self.viewModel.imagesArr.count - 1)
        }
        self.leftImageView.image = UIImage.init(named: self.viewModel.imagesArr.object(at: 0) as! String)
        self.centerImageView.image = UIImage.init(named: self.viewModel.imagesArr.object(at: 1) as! String)
        self.rightImageView.image = UIImage.init(named: self.viewModel.imagesArr.object(at: 2) as! String)
        scrollView.setContentOffset(CGPoint.init(x: kScreenWidth, y: 0), animated: false)
    }
}

