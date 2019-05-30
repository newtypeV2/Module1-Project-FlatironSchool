require 'require_all'
require_relative '../config/environment.rb'

player1 = Trainer.find_or_create_by(name: "Young Red")
player2 = Trainer.find_or_create_by(name: "Young Gary")

pikachu = Pocketmonster.find_or_create_by(name: "Pikachu")
charmander = Pocketmonster.find_or_create_by(name: "Charmander")
squirtle = Pocketmonster.find_or_create_by(name: "Squirtle")
bulbasaur = Pocketmonster.find_or_create_by(name: "Bulbasaur")
mankey = Pocketmonster.find_or_create_by(name: "Mankey")
pidgey = Pocketmonster.find_or_create_by(name: "Pidgey")
magikarp = Pocketmonster.find_or_create_by(name: "Magikarp")

p1_pikachu = PocketmonsterTrainer.find_or_create_by(trainer_id: player1.id, pocketmonster_id: pikachu.id, hitpoints: pikachu.hp)
p1_charmander = PocketmonsterTrainer.find_or_create_by(trainer_id: player1.id, pocketmonster_id: charmander.id, hitpoints: charmander.hp)
p1_squirtle = PocketmonsterTrainer.find_or_create_by(trainer_id: player1.id, pocketmonster_id: squirtle.id, hitpoints: squirtle.hp)
p1_bulbasaur = PocketmonsterTrainer.find_or_create_by(trainer_id: player1.id, pocketmonster_id: bulbasaur.id, hitpoints: bulbasaur.hp)
p1_mankey = PocketmonsterTrainer.find_or_create_by(trainer_id: player1.id, pocketmonster_id: mankey.id, hitpoints: mankey.hp)
p1_pidgey = PocketmonsterTrainer.find_or_create_by(trainer_id: player1.id, pocketmonster_id: pidgey.id, hitpoints: pidgey.hp)
p1_magikarp = PocketmonsterTrainer.find_or_create_by(trainer_id: player1.id, pocketmonster_id: magikarp.id, hitpoints: magikarp.hp)

p2_pikachu = PocketmonsterTrainer.find_or_create_by(trainer_id: player2.id, pocketmonster_id: pikachu.id, hitpoints: pikachu.hp)
p2_charmander = PocketmonsterTrainer.find_or_create_by(trainer_id: player2.id, pocketmonster_id: charmander.id, hitpoints: charmander.hp)
p2_squirtle = PocketmonsterTrainer.find_or_create_by(trainer_id: player2.id, pocketmonster_id: squirtle.id, hitpoints: squirtle.hp)
p2_bulbasaur = PocketmonsterTrainer.find_or_create_by(trainer_id: player2.id, pocketmonster_id: bulbasaur.id, hitpoints: bulbasaur.hp)
p2_mankey = PocketmonsterTrainer.find_or_create_by(trainer_id: player2.id, pocketmonster_id: mankey.id, hitpoints: mankey.hp)
p2_pidgey = PocketmonsterTrainer.find_or_create_by(trainer_id: player2.id, pocketmonster_id: pidgey.id, hitpoints: pidgey.hp)
p2_magikarp = PocketmonsterTrainer.find_or_create_by(trainer_id: player2.id, pocketmonster_id: magikarp.id, hitpoints: magikarp.hp)

bite = Move.find_or_create_by(name: "Bite", base_damage: 10)
scratch = Move.find_or_create_by(name: "Scratch", base_damage: 15)
thunderbolt = Move.find_or_create_by(name: "Thunderbolt", base_damage: 30)
flamethrower = Move.find_or_create_by(name: "Flamethrower", base_damage: 30)
watergun = Move.find_or_create_by(name: "Watergun", base_damage: 30)
karatechop = Move.find_or_create_by(name: "Karate Chop", base_damage: 30)
gust = Move.find_or_create_by(name: "Gust", base_damage: 30)
razorleaf = Move.find_or_create_by(name: "Razor Leaf", base_damage: 30)
splash = Move.find_or_create_by(name: "Splash", base_damage: 50)


Movelist.find_or_create_by(pocketmonster_trainer_id: p1_pikachu.id,move_id: bite.id, pp: 3)
Movelist.find_or_create_by(pocketmonster_trainer_id: p1_pikachu.id,move_id: scratch.id, pp: 2)
Movelist.find_or_create_by(pocketmonster_trainer_id: p1_pikachu.id,move_id: thunderbolt.id, pp: 1)
Movelist.find_or_create_by(pocketmonster_trainer_id: p1_charmander.id, move_id: bite.id, pp: 3)
Movelist.find_or_create_by(pocketmonster_trainer_id: p1_charmander.id, move_id: scratch.id, pp: 2)
Movelist.find_or_create_by(pocketmonster_trainer_id: p1_charmander.id, move_id: flamethrower.id, pp: 1)
Movelist.find_or_create_by(pocketmonster_trainer_id: p1_bulbasaur.id, move_id: bite.id, pp: 3)
Movelist.find_or_create_by(pocketmonster_trainer_id: p1_bulbasaur.id, move_id: scratch.id, pp: 2)
Movelist.find_or_create_by(pocketmonster_trainer_id: p1_bulbasaur.id, move_id: razorleaf.id, pp: 1)
Movelist.find_or_create_by(pocketmonster_trainer_id: p1_squirtle.id,move_id: bite.id, pp: 3)
Movelist.find_or_create_by(pocketmonster_trainer_id: p1_squirtle.id,move_id: scratch.id, pp: 2)
Movelist.find_or_create_by(pocketmonster_trainer_id: p1_squirtle.id, move_id: watergun.id, pp: 1)
Movelist.find_or_create_by(pocketmonster_trainer_id: p1_mankey.id,move_id: bite.id, pp: 3)
Movelist.find_or_create_by(pocketmonster_trainer_id: p1_mankey.id,move_id: scratch.id, pp: 2)
Movelist.find_or_create_by(pocketmonster_trainer_id: p1_mankey.id, move_id: karatechop.id, pp: 1)
Movelist.find_or_create_by(pocketmonster_trainer_id: p1_pidgey.id,move_id: bite.id, pp: 3)
Movelist.find_or_create_by(pocketmonster_trainer_id: p1_pidgey.id,move_id: scratch.id, pp: 2)
Movelist.find_or_create_by(pocketmonster_trainer_id: p1_pidgey.id, move_id: gust.id, pp: 1)
Movelist.find_or_create_by(pocketmonster_trainer_id: p1_magikarp.id,move_id: splash.id, pp: 50)

Movelist.find_or_create_by(pocketmonster_trainer_id: p2_pikachu.id,move_id: bite.id, pp: 3)
Movelist.find_or_create_by(pocketmonster_trainer_id: p2_pikachu.id,move_id: scratch.id, pp: 2)
Movelist.find_or_create_by(pocketmonster_trainer_id: p2_pikachu.id,move_id: thunderbolt.id, pp: 1)
Movelist.find_or_create_by(pocketmonster_trainer_id: p2_charmander.id, move_id: bite.id, pp: 3)
Movelist.find_or_create_by(pocketmonster_trainer_id: p2_charmander.id, move_id: scratch.id, pp: 2)
Movelist.find_or_create_by(pocketmonster_trainer_id: p2_charmander.id, move_id: flamethrower.id, pp: 1)
Movelist.find_or_create_by(pocketmonster_trainer_id: p2_bulbasaur.id, move_id: bite.id, pp: 3)
Movelist.find_or_create_by(pocketmonster_trainer_id: p2_bulbasaur.id, move_id: scratch.id, pp: 2)
Movelist.find_or_create_by(pocketmonster_trainer_id: p2_bulbasaur.id, move_id: razorleaf.id, pp: 1)
Movelist.find_or_create_by(pocketmonster_trainer_id: p2_squirtle.id,move_id: bite.id, pp: 3)
Movelist.find_or_create_by(pocketmonster_trainer_id: p2_squirtle.id,move_id: scratch.id, pp: 2)
Movelist.find_or_create_by(pocketmonster_trainer_id: p2_squirtle.id, move_id: watergun.id, pp: 1)
Movelist.find_or_create_by(pocketmonster_trainer_id: p2_mankey.id,move_id: bite.id, pp: 3)
Movelist.find_or_create_by(pocketmonster_trainer_id: p2_mankey.id,move_id: scratch.id, pp: 2)
Movelist.find_or_create_by(pocketmonster_trainer_id: p2_mankey.id, move_id: karatechop.id, pp: 1)
Movelist.find_or_create_by(pocketmonster_trainer_id: p2_pidgey.id,move_id: bite.id, pp: 3)
Movelist.find_or_create_by(pocketmonster_trainer_id: p2_pidgey.id,move_id: scratch.id, pp: 2)
Movelist.find_or_create_by(pocketmonster_trainer_id: p2_pidgey.id, move_id: gust.id, pp: 1)
Movelist.find_or_create_by(pocketmonster_trainer_id: p2_magikarp.id,move_id: splash.id, pp: 50)


