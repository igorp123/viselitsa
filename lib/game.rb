class Game
  attr_reader :errors, :letters, :good_letters, :bad_letters, :status
  attr_accessor :version
  MAX_ERRORS = 7

  def initialize(word)
    @letters = get_letters(word)

    @errors = 0

    @good_letters = []
    @bad_letters = []

    @status = :in_progress
  end

  def get_letters(word)
    if word == nil || word == ""
      abort 'Не удалось получить слово...'
    end

    word.encode('UTF-8').split("")
  end

  def ask_next_letter
    puts 'Введите следущую букву:'

    letter = ""

    while letter == ""
      letter = UnicodeUtils.upcase(STDIN.gets.encode('UTF-8').chomp)
    end

    next_step(letter)
  end

  def is_good?(letter)
    @letters.include?(letter) ||
      (letter == "Е" && @letters.include?("Ё")) ||
      (letter == "Ё" && @letters.include?("Е")) ||
      (letter == "И" && @letters.include?("Й")) ||
      (letter == "Й" && @letters.include?("И"))
  end

  def add_letters_to(letters, letter)
    letters << letter

    case letter
    when "Е"
      letters << "Ё"
    when "Ё"
      letters << "Е"
    when "И"
      letters << "Й"
    when "Й"
      letters << "И"
    end
  end

  def solved?
    (@letters.uniq - @good_letters).empty?
  end

  def repeated?(letter)
    @good_letters.include?(letter) || @bad_letters.include?(letter)
  end

  def lost?
    @status == :lost || @errors >= MAX_ERRORS
  end

  def in_progress?
    @status == :in_progress
  end

  def won?
    @status == :won
  end

  def max_errors
    MAX_ERRORS
  end

  def errors_left
    MAX_ERRORS - @errors
  end

  def next_step(letter)
    return if @status == :lost || @status == :won
    return if repeated?(letter)

    if is_good?(letter)
      add_letters_to(@good_letters, letter)

      @status = :won if solved?
    else
      add_letters_to(@bad_letters, letter)

      @errors += 1

      @status = :lost if lost?
    end
  end
end
