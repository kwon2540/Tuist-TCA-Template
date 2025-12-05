import ProjectDescription
import ProjectDescriptionHelpers

let nameAttribute: Template.Attribute = .required("name")
let moduleAttribute: Template.Attribute = .required("module")

let template = Template(
    description: "TCA Feature Template (Creates Reducer & View)",
    attributes: [
        nameAttribute,
        moduleAttribute,
    ],
    items: [
        // 1. Reducer Logic (Core Folder)
        .file(
            path: "\(AppConfiguration.appName)/Sources/\(moduleAttribute)/Core/{{ name }}Feature.swift",
            templatePath: "Reducer.stencil"
        ),
        // 2. SwiftUI View (Views Folder)
        .file(
            path: "\(AppConfiguration.appName)/Sources/\(moduleAttribute)/Views/{{ name }}View.swift",
            templatePath: "View.stencil"
        ),
    ]
)
