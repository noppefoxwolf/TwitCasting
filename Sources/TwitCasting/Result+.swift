//
//  Result+.swift
//  TwitCastingExample
//
//  Created by Tomoya Hirano on 2020/09/14.
//

import Foundation

extension Result {
    init(_ successValue: Success?, _ failureValue: Failure?) {
        if let failureValue = failureValue {
            self = .failure(failureValue)
        } else if let successValue = successValue {
            self = .success(successValue)
        } else {
            preconditionFailure()
        }
    }
}
