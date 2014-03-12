require 'irb/completion'

favorite_gems = ["awesome_print", "allocation_counter", "pry-remote"]
def gemset
  gemsets = ENV['GEM_PATH'].split(':')
  # Take first non-global
  non_global = gemsets.reject { |path| path =~ /global/ }.first
  return non_global if non_global
  # Global as last resort
  gemsets.grep(/global/).first
end

if defined?(::Bundler)
  if gemset
    all_gem_paths = Dir.glob("#{gemset}/gems/*")
    all_gem_paths.each do |path|
      next unless favorite_gems.any? { |gem_name| path.include? gem_name }
      $LOAD_PATH << "#{path}/lib"
    end
  end
end

favorite_gems.each { |gem| puts "requiring #{gem}"; require gem }
