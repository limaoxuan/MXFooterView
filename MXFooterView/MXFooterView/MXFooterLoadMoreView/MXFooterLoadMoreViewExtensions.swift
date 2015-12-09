//
//  MXFooterLoadMoreViewExtensions.swift
//  oa
//
//  Created by 李茂轩 on 15/12/8.
//  Copyright © 2015年 Max. All rights reserved.
//

import UIKit


let mxFooterHeight :CGFloat = 50

public extension UITableView {

    
    private struct mx_associatedKeys {
        static var mxFooterLoadMoreView = "mxFooterLoadMoreView"
    }
    
    private var _mxFooterLoadMoreView: MXFooterLoadMoreView? {
        get {
            if let mxFooterLoadMoreView = objc_getAssociatedObject(self, &mx_associatedKeys.mxFooterLoadMoreView) as? MXFooterLoadMoreView {
                return mxFooterLoadMoreView
            }
            
            return nil
        }
        set {
            objc_setAssociatedObject(self, &mx_associatedKeys.mxFooterLoadMoreView, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    
    private var mxFooterLoadMoreView: MXFooterLoadMoreView! {
        get {
            if let mxFooterLoadMoreView = _mxFooterLoadMoreView {
                
                return mxFooterLoadMoreView
            } else {
                
                var mxFooterLoadMoreView : MXFooterLoadMoreView!
                let nib = NSBundle.mainBundle().loadNibNamed("MXFooterLoadMoreView", owner: self, options: nil)
                
                
                for i in nib {
                    
                    
                    if i.isKindOfClass(MXFooterLoadMoreView) {
                        
                        
                        mxFooterLoadMoreView = i as! MXFooterLoadMoreView
                        break
                        
                    }
                    
                }

                _mxFooterLoadMoreView = mxFooterLoadMoreView
                return mxFooterLoadMoreView
            }
        }
    }

    
    public func mx_startAnimation(text:String,actionHandler: () -> Void){
    
        
        if mxFooterLoadMoreView.isLoading == false  && !mxFooterLoadMoreView.isFinished {
    
        
        mxFooterLoadMoreView.isLoading = true
        mxFooterLoadMoreView.myActivity.alpha = 1
        mxFooterLoadMoreView.showTitleLabel.alpha = 1
            mxFooterLoadMoreView.showTitleLabel.text = text
        mxFooterLoadMoreView.myActivity.startAnimating()
            
            actionHandler()
            
    
        }else if mxFooterLoadMoreView.isFinished {
        

//            if mxFooterLoadMoreView.isLoading == false {

                mxFooterLoadMoreView.showTitleLabel.alpha = 1
                mxFooterLoadMoreView.showTitleLabel.text = "no more data"
                mxFooterLoadMoreView.myActivity.stopAnimating()

            
//            UIView.animateWithDuration(3, animations: { () -> Void in
//                self.mxFooterLoadMoreView.isLoading = true

//                self.mxFooterLoadMoreView.showTitleLabel.alpha = 0
//                }, completion: { (Bool) -> Void in
//                    self.mxFooterLoadMoreView.isLoading = false
//            })
                
//            }r
        
        
        }
    
    }
    
    
    
    public func mx_finished(){
    
        mxFooterLoadMoreView.isFinished = true
        mxFooterLoadMoreView.isLoading = false
        
    
    }

    
  public  func mx_stopAnimation(text:String){
    
    if mxFooterLoadMoreView.isLoading == true {
        
        
        mxFooterLoadMoreView.myActivity.alpha = 0
        mxFooterLoadMoreView.showTitleLabel.alpha = 0
        mxFooterLoadMoreView.showTitleLabel.text = text
        mxFooterLoadMoreView.myActivity.stopAnimating()
        
        
        

        UIView.animateWithDuration(0.3, animations: { () -> Void in
            
            }, completion: { (object) -> Void in
                self.mxFooterLoadMoreView.isLoading = false

        })
        
    }
    
    }

    
    
  public   func mx_addFooterLoadMoreView(){
    
    
    
            mxFooterLoadMoreView.frame = CGRectMake(0, 0, UIScreen.mainScreen().bounds.size.width, mxFooterHeight)
            tableFooterView = mxFooterLoadMoreView
    
    
        
    
    
    
    }

    
    
    
//    public func dg_addPullToRefreshWithActionHandler(actionHandler: () -> Void, loadingView: DGElasticPullToRefreshLoadingView?) {
//        multipleTouchEnabled = false
//        panGestureRecognizer.maximumNumberOfTouches = 1
//        
//        pullToRefreshView.actionHandler = actionHandler
//        pullToRefreshView.loadingView = loadingView
//        addSubview(pullToRefreshView)
//        
//        pullToRefreshView.observing = true
//    }

}