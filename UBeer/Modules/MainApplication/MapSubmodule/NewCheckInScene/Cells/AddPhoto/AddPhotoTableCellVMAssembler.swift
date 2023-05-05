//
//  AddPhotoTableCellVMAssembler.swift
//  UBeer
//
//  Created by Lobster on 26.04.23.
//

import Foundation

final class AddPhotoTableCellVMAssembler {
    
    private init() { }

    static func makeViewModel() -> AddPhotoTableCellVMProtocol {
        return AddPhotoTableCellVM()
    }

}
