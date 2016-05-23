//
//  RansackVerbs.swift
//  Solidus-Swift-SDK
//
//  Created by Francisco Flores on 5/16/16.
//  Copyright © 2016 Magmalabs. All rights reserved.
//

import Foundation

enum RansackVerbs : String {
    case Equal = "_eq"
    case Matches = "_matches"
    case LessThan = "_lt"
    case LessThanOrEqual = "_lteq"
    case In = "_in"
    case Contains = "_cont"
    case ContainsAny = "_cont_any"
    case ContainsAll = "_cont_all"
    case Start = "_start"
    case End = "_end"
    case True = "_true"
    case False = "_false"
    case Present = "_present"
    case Null = "_null"
    case SortAsc = "_asc"
    case SortDesc = "_desc"
}