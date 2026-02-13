#!/usr/bin/env ruby
# Validate YAML files in _data directory

require 'yaml'
require 'date'

# Get the project root directory (parent of scripts directory)
PROJECT_ROOT = File.expand_path('..', __dir__)

def validate_file(filepath)
  puts "Validating #{filepath}..."

  begin
    # Use safe_load_file for Ruby >= 3.1, fall back to load_file for older versions
    data = if YAML.respond_to?(:safe_load_file)
      YAML.safe_load_file(filepath, permitted_classes: [Date, Time], aliases: true)
    else
      YAML.load_file(filepath)
    end

    # File-specific validations
    case File.basename(filepath)
    when 'members.yml'
      validate_members(data, filepath)
    when 'publications.yml'
      validate_publications(data, filepath)
    end

    puts "✓ #{filepath} is valid"
    true
  rescue => e
    puts "✗ Error in #{filepath}: #{e.message}"
    false
  end
end

def validate_members(data, filepath)
  required_fields = ['name', 'image', 'position']

  data.each_with_index do |member, idx|
    required_fields.each do |field|
      unless member[field]
        raise "Member at index #{idx} missing required field: #{field}"
      end
    end

    # Check if image file exists (resolve relative to project root)
    image_path = File.expand_path(member['image'], PROJECT_ROOT)
    unless File.exist?(image_path)
      puts "  Warning: Image not found for #{member['name']}: #{member['image']}"
    end
  end
end

def validate_publications(data, filepath)
  required_fields = ['id', 'authors', 'title', 'journal', 'type', 'year']
  valid_types = ['journal', 'conference', 'workshop', 'abstract', 'poster', 'preprint']

  ids_seen = {}

  data.each_with_index do |pub, idx|
    # Check required fields
    required_fields.each do |field|
      unless pub[field]
        raise "Publication at index #{idx} missing required field: #{field}"
      end
    end

    # Check for duplicate IDs
    if ids_seen[pub['id']]
      raise "Duplicate publication ID: #{pub['id']}"
    end
    ids_seen[pub['id']] = true

    # Validate type
    unless valid_types.include?(pub['type'])
      raise "Publication #{pub['id']} has invalid type: #{pub['type']}"
    end

    # Validate year
    year = pub['year'].to_i
    unless year >= 1900 && year <= Date.today.year + 1
      raise "Publication #{pub['id']} has invalid year: #{pub['year']}"
    end

    # Check if files exist (resolve relative to project root)
    ['image', 'bibtex', 'pdf'].each do |file_field|
      next unless pub[file_field]
      next if pub[file_field].start_with?('http')

      file_path = File.expand_path(pub[file_field], PROJECT_ROOT)
      unless File.exist?(file_path)
        puts "  Warning: File not found for #{pub['id']}: #{pub[file_field]}"
      end
    end
  end
end

# Main execution
exit_code = 0

# Change to project root directory to find _data files
Dir.chdir(PROJECT_ROOT)

Dir.glob('_data/*.yml').each do |file|
  unless validate_file(file)
    exit_code = 1
  end
end

if exit_code == 0
  puts "\n✓ All YAML files are valid!"
else
  puts "\n✗ Some YAML files have errors"
end

exit exit_code

