require 'game'

describe Game do
  it 'test Game user win'do
    game = Game.new("загадка")
    expect(game.status).to eq :in_progress
    game.next_step("з")
    game.next_step("а")
    game.next_step("г")
    game.next_step("д")
    game.next_step("к")

    expect(game.errors).to eq 0
    expect(game.status).to eq :won
  end

  it 'test Game user lose'do
    game = Game.new("пиво")
    game.next_step("а")
    game.next_step("г")
    game.next_step("д")
    game.next_step("з")
    game.next_step("к")
    game.next_step("я")
    game.next_step("н")
    game.next_step("ж")
    game.next_step("э")


    expect(game.errors).to eq 7
    expect(game.status).to eq :lost
  end
end
