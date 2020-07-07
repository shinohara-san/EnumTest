//
//  ViewController.swift
//  EnumTest2
//
//  Created by Yuki Shinohara on 2020/07/07.
//  Copyright © 2020 Yuki Shinohara. All rights reserved.
//  https://www.youtube.com/watch?v=UjdEItY2Zxc&t=584s

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    enum MyError: Error{
        case someErroraaa
    }
    
    func getData(completion: @escaping (Result<Data, Error>)->Void){
        ///Result型でsuccess/failureの二つのみ
        let task = URLSession.shared.dataTask(with: URL(string: "")!, completionHandler:  { (data, res, err) in
            guard let data = data else {
                completion(.failure(MyError.someErroraaa))
                return
            }
            completion(.success(data))
        })
        task.resume()
    }

}

