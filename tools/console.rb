require_relative "../config/environment.rb"
prompt = TTY::Prompt.new


system "clear"
puts "\n\n\n"
puts <<-'EOF'
███╗   ███╗ ██████╗ ██████╗      ██╗    ██████╗ ██████╗  ██████╗      ██╗███████╗ ██████╗████████╗
████╗ ████║██╔═══██╗██╔══██╗    ███║    ██╔══██╗██╔══██╗██╔═══██╗     ██║██╔════╝██╔════╝╚══██╔══╝
██╔████╔██║██║   ██║██║  ██║    ╚██║    ██████╔╝██████╔╝██║   ██║     ██║█████╗  ██║        ██║   
██║╚██╔╝██║██║   ██║██║  ██║     ██║    ██╔═══╝ ██╔══██╗██║   ██║██   ██║██╔══╝  ██║        ██║   
██║ ╚═╝ ██║╚██████╔╝██████╔╝     ██║    ██║     ██║  ██║╚██████╔╝╚█████╔╝███████╗╚██████╗   ██║   
╚═╝     ╚═╝ ╚═════╝ ╚═════╝      ╚═╝    ╚═╝     ╚═╝  ╚═╝ ╚═════╝  ╚════╝ ╚══════╝ ╚═════╝   ╚═╝  
EOF

prompt.keypress("                                 Press space or enter to continue", keys: [:space, :return])

#Trainer select sectioj
system "clear"
trainer_options = Trainer.all.collect do |trainer| trainer.name end
trainer_options << "New Trainer"
player1 = trainer_select(trainer_options)
system "clear"
trainer_options -= [player1.name]
player2 = trainer_select(trainer_options)
pocketmonster_p1 = player1.pocketmonster_trainers[0]
pocketmonster_p2 = player2.pocketmonster_trainers[0]

#Battle Start!

while
    #player 1 turn begin
    swapoption = true
    while swapoption
    print_ui(pocketmonster_p1,pocketmonster_p2)
    # puts "\n\n\nPlayer 1 Turn: \n"
    puts "\n\n\n"
    puts <<-'EOF'
     _   _   _   _   _   _     _     _   _   _   _   _  
    / \ / \ / \ / \ / \ / \   / \   / \ / \ / \ / \ / \ 
   ( P | l | a | y | e | r ) ( 1 ) ( T | u | r | n | : )
    \_/ \_/ \_/ \_/ \_/ \_/   \_/   \_/ \_/ \_/ \_/ \_/ 
    EOF
    puts "\n"
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
    puts "\n\n\n"
    puts <<-'EOF'
     _   _   _   _   _   _     _     _   _   _   _   _  
    / \ / \ / \ / \ / \ / \   / \   / \ / \ / \ / \ / \ 
   ( P | l | a | y | e | r ) ( 1 ) ( T | u | r | n | : )
    \_/ \_/ \_/ \_/ \_/ \_/   \_/   \_/ \_/ \_/ \_/ \_/ 
    EOF
    puts "\n"
    attack_phase(pocketmonster_p1,pocketmonster_p2)
    
        if pocketmonster_p2.hitpoints <= 0 && player2.pocketmonster_trainers.collect{|pokemon| pokemon.hitpoints}.sum > 0
            print_ui(pocketmonster_p1,pocketmonster_p2)
            puts "\n \n#{pocketmonster_p2.trainer.name}'s #{pocketmonster_p2.pocketmonster.name} FAINTED!! \n\n"
            puts "PLEASE SELECT A NEW POKEMON"
            pocketmonster_p2=swap_pocketmonster(player2.pocketmonster_trainers)
        end

        if player2.pocketmonster_trainers.collect{|pokemon| pokemon.hitpoints}.sum == 0
        break
        end

    #player 2 turn begin
    swapoption = true
    while swapoption
    print_ui(pocketmonster_p1,pocketmonster_p2)
    puts "\n\n\n"
    puts <<-'EOF'
     _   _   _   _   _   _     _     _   _   _   _   _  
    / \ / \ / \ / \ / \ / \   / \   / \ / \ / \ / \ / \ 
   ( P | l | a | y | e | r ) ( 2 ) ( T | u | r | n | : )
    \_/ \_/ \_/ \_/ \_/ \_/   \_/   \_/ \_/ \_/ \_/ \_/ 
    EOF
    puts "\n"
    
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
    puts "\n\n\n"
    puts <<-'EOF'
     _   _   _   _   _   _     _     _   _   _   _   _  
    / \ / \ / \ / \ / \ / \   / \   / \ / \ / \ / \ / \ 
   ( P | l | a | y | e | r ) ( 2 ) ( T | u | r | n | : )
    \_/ \_/ \_/ \_/ \_/ \_/   \_/   \_/ \_/ \_/ \_/ \_/ 
    EOF
    puts "\n"
    # attack_phaseAI(pocketmonster_p2,pocketmonster_p1)
    attack_phase(pocketmonster_p2,pocketmonster_p1)

        if pocketmonster_p1.hitpoints <= 0 && player1.pocketmonster_trainers.collect{|pokemon| pokemon.hitpoints}.sum > 0
            print_ui(pocketmonster_p1,pocketmonster_p2)
            puts "\n \n#{pocketmonster_p1.trainer.name}'s #{pocketmonster_p1.pocketmonster.name} FAINTED!! \n\n"
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
