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

def get_japanese_emoticon(file, eng_emoji)
  emoticons = load_library(file)
  emoticons.each do |meaning, idioms|
       if idioms[:english] == eng_emoji
         eng_emoji = idioms[:japanese]
  end
  if eng_emoji = ""
  "Sorry, that emoticon was not found"
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