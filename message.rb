class Message
  attr_reader :text

  def initialize(string)
    @text = string
  end

  def stays_in_msg?(char)
    if (char < 'a' || char > 'z') && (char < 'A' || char > 'Z') && (char != ' ')
      return false
    end
    true
  end

  def remove_non_alphas
    non_alphas_removed = []
    chars = @text.split('')
    chars.each do |char|
      char = '' if !stays_in_msg?(char)
      non_alphas_removed << char
    end
    @text = non_alphas_removed.join.upcase
  end

  def put_char_in_range(char)
    char_as_ascii_dec = char.ord
    while char_as_ascii_dec < ASCII_ALPHA_MIN
      char_as_ascii_dec += ALPHABET_SIZE
    end
    while char_as_ascii_dec > ASCII_ALPHA_MAX
      char_as_ascii_dec -= ALPHABET_SIZE
    end
    char_as_ascii_dec.chr
  end

  def caesar_encrypt(key)
    caesar_encrypted = []
    chars = remove_non_alphas
    chars = chars.split('')
    chars.each do |char|
      if char != ' '
        char = char.ord + key
        char = put_char_in_range(char)
      end
      caesar_encrypted << char
    end
    caesar_encrypted.join
  end

  ASCII_ALPHA_MIN = 65
  ASCII_ALPHA_MAX = 90
  ALPHABET_SIZE = 26
end
