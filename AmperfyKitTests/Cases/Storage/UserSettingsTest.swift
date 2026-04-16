//
//  UserSettingsTest.swift
//  AmperfyKitTests
//
//  Created by Jin Wen on 16.04.26.
//  Copyright (c) 2026 Maximilian Bauer. All rights reserved.
//
//  This program is free software: you can redistribute it and/or modify
//  it under the terms of the GNU General Public License as published by
//  the Free Software Foundation, either version 3 of the License, or
//  (at your option) any later version.
//
//  This program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU General Public License for more details.
//
//  You should have received a copy of the GNU General Public License
//  along with this program.  If not, see <http://www.gnu.org/licenses/>.
//

@testable import AmperfyKit
import XCTest

final class UserSettingsTest: XCTestCase {
  func testDefault_isMiniPlayerAlwaysOnTop_isFalse() {
    let settings = UserSettings()
    XCTAssertFalse(settings.isMiniPlayerAlwaysOnTop)
  }

  func testCodableRoundTrip_isMiniPlayerAlwaysOnTop_preservesValue() throws {
    var settings = UserSettings()
    settings.isMiniPlayerAlwaysOnTop = true

    let data = try JSONEncoder().encode(settings)
    let decoded = try JSONDecoder().decode(UserSettings.self, from: data)

    XCTAssertTrue(decoded.isMiniPlayerAlwaysOnTop)
  }
}
