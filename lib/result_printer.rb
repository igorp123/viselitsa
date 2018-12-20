#Класс Выводит результат игры на экран
class ResultPrinter
  def initialize(game)
    #Массив для картинок
    @status_image = []

    current_path = File.dirname(__FILE__)

    counter = 0

    #Считываем картинки из фалов
    while counter <= 7
      file_name = current_path + "/../image/#{counter}.txt"
      begin
        #Считываем содержимое файла и добавляем в массив картинок
        file = File.read(file_name)

        @status_image << file
      rescue SystemCallError
        @status_image << "\n[ Изображение не найдено ]\n"
      end

      counter += 1
    end
  end

  #Метод выводит статус игры
  def print_status(game)
    cls
    puts game.version
    puts "\Слово: " + get_word_for_print(game.letters, game.good_letters)

    puts "Ошибки (#{game.errors}): #{game.bad_letters.join(", ")}"

    print_viselitsa(game.errors)

    #Если ошибок >= 7 - Проиграли, иначе Ваиграли
    if game.lost?
      puts "Вы проиграли :("
      puts "Загаданное слово было: " + game.letters.join("")
      puts
    elsif game.won?
        puts "Вы выиграли. Поздравляем! \n\n"
    else
        puts "У вас осталоcь попыток: #{game.errors_left}"
    end
  end

  #Метод выводит загаданное слово на экран
  def get_word_for_print(letters, good_letters)
    result = ""

    for letter in letters
      if good_letters.include? letter
        result += letter + " "
      else
        result += "__ "
      end
    end
    return result
  end

  #Метод очищает экрана
  def cls
    system("cls") || system("clear")
  end

  #Метод выводит картинку виселицы
  def print_viselitsa(errors)
    puts @status_image[errors]
  end
end
