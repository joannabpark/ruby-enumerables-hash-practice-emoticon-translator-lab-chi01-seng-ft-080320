require "yaml"

def load_library(file)
  emoticons = YAML.load_file(file)
  emoticons.each_with_object({}) do |(emoji_title, emoji_array), emoji_hash|
    emoji_array.each do |emoji|
    value_hash = {}
     value_hash[:english] = emoji_array[0]
      value_hash[:japanese] = emoji_array[1]
      emoji_hash[emoji_title] = value_hash
    end 
  end
end

def get_japanese_emoticon(file, eng_emoti)
  # code goes here
  translation = ""
  new_hash = load_library(file)
  new_hash.each do |name, languages|
      if languages[:english] == eng_emoti
      translation = languages[:japanese]
    end
  end
    if translation == ""
      return "Sorry, that emoticon was not found"
    else 
      return translation
    end
end

def get_english_meaning(file, meaning)
 emoticons = load_library(file)
  emoticons.each do |emoji_title, value_hash|
   value_hash.each do |language, emoji|
     if meaning == emoji
    return emoji_title
      else
        "Sorry, that emoticon was not found"
      end 
    end
  end
end