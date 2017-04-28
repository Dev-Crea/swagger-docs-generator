# frozen_string_literal: true

# Test for parameter BODY
RSpec.shared_examples 'parameters body haves' do
  let(:test) { param.instance_variable_get(:@param) }

  include_examples 'parameters haves'

  context 'schema' do
    let(:result) { param_schema }
    include_examples 'parameter equal', :@schema
  end

  it do
    name = param_name.nil? ? 'body' : param_name
    description = param_description.nil? ? '' : param_description
    required = param_required.nil? ? true : param_required
    schema = param_schema.nil? ? '' : "#/definitions/#{param_schema.humanize}"

    expect(param.to_hash).to eql(
      in: :body,
      name: name,
      description: description,
      required: required,
      schema: { '$ref': schema }
    )
  end
end

# Test for parameter FORM
RSpec.shared_examples 'parameters form haves' do
  let(:test) { param.instance_variable_get(:@param) }

  include_examples 'parameters haves'

  it do
    name = param_name.nil? ? 'form' : param_name
    description = param_description.nil? ? '' : param_description
    required = param_required.nil? ? true : param_required

    expect(param.to_hash).to eql(
      in: :form,
      name: name,
      description: description,
      required: required
    )
  end
end

# Test for parameter HEADER
RSpec.shared_examples 'parameters header haves' do
  let(:test) { param.instance_variable_get(:@param) }

  include_examples 'parameters haves'

  context 'type' do
    let(:result) { param_type }
    include_examples 'parameter equal', :@type
  end
end

# Test for parameter PATH
RSpec.shared_examples 'parameters path haves' do
  let(:test) { param.instance_variable_get(:@param) }

  include_examples 'parameters haves'

  context 'type' do
    let(:result) { param_type }
    include_examples 'parameter equal', :@type
  end

  it do
    name = param_name.nil? ? 'path' : param_name
    description = param_description.nil? ? '' : param_description
    required = param_required.nil? ? true : param_required
    type = param_type.nil? ? '' : param_type

    expect(param.to_hash).to eql(
      in: :path,
      name: name,
      description: description,
      required: required,
      type: type
    )
  end
end

# Test for parameter QUERY
RSpec.shared_examples 'parameters query haves' do
  let(:test) { param.instance_variable_get(:@param) }

  include_examples 'parameters haves'

  context 'type' do
    let(:result) { param_type }
    include_examples 'parameter equal', :@type
  end

  it do
    name = param_name.nil? ? 'query' : param_name
    description = param_description.nil? ? '' : param_description
    required = param_required.nil? ? true : param_required
    type = param_type.nil? ? 'array' : param_type

    expect(param.to_hash).to eql(
      in: :query,
      name: name,
      description: description,
      required: required,
      type: type,
      items: { type: 'string' }
    )
  end
end

# Test for ALL parameters
RSpec.shared_examples 'parameters haves' do
  it { expect(param.to_hash).to be_kind_of Hash }

  context 'name' do
    let(:result) { param_name }
    include_examples 'parameter equal', :@name
  end

  context 'description' do
    let(:result) { param_description }
    include_examples 'parameter equal', :@description
  end

  context 'required' do
    let(:result) { param_required }
    include_examples 'parameter equal', :@required
  end
end

RSpec.shared_examples 'parameter equal' do |parameter|
  it { expect(test.instance_variable_get(parameter)).to eql(result) }
end
