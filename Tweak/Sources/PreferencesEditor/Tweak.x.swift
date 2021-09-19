import Orion
import PreferencesEditorC
import Preferences

class PSGAboutDataSourceHook: ClassHook<NSObject> {
    static var targetName: String {
        if #available(iOS 14, *) {
            return "PSGAboutDataSource"
        } else {
            return "AboutDataSource"
        }
    }
    private var preferences: [String: Any] {
        UserDefaults.standard.persistentDomain(forName: "xyz.helloyunho.preferences-editor-preferences") ?? [:]
    }
    private var tweakEnabled: Bool {
        (preferences["Enabled"] as? Bool) ?? true
    }
    
    @objc func value(forSpecifier specifier: Any) -> Any {
        if tweakEnabled, let specifier = specifier as? PSSpecifier {
            switch specifier.identifier {
            case "ProductVersion":
                if let productVersion = preferences["ProductVersion"] {
                    return productVersion
                }
                break
            case "ProductModelName":
                if let modelName = preferences["ProductModelName"] {
                    return modelName
                }
                break
            default: break
            }
        }
        
        return orig.value(forSpecifier: specifier)
    }
    
    @objc func deviceName(_ arg1: Any) -> Any {
        if tweakEnabled, let deviceName = preferences["DeviceName"] {
            return deviceName
        } else {
            return orig.deviceName(arg1)
        }
    }
}
