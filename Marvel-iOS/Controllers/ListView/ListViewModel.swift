//
//  ListViewModel.swift
//  Marvel-iOS
//
//  Created by user on 06/07/25.
//

import Foundation

internal protocol ListViewModelProtocol {
    
    internal var characters: [Character] { get }
}

internal class ListViewModel: ListViewModelProtocol {
    
    internal var characters: [Character]
    
    internal init(characters: [Character]) {
        self.characters = characters
    }
    
}
