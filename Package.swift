import PackageDescription

let package = Package(
    name: "S4HeaderExtensions",
    dependencies: [
		.Package(url: "https://github.com/open-swift/S4.git", majorVersion: 0, minor: 6),
		.Package(url: "https://github.com/Zewo/MediaType.git", majorVersion: 0, minor: 6)
	]
)
