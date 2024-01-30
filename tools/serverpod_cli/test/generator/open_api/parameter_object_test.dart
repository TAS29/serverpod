import 'package:serverpod_cli/src/generator/open_api/helpers/utils.dart';
import 'package:serverpod_cli/src/generator/open_api/open_api_objects.dart';
import 'package:serverpod_cli/src/test_util/builders/type_definition_builder.dart';
import 'package:test/test.dart';

void main() {
  var stringType = TypeDefinitionBuilder().withClassName('String').build();

  test(
      'Given query name status in query when converting to json then it is correctly generated.',
      () {
    OpenAPIParameter object = OpenAPIParameter(
      name: 'status',
      inField: ParameterLocation.query,
      requiredField: true,
      allowEmptyValue: false,
      schema: OpenAPIParameterSchema(
        stringType,
      ),
    );

    expect(object.toJson(), {
      'name': 'status',
      'in': 'query',
      'required': true,
      'schema': {
        'type': 'string',
      }
    });
  });

  test(
      'Given query name status in path when converting to json then it is correctly generated.',
      () {
    OpenAPIParameter object = OpenAPIParameter(
      name: 'status',
      inField: ParameterLocation.path,
      requiredField: true,
      allowEmptyValue: false,
      schema: OpenAPIParameterSchema(
        stringType,
      ),
    );

    expect(
      object.toJson(),
      {
        'name': 'status',
        'in': 'path',
        'required': true,
        'schema': {
          'type': 'string',
        }
      },
    );
  });

  test(
      'Given query name Authorization in header when converting to json then it is correctly generated.',
      () {
    OpenAPIParameter object = OpenAPIParameter(
      name: 'Authorization',
      inField: ParameterLocation.header,
      requiredField: true,
      allowEmptyValue: false,
      schema: OpenAPIParameterSchema(
        stringType,
      ),
    );

    expect(
      object.toJson(),
      {
        'name': 'Authorization',
        'in': 'header',
        'required': true,
        'schema': {
          'type': 'string',
        }
      },
    );
  });
}