require_relative "../config/environment.rb"
prompt = TTY::Prompt.new


system "clear"
puts "\n\n\n"
puts <<-'EOF'
██▓███   ██▀███   ▒█████   ▄▄▄██▀▀▀▓█████  ▄████▄  ▄▄▄█████▓    ▄▄▄▄    ▄▄▄      ▄▄▄█████▓▄▄▄█████▓ ██▓    ▓█████ 
▓██░  ██▒▓██ ▒ ██▒▒██▒  ██▒   ▒██   ▓█   ▀ ▒██▀ ▀█  ▓  ██▒ ▓▒   ▓█████▄ ▒████▄    ▓  ██▒ ▓▒▓  ██▒ ▓▒▓██▒    ▓█   ▀ 
▓██░ ██▓▒▓██ ░▄█ ▒▒██░  ██▒   ░██   ▒███   ▒▓█    ▄ ▒ ▓██░ ▒░   ▒██▒ ▄██▒██  ▀█▄  ▒ ▓██░ ▒░▒ ▓██░ ▒░▒██░    ▒███   
▒██▄█▓▒ ▒▒██▀▀█▄  ▒██   ██░▓██▄██▓  ▒▓█  ▄ ▒▓▓▄ ▄██▒░ ▓██▓ ░    ▒██░█▀  ░██▄▄▄▄██ ░ ▓██▓ ░ ░ ▓██▓ ░ ▒██░    ▒▓█  ▄ 
▒██▒ ░  ░░██▓ ▒██▒░ ████▓▒░ ▓███▒   ░▒████▒▒ ▓███▀ ░  ▒██▒ ░    ░▓█  ▀█▓ ▓█   ▓██▒  ▒██▒ ░   ▒██▒ ░ ░██████▒░▒████▒
▒▓▒░ ░  ░░ ▒▓ ░▒▓░░ ▒░▒░▒░  ▒▓▒▒░   ░░ ▒░ ░░ ░▒ ▒  ░  ▒ ░░      ░▒▓███▀▒ ▒▒   ▓▒█░  ▒ ░░     ▒ ░░   ░ ▒░▓  ░░░ ▒░ ░
░▒ ░       ░▒ ░ ▒░  ░ ▒ ▒░  ▒ ░▒░    ░ ░  ░  ░  ▒       ░       ▒░▒   ░   ▒   ▒▒ ░    ░        ░    ░ ░ ▒  ░ ░ ░  ░
░░         ░░   ░ ░ ░ ░ ▒   ░ ░ ░      ░   ░          ░          ░    ░   ░   ▒     ░        ░        ░ ░      ░   
            ░         ░ ░   ░   ░      ░  ░░ ░                   ░            ░  ░                      ░  ░   ░  ░
                                           ░                          ░                                                              
EOF

prompt.keypress("                                      Press space or enter to continue", keys: [:space, :return])

system "clear"

trainer_options = Trainer.all.collect do |trainer| trainer.name end
trainer_options << "New Trainer"

p1trainer = prompt.select("Player 1, Please select your trainer",trainer_options)
        if p1trainer == "New Trainer"
            #Create new Trainer
            puts "Please type in a name:"
            inputname = gets.chomp
            new_trainer = Trainer.create(name: inputname)
            available_pokemons = Pocketmonster.all.collect do |pokemon| pokemon.name end

            #Printout available pokemons
            5.times do
                new_trainer_pokemons = new_trainer.pocketmonsters.collect do |pokemon| pokemon.name end
                available_pokemons -= new_trainer_pokemons
                selected_pokemon = Pocketmonster.find_by(name: prompt.select("Select Pokemon",available_pokemons))
                PocketmonsterTrainer.create(trainer_id: new_trainer.id,pocketmonster_id: selected_pokemon.id,hitpoints: selected_pokemon.hp)
                new_trainer.reload
            end

            new_trainer.pocketmonster_trainers.each do |trainer_pokemon|
                Movelist.find_or_create_by(pocketmonster_trainer_id: trainer_pokemon.id,move_id: 1, pp: 3)
                Movelist.find_or_create_by(pocketmonster_trainer_id: trainer_pokemon.id,move_id: 2, pp: 2)
                case trainer_pokemon.pocketmonster_id
                    when 1
                        Movelist.find_or_create_by(pocketmonster_trainer_id: trainer_pokemon.id,move_id: 3, pp: 1)
                    when 2
                        Movelist.find_or_create_by(pocketmonster_trainer_id: trainer_pokemon.id,move_id: 4, pp: 1)
                    when 3
                        Movelist.find_or_create_by(pocketmonster_trainer_id: trainer_pokemon.id,move_id: 5, pp: 1)
                    when 4
                        Movelist.find_or_create_by(pocketmonster_trainer_id: trainer_pokemon.id,move_id: 8, pp: 1)
                    when 5
                        Movelist.find_or_create_by(pocketmonster_trainer_id: trainer_pokemon.id,move_id: 6, pp: 1)
                    when 6
                        Movelist.find_or_create_by(pocketmonster_trainer_id: trainer_pokemon.id,move_id: 7, pp: 1)
                    when 7 
                        Movelist.find_or_create_by(pocketmonster_trainer_id: trainer_pokemon.id,move_id: 9, pp: 30)
                end
            end

            new_trainer=Trainer.find(new_trainer.id)
            player1 = new_trainer

            #Select the Trainer
            #Save trainer
            #return created trainer to assign to player1
        else
            player1 = Trainer.find_by(name: p1trainer)
        end

system "clear"

trainer_options -= [player1.name]

p2trainer = prompt.select("Player 2, Please select your trainer",trainer_options)
if p2trainer == "New Trainer"
    #Create new Trainer
    puts "Please type in a name:"
    inputname = gets.chomp
    new_trainer = Trainer.create(name: inputname)
    available_pokemons = Pocketmonster.all.collect do |pokemon| pokemon.name end

    #Printout available pokemons
    5.times do
        new_trainer_pokemons = new_trainer.pocketmonsters.collect do |pokemon| pokemon.name end
        available_pokemons -= new_trainer_pokemons
        selected_pokemon = Pocketmonster.find_by(name: prompt.select("Select Pokemon",available_pokemons))
        PocketmonsterTrainer.create(trainer_id: new_trainer.id,pocketmonster_id: selected_pokemon.id,hitpoints: selected_pokemon.hp)
        new_trainer.reload
    end

    new_trainer.pocketmonster_trainers.each do |trainer_pokemon|
        Movelist.find_or_create_by(pocketmonster_trainer_id: trainer_pokemon.id,move_id: 1, pp: 3)
        Movelist.find_or_create_by(pocketmonster_trainer_id: trainer_pokemon.id,move_id: 2, pp: 2)
        case trainer_pokemon.pocketmonster_id
            when 1
                Movelist.find_or_create_by(pocketmonster_trainer_id: trainer_pokemon.id,move_id: 3, pp: 1)
            when 2
                Movelist.find_or_create_by(pocketmonster_trainer_id: trainer_pokemon.id,move_id: 4, pp: 1)
            when 3
                Movelist.find_or_create_by(pocketmonster_trainer_id: trainer_pokemon.id,move_id: 5, pp: 1)
            when 4
                Movelist.find_or_create_by(pocketmonster_trainer_id: trainer_pokemon.id,move_id: 6, pp: 1)
            when 5
                Movelist.find_or_create_by(pocketmonster_trainer_id: trainer_pokemon.id,move_id: 7, pp: 1)
            when 6
                Movelist.find_or_create_by(pocketmonster_trainer_id: trainer_pokemon.id,move_id: 8, pp: 1)
            when 7 
                Movelist.find_or_create_by(pocketmonster_trainer_id: trainer_pokemon.id,move_id: 9, pp: 30)
        end
    end

    new_trainer=Trainer.find(new_trainer.id)
    player2 = new_trainer
else
    player2 = Trainer.find_by(name: p2trainer)
end

pocketmonster_p1 = player1.pocketmonster_trainers[0]
pocketmonster_p2 = player2.pocketmonster_trainers[0]


while
    swapoption = true
    while swapoption
    print_ui(pocketmonster_p1,pocketmonster_p2)
    puts "\n\n\nPlayer 1 Turn: \n"
    selected_option=print_pkmn_fight
        if selected_option == "PKMN"
            puts "Select pokemon method here"
            pocketmonster_p1=swap_pocketmonster(player1.pocketmonster_trainers)
            sleep 1
        else
            swapoption = false
        end
    end
    print_ui(pocketmonster_p1,pocketmonster_p2)   
    puts "\n\n\nPlayer 1 Turn: \n"
    attack_phase_test(pocketmonster_p1,pocketmonster_p2)
    
    #Win condition, change when Trainer is implemented
        if pocketmonster_p2.hitpoints <= 0 && player2.pocketmonster_trainers.collect{|pokemon| pokemon.hitpoints}.sum > 0
            print_ui(pocketmonster_p1,pocketmonster_p2)
            puts "\n \n#{pocketmonster_p2.trainer.name}'s #{pocketmonster_p2.pocketmonster.name} FAINTED!! \n"
            puts "PLEASE SELECT A NEW POKEMON"
            pocketmonster_p2=swap_pocketmonster(player2.pocketmonster_trainers)
        end

        if player2.pocketmonster_trainers.collect{|pokemon| pokemon.hitpoints}.sum == 0
        break
        end

    #Win condition END

    #player 2 turn begin
    swapoption = true
    while swapoption
    print_ui(pocketmonster_p1,pocketmonster_p2)
    puts "\n\n\nPlayer 2 Turn: \n"
    selected_option=print_pkmn_fight
        if selected_option == "PKMN"
            puts "Select pokemon method here"
            pocketmonster_p2=swap_pocketmonster(player2.pocketmonster_trainers)
            sleep 1
        else
            swapoption = false
        end
    end
    print_ui(pocketmonster_p1,pocketmonster_p2)
    puts "\n\n\nPlayer 2 Turn: \n"
    attack_phaseAI(pocketmonster_p2,pocketmonster_p1)


        if pocketmonster_p1.hitpoints <= 0 && player1.pocketmonster_trainers.collect{|pokemon| pokemon.hitpoints}.sum > 0
            print_ui(pocketmonster_p1,pocketmonster_p2)
            puts "\n \n#{pocketmonster_p1.trainer.name}'s #{pocketmonster_p1.pocketmonster.name} FAINTED!! \n"
            puts "PLEASE SELECT A NEW POKEMON"
            pocketmonster_p1=swap_pocketmonster(player1.pocketmonster_trainers)
        end

        if player1.pocketmonster_trainers.collect{|pokemon| pokemon.hitpoints}.sum == 0
        break
        end
    #Win condition END
end

#Game ended
system "clear"
if player1.pocketmonster_trainers.collect{|pokemon| pokemon.hitpoints}.sum > 0
puts <<-'EOF'
                                                                                    __                                 .-'''-.                
                        .---.                                                  ...-'  |`.                             '   _    \              
_________   _...._      |   |                            __.....__             |      |  |                          /   /` '.   \    _..._    
\        |.'      '-.   |   |        .-.          .- .-''         '.           ....   |  |                  _     _.   |     \  '  .'     '.  
 \        .'```'.    '. |   |         \ \        / //     .-''"'-.  `. .-,.--.   -|   |  |            /\    \\   //|   '      |  '.   .-.   . 
  \      |       \     \|   |    __    \ \      / //     /________\   \|  .-. |   |   |  |            `\\  //\\ // \    \     / / |  '   '  | 
   |     |        |    ||   | .:--.'.   \ \    / / |                  || |  | |...'   `--'              \`//  \'/   `.   ` ..' /  |  |   |  | 
   |      \      /    . |   |/ |   \ |   \ \  / /  \    .-------------'| |  | ||         |`.             \|   |/       '-...-'`   |  |   |  | 
   |     |\`'-.-'   .'  |   |`" __ | |    \ `  /    \    '-.____...---.| |  '- ` --------\ |              '                       |  |   |  | 
   |     | '-....-'`    |   | .'.''| |     \  /      `.             .' | |      `---------'                                       |  |   |  | 
  .'     '.             '---'/ /   | |_    / /         `''-...... -'   | |                                                        |  |   |  | 
'-----------'                \ \._,\ '/|`-' /                          |_|                                                        |  |   |  | 
                              `--'  `"  '..'                                                                                      '--'   '--' 
EOF

    
else
    puts <<-'EOF'
                                                                                                                       .-'''-.                
                        .---.                                                     .-''-.                              '   _    \              
_________   _...._      |   |                            __.....__              .' .-.  )                           /   /` '.   \    _..._    
\        |.'      '-.   |   |        .-.          .- .-''         '.           / .'  / /                    _     _.   |     \  '  .'     '.  
 \        .'```'.    '. |   |         \ \        / //     .-''"'-.  `. .-,.--.(_/   / /               /\    \\   //|   '      |  '.   .-.   . 
  \      |       \     \|   |    __    \ \      / //     /________\   \|  .-. |    / /                `\\  //\\ // \    \     / / |  '   '  | 
   |     |        |    ||   | .:--.'.   \ \    / / |                  || |  | |   / /                   \`//  \'/   `.   ` ..' /  |  |   |  | 
   |      \      /    . |   |/ |   \ |   \ \  / /  \    .-------------'| |  | |  . '                     \|   |/       '-...-'`   |  |   |  | 
   |     |\`'-.-'   .'  |   |`" __ | |    \ `  /    \    '-.____...---.| |  '-  / /    _.-')              '                       |  |   |  | 
   |     | '-....-'`    |   | .'.''| |     \  /      `.             .' | |    .' '  _.'.-''                                       |  |   |  | 
  .'     '.             '---'/ /   | |_    / /         `''-...... -'   | |   /  /.-'_.'                                           |  |   |  | 
'-----------'                \ \._,\ '/|`-' /                          |_|  /    _.'                                              |  |   |  | 
                              `--'  `"  '..'                               ( _.-'                                                 '--'   '--' 
EOF

end
