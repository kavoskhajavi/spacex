//
//  Observable.swift
//  SpaceX
//
//  Created by david on 9/5/23.
//  Copyright © 2023 kavoskhajavi. All rights reserved.
//

import Foundation

class Observable<T> {
    
    var value:T?{
        didSet{
            DispatchQueue.main.async {
                self.listener?(self.value)
            }
        }
    }
    
    init(_ value:T?) {
        self.value = value
    }
    
    private var listener:((T?)->Void)?
    
    func bind(_ listener:@escaping((T?)->Void)) {
        listener(value)
        self.listener = listener
    }
    
    
}
