class SavePrincess
  def self.parse_board(input)
    raw = input.split("\n")
    board_l = raw[0]
    board_rows = raw[1..-1].collect{ |e| e ? e.strip : e }
    players_positions = {}
    
    board_rows.each_with_index do |row, row_index|
      princess_col = row.index('p')
      player_col = row.index('m')
      if princess_col
        players_positions['princess'] = [row_index, princess_col]
      end

      if player_col
        players_positions['player'] = [row_index, player_col]

      end      
    end
    players_positions
  end

  def self.save(input_positions)
    player_x, player_y = input_positions['me']
    pr, pr_y = input_positions['princess']

    delta_x = pr_x - player_x
    delta_y = pr_y - player_y

    nmoves = abs(delta_x) + abs(delta_y)

    (1..delta_y).each do |n|
      if delta_y > 0 
        print ("DOWN \n") 
        next
      end
      print ("UP \n")
    end
    
    (1..delta_x).each do |n|
      if delta_x > 0 
        print ("LEFT \n")
        next
      end
      print ("RIGHT \n")
    end
  end
end