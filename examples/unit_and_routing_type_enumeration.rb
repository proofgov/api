#!/usr/bin/env ruby

require 'csv'

begin
  require 'http'
rescue LoadError
  puts "Missing required ruby package 'http'; please `gem install http` and retry"
  exit(1)
end

def proof_api_token
  ENV['PROOF_API_TOKEN']
end

def proof_api_host
  ENV.fetch('PROOF_API_HOST', 'https://app.proofgov.com')
end

def host_qualify(url)
  "#{proof_api_host}#{url}"
end

def proof_json(url, insecure: false)
# aka, a minimal ruby library
  httpr = HTTP.headers(
      accept: 'application/json',
      Authorization: "Bearer #{proof_api_token}"
    ).get(
      host_qualify(url),
      ssl_context: OpenSSL::SSL::SSLContext.new.tap do |ctx|
        ctx.verify_mode = OpenSSL::SSL::VERIFY_NONE if insecure
      end
    )

  (200..299).include? httpr.code or raise "HTTP GET on #{host_qualify(url)} failed - #{httpr.code}"

  r = JSON.parse(httpr.body)

  r = r['data'] if r.key?('data')

  r
end

def all_units_and_routing_types(csv = [])
  all_units = proof_json '/api/units'

  csv << ['Unit ID', 'Unit Name', 'Routing Type']

  all_units.each do |content|
    unit_id, unit_name = content.values_at 'id', 'name'
    entity_schema = proof_json "/api/entity_schema?entity_type=Routing&unit_id=#{unit_id}"

    routing_type_type = entity_schema['routingType'] # yeah ...

    next unless routing_type_type['type'] == 'CategoricalType'

    categorical_type_id = routing_type_type['id']
    categorical_type = proof_json "/api/categorical_types/#{categorical_type_id}"
    categorical_type['range'].each do |routing_type|
      csv << [unit_id, unit_name, routing_type]
    end
  end

  csv
end

csv_string = CSV.generate do |csv|
  all_units_and_routing_types csv
end
puts csv_string
