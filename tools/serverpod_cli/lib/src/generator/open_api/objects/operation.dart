import 'package:serverpod_cli/src/generator/open_api/objects/info.dart';
import 'package:serverpod_cli/src/generator/open_api/objects/parameter.dart';
import 'package:serverpod_cli/src/generator/open_api/objects/request.dart';
import 'package:serverpod_cli/src/generator/open_api/objects/response.dart';
import 'package:serverpod_cli/src/generator/open_api/objects/security.dart';
import 'package:serverpod_cli/src/generator/open_api/objects/server.dart';

/// Describes a single API operation on a path.
class OperationObject {
  /// A list of tags for API documentation control. Tags can be used for
  /// logical grouping of operations by resources or any other qualifier.
  final List<String>? tags;

  /// A short summary of what the operation does.
  final String? summary;

  /// A verbose explanation of the operation behavior. CommonMark syntax may be
  /// used for rich text representation.
  final String? description;

  /// Additional external documentation for this operation.
  final ExternalDocumentationObject? externalDocs;

  /// Unique string used to identify the operation.The id must be unique among
  /// all operations described in the API.The operationId value is
  /// case-sensitive. Tools and libraries may use the operationId to uniquely
  /// identify an operation, therefore, it is recommended to follow common
  /// programming naming conventions. It should be serverpod endpoint's method
  /// name and endpoint name. eg `<endpointMethodName><EndpointName>`
  /// (`findPetByIdPet`)
  final String? operationId;

  /// A list of parameters that are applicable for this operation.
  /// If a parameter is already defined at the Path Item, the new definition
  /// will override it but can never remove it. The list must not include
  /// duplicated parameters. A unique parameter is defined by a combination of
  /// a name and location.The list can use the Reference Object to link to
  /// parameters that are defined at the OpenAPI Object's components/parameters.
  final List<ParameterObject> parameters;

  /// The request body applicable for this operation.
  /// Serverpod endpoint method parameters are represented as
  /// [RequestBodyObject] in the OpenAPI specification.
  final RequestBodyObject? requestBody;

  /// The list of possible responses as they are returned from executing
  /// this operation. The [ResponseObject] corresponds to the return type of a
  /// serverpod endpoint method.
  final ResponseObject responses;

  /// Declares this operation to be deprecated. Consumers should refrain
  /// from usage of the declared operation.
  /// Default value is false.
  final bool deprecated;

  /// A declaration of which security mechanisms can be used for this operation.
  /// The list of values includes alternative security requirement objects that
  /// can be used. Only one of the security requirement objects need to be
  /// satisfied to authorize a request. To make security optional, an empty
  /// security requirement ({}) can be included in the array. This definition
  /// overrides any declared top-level security. To remove a top-level security
  /// declaration, an empty array can be used.
  final Set<SecurityRequirementObject> security;

  /// An alternative server array to service this operation. If an alternative
  /// server object is specified at the [PathItemObject] or Root level,
  /// it will be overridden by this value.
  final List<ServerObject>? servers;
  OperationObject({
    this.tags,
    this.summary,
    this.description,
    this.externalDocs,
    this.operationId,
    required this.parameters,
    this.requestBody,
    required this.responses,
    this.deprecated = false,
    required this.security,
    this.servers,
  });

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{
      'operationId': operationId,
    };

    if (tags?.isNotEmpty ?? false) {
      map['tags'] = tags!;
    }

    if (summary != null) {
      map['summary'] = summary;
    }

    if (description != null) {
      map['description'] = description;
    }
    if (externalDocs != null) {
      map['externalDocs'] = externalDocs;
    }

    if (requestBody != null) {
      map['requestBody'] = requestBody!.toJson();
    }

    if (parameters.isNotEmpty) {
      map['parameters'] = parameters.map((e) => e.toJson()).toList();
    }
    if (security.isNotEmpty) {
      map['security'] = security.map((e) => e.toJson(true)).toList();
    }
    map['responses'] = responses.toJson();

    return map;
  }
}
