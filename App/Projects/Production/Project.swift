import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: "Production",
    packages: [
        // Relative path: Production -> Projects(..) -> App(..) -> Package
        .local(path: "../../\(AppConfiguration.appName)")
    ],
    targets: [
        .target(
            name: "Production",
            destinations: AppConfiguration.destinations,
            product: .app,
            productName: "\(AppConfiguration.appName)", 
            bundleId: "\(AppConfiguration.organizationName).\(AppConfiguration.appName.lowercased())",
            deploymentTargets: AppConfiguration.deploymentTarget,
            // Relative path: Production -> Projects(..) -> Shared -> Info.plist
            infoPlist: .file(path: "../Shared/Info.plist"),
            sources: [
                "Production/**"
            ],
            resources: [
                "Production/Assets.xcassets",
                // Relative path: Production -> Projects(..) -> Shared -> Launch Screen.storyboard
                "../Shared/Launch Screen.storyboard"
            ],
            dependencies: [
                .package(product: "EntryKit", type: .runtime)
            ],
            settings: .settings(
                configurations: [
                    .debug(name: "Debug", xcconfig: "Production.xcconfig"),
                    .release(name: "Release", xcconfig: "Production.xcconfig")
                ]
            )
        )
    ]
)