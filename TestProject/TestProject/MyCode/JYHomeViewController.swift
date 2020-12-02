//
//  JYDetailViewController.swift
//  TestProject
//
//  Created by JackYoung on 2020/12/2.
//  Copyright © 2020 JackYoung. All rights reserved.
//

import UIKit
import Masonry
import AFNetworking
import MJExtension

let isIphoneX = (UIScreen.main.bounds.size.width >= 375.0 && UIScreen.main.bounds.size.height >= 812.0)

class JYHomeViewController: UIViewController {
    
    let kJYDetailViewControllerCellKey = "kJYDetailViewControllerCellKey"
    
    lazy var historyButton : UIButton  = {
        let button = UIButton()
        button.frame = CGRect(x: 0, y: 0, width: 80, height: 35)
        button.backgroundColor = UIColor.red
        button.setTitle("History", for: .normal)
        button.layer.cornerRadius = 15
        button.clipsToBounds = true
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        button.addTarget(self, action: #selector(historyButtonTouched), for: .touchUpInside)
        return button
    }()
    
    lazy var contentTextView : UITextView  = {
        let textView = UITextView()
        textView.backgroundColor = UIColor.white
        textView.font = UIFont.systemFont(ofSize: 12)
        return textView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.navigationItem.title = "TestProject"
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 80, height: 40))
        view.addSubview(self.historyButton)
            
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: view)
        
        Timer.scheduledTimer(withTimeInterval: 5.0, repeats: true) { (timer) in
            //get remote data
            self.getRemoteData()
        }
        
        self.view.addSubview(self.contentTextView)
        self.contentTextView.mas_remakeConstraints { (make) in
            make?.left.equalTo()(20)
            make?.right.equalTo()(-20)
            make?.bottom.equalTo()(self.view.mas_bottom)?.offset()(-20)
            make?.top.equalTo()(self.view.mas_top)?.offset()(isIphoneX ? 88 : 64)
        }
        
        //if has history,show the last one
        let modelsArray = self.getModelArray()
        if modelsArray.count > 0 {
            let model = modelsArray.last
            self.contentTextView.text = model?.content
        }
    }
    
    @objc func historyButtonTouched() {
        let historyViewController = JYHistoryViewController()
        historyViewController.historyArray = self.getModelArray()
        self.navigationController?.pushViewController(historyViewController, animated: true)
    }

    func getRemoteData() {
        let baseUrl = "https://api.github.com/"
        let manager = AFHTTPSessionManager.init()
        
        manager.get(baseUrl, parameters: nil, progress: { (progress) in
            
        }, success: { [weak self](task, responseData) in
            if let weakSelf = self {
                let dic : [String:String] = responseData as? [String:String] ?? [String:String]()
                var resultString = ""
                for key in dic.keys {
                    resultString = "\(resultString)\(key) = \(dic[key] ?? "")\n"
                }
                weakSelf.contentTextView.text = resultString
                
                //store web data
                let appDelegate = UIApplication.shared.delegate as! AppDelegate
                let context = appDelegate.persistentContainer.viewContext
                 
                let model = NSEntityDescription.insertNewObject(forEntityName: "JYModel",into: context) as! JYModel

                let timeFormatter = DateFormatter()
                timeFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss.SSS"
                let resultTime = timeFormatter.string(from: Date()) as String
                
                model.time = resultTime
                model.content = resultString
                do {
                    try context.save()
                    print("save sucessful")
                } catch {
                    fatalError("save failed：\(error)")
                }
            }
            
        }) { (task, responseData) in
            let alert = UIAlertController(title: "Error", message: "Something wrong with Net", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { (action) in
                
            }))
            
            self.present(alert, animated: true) {
            }
        }
    }
    
    func getModelArray() -> [JYModel] {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext

        let fetchRequest = NSFetchRequest<JYModel>(entityName:"JYModel")
        fetchRequest.fetchLimit = 10000 //amount to get
        fetchRequest.fetchOffset = 0
        
        //set predicate
        fetchRequest.predicate = nil
        
        //quiry the data
        var fetchedObjects = [JYModel]()
        do {
            fetchedObjects = try context.fetch(fetchRequest)
        }
        catch {
            fatalError("failed：\(error)")
        }
        return fetchedObjects
    }
}
