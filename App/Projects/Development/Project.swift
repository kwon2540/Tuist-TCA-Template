import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: "Development",
    packages: [
        // Relative path: Development -> Projects(..) -> App(..) -> Package
        .local(path: "../../\(AppConfiguration.appName)")
    ],
    targets: [
        .target(
            name: "Development",
            destinations: AppConfiguration.destinations,
            product: .app,
            productName: "\(AppConfiguration.appName)_Dev", 
            bundleId: "\(AppConfiguration.organizationName).\(AppConfiguration.appName.lowercased()).dev",
            deploymentTargets: AppConfiguration.deploymentTarget,
            // Relative path: Development -> Projects(..) -> Shared -> Info.plist
            infoPlist: .file(path: "../Shared/Info.plist"),
            sources: [
                "Development/**"
            ],
            resources: [
                "Development/Assets.xcassets",
                // Relative path: Development -> Projects(..) -> Shared -> Launch Screen.storyboard
                "../Shared/Launch Screen.storyboard"
            ],
            dependencies: [
                .package(product: "EntryKit", type: .runtime)
            ],
            settings: .settings(
                configurations: [
                    .debug(name: "Debug", xcconfig: "Development.xcconfig"),
                    .release(name: "Release", xcconfig: "Development.xcconfig")
                ]
            )
        )
    ]
)