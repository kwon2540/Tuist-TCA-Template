import ProjectDescription

let nameAttribute: Template.Attribute = .required("name")

let template = Template(
    description: "TCA Feature Module Template (Core/View Separation Structure)",
    attributes: [
        nameAttribute,
    ],
    items: [
        // 1. Reducer Logic (Core Folder)
        .file(
            path: "MyApp/Sources/\(nameAttribute)/Core/{{ name }}Reducer.swift",
            templatePath: "Reducer.stencil"
        ),
        // 2. SwiftUI View (Views Folder)
        .file(
            path: "MyApp/Sources/\(nameAttribute)/Views/{{ name }}View.swift",
            templatePath: "View.stencil"
        ),
    ]
)
