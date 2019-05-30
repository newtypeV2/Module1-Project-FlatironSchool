


def hp_printer(hitpoints)
    hitpoints.times do print "▓" end
    hp_remain = 60 - hitpoints
    hp_remain.times do print "░" end
end

def print_ui(p1pokemon, p2pokemon)
    system "clear"
    puts "#{p1pokemon.trainer.name}'s #{p1pokemon.pocketmonster.name} HP"
    hp_printer(p1pokemon.hitpoints.clamp(0,60))
    puts "\n\n"
    70.times do print "≡" end
    puts "\n\n#{p2pokemon.trainer.name}'s #{p2pokemon.pocketmonster.name} HP\n\n"
    hp_printer(p2pokemon.hitpoints.clamp(0,60))
    puts "\n\n"
    70.times do print "≡" end
end

def moves_printer(movelist)
    puts "-o-o-o-o-o-o-o-"
    pps = movelist.select {|movelist| movelist.pp > 0}
    pps.each_with_index {|movelist,i| puts "#{i+1} - #{movelist.move.name}"}
    puts "-o-o-o-o-o-o-o-"
    return pps
end

def attack_phaseAI(attack_mon,defense_mon)
    available_moves = moves_printer(attack_mon.movelists)
    input = rand(1..available_moves.length)
    selected_move = available_moves[input-1].move
    available_moves[input-1].pp-=1
    puts "#{attack_mon.pocketmonster.name} used #{selected_move.name}!!"
    move_dmg=selected_move.base_damage
    defense_mon.hitpoints -= move_dmg
    if defense_mon.hitpoints <0
        defense_mon.hitpoints = 0
    end
    sleep 2
end

def attack_phase(attack_mon,defense_mon)
    prompt = TTY::Prompt.new
    move_name = prompt.select("Select your move",filter_movelists(attack_mon.movelists))
    selected_move = Move.find_by(name: move_name)
    #used_move = attack_mon.movelists.find_by(move_id: selected_move.id)
    used_move = attack_mon.movelists.select{|movelist| movelist.move_id == selected_move.id}.first
    used_move.pp -=1
    puts "#{attack_mon.pocketmonster.name} used #{selected_move.name}!!"
    move_dmg=selected_move.base_damage
    defense_mon.hitpoints -= move_dmg
    if defense_mon.hitpoints <0
        defense_mon.hitpoints = 0
    end
    sleep 1
end

def filter_movelists(movelists)
    return movelists.select {|movelist| movelist.pp > 0}.collect{|movelist| movelist.move.name}
end

def print_pkmn_fight
    puts "\n"
    prompt = TTY::Prompt.new
    prompt.select("SELECT ACTION:",["FIGHT","PKMN"])
end

def swap_pocketmonster(playerpocketmonsters)
    prompt = TTY::Prompt.new
    filteredlist = playerpocketmonsters.select {|ppm| ppm.hitpoints > 0 }
    pokemons=filteredlist.collect{|pokemon| pokemon.pocketmonster.name}
    chosen_pokemon = Pocketmonster.find_by(name: prompt.select("Available Pokemons",pokemons))
    return playerpocketmonsters.select {|pokemon| pokemon.pocketmonster.id == chosen_pokemon.id}.first
end
