//
//  Array-Extension.swift
//  Journal
//
//  Created by Jill Allan on 27/06/2023.
//

import Foundation

extension Array where Element: Hashable {
    func next(item: Element) -> Element? {
        if let index = self.firstIndex(where: { $0 == item }), index + 1 < self.count {
            return self[index + 1]
        }
        return nil
    }
    
    func previous(item: Element) -> Element? {
        if let index = self.firstIndex(where: { $0 == item }), index - 1 >= 0 {
            return self[index - 1]
        }
        return nil
    }
}
