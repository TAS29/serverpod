import 'package:serverpod_cli/src/generator/open_api/helpers/utils.dart';

/// Specifies details regarding the server hosting an API.
/// example
/// ```dart
///   {
///   "url": "https://development.gigantic-server.com/v1",
///   "description": "Development server"
///   }
/// ```
class OpenAPIServer {
  /// A URL to the target host.
  final Uri url;

  /// An optional string describing the host designated by the URL.
  final String? description;

  /// A map between a variable name and its value.
  /// The value is used for substitution in the server's URL template.
  final Map<String, OpenAPIServerVariable>? variables;
  OpenAPIServer({
    required this.url,
    this.description,
    this.variables,
  });

  Map<String, dynamic> toJson() {
    var map = {
      OpenAPIJsonKey.url.name: url.toString(),
    };
    var theDescription = description;
    if (theDescription != null) {
      map[OpenAPIJsonKey.description.name] = theDescription;
    }
    return map;
  }
}

/// An object representing a Server Variable for server URL template
/// substitution.
class OpenAPIServerVariable {
  /// An enumeration of string values to be used if the substitution options
  /// are from a limited set.
  final List<String> enumField;

  /// The default value to use for substitution, which SHALL be sent if an
  /// alternate value is not supplied.
  /// Note this behavior is different than the Schema Object's treatment of
  /// default values, because in those cases parameter values are optional.
  /// If the enum is defined, the value must exist in the enum's values.
  /// key - [default]
  final String defaultField;

  /// An optional description for the server variable. CommonMark syntax
  /// may be used for rich text representation.
  final String? description;
  OpenAPIServerVariable({
    this.enumField = const [],
    required this.defaultField,
    this.description,
  });

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{
      'default': defaultField,
    };

    if (enumField.isNotEmpty) {
      map['enum'] = enumField;
    }
    var theDescription = description;
    if (theDescription != null) {
      map[OpenAPIJsonKey.description.name] = theDescription;
    }
    return map;
  }
}