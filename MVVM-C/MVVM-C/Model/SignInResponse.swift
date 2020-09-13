//
//  SignInResponse.swift
//  MVVM-C
//
//  Created by Norman, ThankaVijay on 13/09/20.
//  Copyright © 2020 Norman, ThankaVijay. All rights reserved.
//

import Foundation
import RxSwift

final class SessionService: Authentication {
    func signIn() -> Single<SignInResponse> {
        return Single<SignInResponse>.create { single in
            // call to backend
            single(.success(SignInResponse.success(token: "12345", userId: "5678")))
            return Disposables.create()
        }
    }
}
