import 'package:serverpod_cli/src/generator/open_api/helpers/utils.dart';
import 'package:serverpod_cli/src/generator/open_api/objects/info.dart';

/// [OpenAPITag] are used to categorize and group API operations. It must be
/// unique. example
/// ```
/// {
///  "name": "pet",
///  "description": "Pets operations"
/// }
/// ```
///
class OpenAPITag {
  /// The name of the tag.
  final String name;

  /// A description for the tag.
  /// CommonMark syntax MAY be used for rich text representation.
  final String? description;

  /// Additional external documentation for this tag.
  final OpenAPIExternalDocumentation? externalDocumentationObject;
  OpenAPITag({
    required this.name,
    this.description,
    this.externalDocumentationObject,
  });

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{
      OpenAPIJsonKey.name.name: name,
    };
    if (description != null) {
      map[OpenAPIJsonKey.description.name] = description!;
    }
    if (externalDocumentationObject != null) {
      map[OpenAPIJsonKey.externalDocs.name] =
          externalDocumentationObject!.toJson();
    }
    return map;
  }

  @override
  bool operator ==(covariant OpenAPITag other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.description == description &&
        other.externalDocumentationObject == externalDocumentationObject;
  }

  @override
  int get hashCode =>
      name.hashCode ^
      description.hashCode ^
      externalDocumentationObject.hashCode;
}
