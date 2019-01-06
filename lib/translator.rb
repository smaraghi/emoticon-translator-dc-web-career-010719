require 'yaml'

def load_library(file_path)
  file = YAML.load_file(file_path)
  library = {
    "get_meaning" => {},
    "get_emoticon" => {}
  }
  file.each do |meaning, emoticon|
    library["get_meaning"][emoticon[1]] = meaning
    library["get_emoticon"][emoticon[0]] = emoticon[1]
  end
  
  library
end

def get_japanese_emoticon(file_path, emoticon)
  library = load_library(file_path)
  if library["get_emoticon"].keys.include?(emoticon)
    library["get_emoticon"][emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file_path, emoticon)
  library = load_library(file_path)
  if library["get_meaning"].keys.include?(emoticon)
    library["get_meaning"][emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end
