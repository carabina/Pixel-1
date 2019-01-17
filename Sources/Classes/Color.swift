//
//  Color.swift
//  Pixel-iOS
//
//  Created by José Donor on 27/11/2018.
//


/// A color representation that is Codable when UIColor is not
public struct Color: Hashable, Codable, CustomStringConvertible, CustomPlaygroundDisplayConvertible {

	public let value: UIColor


	// MARK: - Initialize

	public init(_ value: UIColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)) {
		self.value = value
	}


	// MARK: - Encodable

	public init(from decoder: Decoder) throws {

		let value = try decoder.singleValueContainer()
		let RGBA = try value.decode(String.self)

		self.init(UIColor(RGBA: RGBA) ?? #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))

	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.singleValueContainer()
		try container.encode(value.rgbaHex)
	}


	// MARK: - Hashable

	public var hashValue: Int {
		return value.hashValue
	}

	public static func == (lhs: Color, rhs: Color) -> Bool {
		return lhs.value == rhs.value
	}


	// MARK: - Description

	public var description: String {
		return value.description
	}


	// MARK: - Playground

	public var playgroundDescription: Any {
		return value
	}

}
