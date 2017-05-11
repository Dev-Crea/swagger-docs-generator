# Change Log

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/)
and this project adheres to [Semantic Versioning](http://semver.org/).

## [0.4.0] - 2017-05-11
### [Added]
- Add sub propertie for definition
- Add examples section in readme.md

## [0.3.6] - 2017-05-11
### [Fixed]
- Nested resource add tag for each parent resource
- Rubocop error
- Reek error
- Humanize summary description

## [0.3.5] - 2017-04-10
### [Added]
- Complete parameters header object
- Add option compress for compress `swagger.json` file

## [0.3.4] - 2017-04-10
### [Added]
- Complete yard documentation
- Summary is replace by method parsing if not present

### [Fixed]
- parameter in path format

## [0.3.1] - 2017-03-13
### [Fixed]
- Fixed checksum

## [0.3.0] - 2017-03-13
### [Added]
- Spec parameters
- Use constant TAG
- Display post install message

### [Removed]
- Delete old class unless

### [Changed]
- Parameters use DSL ruby
- Update parameters configuration
- For definitions element : parse model then temporary json

## [0.2.0] - 2017-03-13
### [Added]
- Configure travis for deployement
- Write info in task execution
- Option cleanning temporary file
- Base Controller array
- Add alias sdoc for swagger_doc
- Add alias scontroller for swagger_controller
- Add definition parser/metadata
- Add Environment for generated docs

### [Changed]
- Add environment generator

### [Fix]
- Delete temporary file

## [0.1.2] - 2017-03-09
### [Fix]
- Fix parameters body/other type
- Fix definitions type/format

### [Changed]
- Update responses
- Update parameters

### [Added]
- Adding definitions for elements to request
- Add changelog file
- Add response with schema (with type or not)
