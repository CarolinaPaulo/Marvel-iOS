//
//  ListViewModel.swift
//  Marvel-iOS
//
//  Created by user on 06/07/25.
//

import Foundation

internal protocol ListViewModelProtocol {
    
    var characters: [Character] { get }
}

internal class ListViewModel: ListViewModelProtocol {
    
    var characters: [Character]
    
    init(characters: [Character]) {
        self.characters = characters
    }
    
}
