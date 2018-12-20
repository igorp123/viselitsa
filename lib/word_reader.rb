#Класс выбирает произвольное слово из файла
class WordReader
  def read_from_file(file_name)
    begin
      lines = File.readlines(file_name, encoding:'UTF-8')

      UnicodeUtils.upcase(lines.sample.chomp)
    rescue SystemCallError  #Errno::ENOENT
      abort "Не удалось открыть файл со словами"
    end
  end
end

