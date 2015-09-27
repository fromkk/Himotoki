//
//  RawRepresentable.swift
//  Himotoki
//
//  Created by Syo Ikeda on 9/27/15.
//  Copyright © 2015 Syo Ikeda. All rights reserved.
//

public extension Decodable where Self.DecodedType == Self, Self: RawRepresentable, Self.RawValue: Decodable, Self.RawValue.DecodedType == Self.RawValue {
    static func decode(e: Extractor) throws -> Self {
        let rawValue = try RawValue.decode(e)

        guard let value = self.init(rawValue: rawValue) else {
            throw DecodeError.TypeMismatch(expected: ".Some(\(Self.self))", actual: ".None)", keyPath: nil)
        }

        return value
    }
}
