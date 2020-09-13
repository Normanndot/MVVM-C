//
//  Authentication.swift
//  MVVM-C
//
//  Created by Norman, ThankaVijay on 13/09/20.
//  Copyright © 2020 Norman, ThankaVijay. All rights reserved.
//

import Foundation
import RxSwift

protocol Authentication {
    func signIn() -> Single<SignInResponse>
}
