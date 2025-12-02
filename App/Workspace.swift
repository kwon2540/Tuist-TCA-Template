import ProjectDescription
import ProjectDescriptionHelpers

let workspace = Workspace(
    name: AppConfiguration.appName + "Workspace",
    projects: [
        "Projects/Development",
        "Projects/Production"
    ]
)