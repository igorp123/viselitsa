# Viselitsa
## Игра "Виселица"

Отгадайте загаданное слово, называя по одной букве.
Если введенная вами буква есть в слове, то она откроется, если нет, то вы увидите "виселицу".
У вас будет всего семь попыток.

`Слово должно быть именем существительным, нарицательным в именительном падеже единственного числа,
либо множественного числа при отсутствии у слова формы единственного числа.`

["Виселица" в Wikipedia](https://ru.wikipedia.org/wiki/%D0%92%D0%B8%D1%81%D0%B5%D0%BB%D0%B8%D1%86%D0%B0_(%D0%B8%D0%B3%D1%80%D0%B0))

***
Программа написана на **Ruby** v.2.4.4.

## Установка
Склонируйте приложение на ваш компьютер
``` ruby
 git clone https://github.com/igorp123/viselitsa
```
Установите все необходимые гемы
``` ruby
 bundle install
```
## Запуск
``` ruby
  bundle exec ruby main.rb
```
Словарь со словами находится в `data/words.txt`. При желании, в этот файл можно добавлять свои слова. Каждое слово с новой строки.
Кодировка файла UTF-8.
