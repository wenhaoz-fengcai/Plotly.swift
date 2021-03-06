
/// Instantiation of a generated variable or property.
///
/// It keeps a reference to the associated Swift data type and also the Plotly schema type
/// it originates from.
class Instance: Definable {
    var name: String
    var array: Bool
    var optional: Bool = true
    var access: Access = .public
    var weak: Bool = false
    var constant: Bool = false
    var initialization: String? = "nil"

    var exclude = false

    var type: GeneratedType
    let origin: PredefinedType
    let parent: Generated.Object?

    var path: String { (parent?.path ?? "") + "." + name }

    var argument: String {
        var dataType = (type.parent?.name == self.parent?.name) ? type.name : "Shared.\(type.name)"
        dataType = self.array ? "[\(dataType)]" : dataType
        dataType = self.optional ? "\(dataType)?" : dataType
        let initialization = (self.initialization != nil) ? " = \(self.initialization!)" : ""
        return "\(name): \(dataType)\(initialization)"
    }

    var documentation: Markup {
        return Markup(parse: origin.description)
    }

    var definition: [String] {
        let weak = self.weak ? "weak " : ""
        let varlet = self.constant ? "let " : "var "
        return ["\(access)\(weak)\(varlet)\(argument)"]
    }

    /// Creates an instance of a `type` accessible under the specified `name`.
    init(of type: GeneratedType, named name: String, array: Bool = false, origin: PredefinedType? = nil) {
        self.name = Schema.name!.camelCased(name)
        self.array = array

        self.type = type
        self.origin = origin ?? type.origin
        self.parent = type.parent

        workarounds()
    }

    /// Post-processing doing some ad-hoc improvements.
    private func workarounds() {
        switch name {
        case "color":
            if type.name == "Coloring" { name = "coloring" }
        default:
            break
        }
    }

    /// Checks for share-ability by comparing the key fields to `other` instance.
    func shareable(as other: Instance) -> Bool {
        let nameEqual = self.name == other.name
        let constantEqual = self.constant == other.constant
        let optionalEqual = self.optional == other.optional
        let accessEqual = self.access == other.access
        return nameEqual && constantEqual && optionalEqual && accessEqual
    }

    /// Outputs the definition of the instance in the specified context.
    func define(as context: Context) -> [String] {
        if let definable = type as? Definable {
            return definable.define(as: .inlined) + documentation.text() + definition
        } else {
            return documentation.text() + definition
        }
    }
}


/// Formatted comment that creates a section in IDEs like XCode or VS Code.
///
/// Marks are  particularly useful for navigating around very long files.
struct Mark: Definable {
    var label: String
    var separator = true

    var documentation = Markup()
    var definition: [String] { ["", "// MARK: \(separator ? "- " : "")\(label)"] }
}
