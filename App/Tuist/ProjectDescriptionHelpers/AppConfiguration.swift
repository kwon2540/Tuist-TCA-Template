import ProjectDescription

public enum AppConfiguration {
    /// 앱 이름
    public static let appName = "MyApp"
    
    /// 번들 ID Prefix
    public static let organizationName = "com.ktee"
    
    /// 공통 타겟 버전
    public static let deploymentTarget: DeploymentTargets = .iOS("18.0")

    /// 지원 기기
    public static let destinations: Destinations = [.iPhone]
}
