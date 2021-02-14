//
//  NoteBook+Extensions.swift
//  Mooskine
//
//  Created by Tabassum Tamanna on 2/13/21.
//  Copyright © 2021 Udacity. All rights reserved.
//

import Foundation
import CoreData

extension Notebook {
    
    public override func awakeFromInsert() {
        super.awakeFromInsert()
        creationDate = Date()
    }
}
