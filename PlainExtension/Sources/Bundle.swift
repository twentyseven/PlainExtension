//
//  Bundle.swift
//  PlainExtension
//
//  Created by Trong Bui Tuan on 2/3/20.
//
//

public extension Bundle {
    var releaseVersionNumber: String {
        guard let v = infoDictionary?["CFBundleShortVersionString"] as? String else { return "N/A" }
        return v
    }

    var buildVersionNumber: String {
        guard let v = infoDictionary?["CFBundleVersion"] as? String else { return "N/A" }
        return v
    }
}
