import PackageDescription

let package = Package(
    name: "S4HeaderExtensions",
    dependencies: [
		.Package(url: "https://github.com/SwiftX/S4.git", majorVersion: 0, minor: 3)
	]
)
