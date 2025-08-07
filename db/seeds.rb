# db/seeds.rb

puts "Limpando o banco de dados..."
Item.destroy_all

puts "Criando itens..."

# Lista de nomes dos itens que você já possui
# Removi os números e limpei os espaços em branco
owned_item_names = [
  "Mechanist Jumpsuit", "Polka Dot Sundres", "Pre-war Suburbanite", "Rural Schoolmarm", "Spring Casualwear",
  "Vailt Socialite", "Armored Vault Suit", "Battle Armor", "BoS Uniform", "Combat Armor", "Flight Suit",
  "Formal Wear", "Handyman Jumpsuit", "Iniate Robe", "Junior Officer Uniform", "Lab Coat", "Leather Armor",
  "Merc Gear", "Military Fatigues", "Nightwear", "Radiation Suit", "Raider Armor", "Treasure Gear",
  "Wasteland Gear", "Wasteland Medic", "Business Suit", "Country Girl", "Waitress Uniform", "Doo-wop Singer",
  "Drag Racer", "Post-War Casanova", "Soda Fountain Dress", "Advanced BoS Uniform", "advanced Flight Suit",
  "Advanced Institute Jumper", "Advanced Jumpsuit", "Advanced Lab Coat", "Advanced Radiation Suit",
  "Baseball Uniform", "Bounty Hunter Gear", "Clergy Outfit", "Comedian Outfit", "Engineer Outfit",
  "Fancy Formal Wear", "Greaser Outfit", "Horror Fan Outfit", "Knight Armor", "Librarian Outfit",
  "Lifeguard Outfit", "Mayor Ouitfit", "Medieval Ruler Outfit", "Movie Fan outfit", "Naughty Night Wear",
  "Ninja Outfit", "Nobility Outfit", "Officer Fatigues", "Officer Uniform", "Professor Outfit",
  "Republic Robes", "Sci-Fi Fan Outfit", "Scribe Robe", "Soldier Uniform", "Sports Fan outfit",
  "Sturdy Battler Armor", "Sturdy Combat Armor", "Aturdy Leather Armor", "Sturdy Merc Gear",
  "Sturdy Metal Armor", "Sturdy Raider Armor", "Sturdy Vault Suit", "Sturdy Wasteland Gear", "Surgeon Outfit",
  "Survivor Armor", "Swimsuit", "Wasteland Doctor", "Wrestler outfit", "Motorcycle Jacket",
  "T-45a Power Armor", "T-51d Power Armor", "T-60a Power Armor", "X-01 Mk I Power Armor",
  "Abraham's Relaxedwear", "Commander Uniform", "Confessor Cromwell's Rags", "Elder Robe",
  "Expert BoS Uniform", "Expert Flight Suit", "Expert Institute Jumper", "Expert Lab Coat",
  "Expert Radiation Suit", "Heavy Combat Armor", "Heavy Merc Gear", "Heavy Raider Armor",
  "Heavy nSynth Armor", "Heavy Wasteland Gear", "Lucky Formal Wear", "Scribe Rothchild's Robe",
  "T-51f Power Armor", "Three Dog's Outfit", "Wasteland Surgeon", "X-01 Mk VI Power Armor",
  "Rackie Jobinson's Jersey", "Rusty BB gun", "BB gun", "Rusty .32 Pistol", ".32 Pistol",
  "Enhanced BB Gun", "Enhanced .32 Pistol", "Pipe Pistol", "Rusty 10mm Pistol", "10mm Pistol",
  "Enhanced 10mm Pistol", "Rusty Scoped .44", "Hair Trigger Pipe Pistol", "Scoped .44",
  "Enhanced Scoped .44", "Rusty Lever-Action Rifle", "Lever-Action Rifle", "Enhanced Lever-Action Rifle",
  "Heavy Pipe Pistol", "Rusty Hunting Rifle", "Hunting Rifle", "Enhanced Hunting Rifle", "Pipe Rifle",
  "Rusty Sawed-Off Shotgun", "Sawed-Off Shotgun", "Enhanced Sawed-Off Shotgun", "Rusty Laser Pistol",
  "Hardened BB gun", "Armor Piercing BB Gun", "Hardned .32 Pistol", "Armor Piercing .32 Pistol",
  "Hardned 10mm Pistol", "Armor Piercing 10mm Pistol", "Pool Cue", "Hardned Scoped .44",
  "Armor Piercing Scoped .44", "Hardned Lever-Action Rifle", "Armor Piercing Lever-Action Rifle",
  "Hardned Hunting Rifle", "Scoped Pipe Pistol", "Armor Piercing Hunting Rifle", "Kitchen Knife",
  "Hardned Saews-Off Shotgun", "Laser Pistol", "Auto Pipe Pistol", "Double-Barrel Sawed-Off Shotgun",
  "Rusty Assault Rifle", "Tuned Laser Pistol", "Assault Rifle", "Focused Laser Pistol",
  "Amplified Laser Pistol", "Enhanced Assault Rifle", "Rusty Shotgun", "Hardned Assault Rifle",
  "Shotgun", "Armor Piercing Assault Rifle", "Baseball Bat", "Enhanced Shotgun", "Institute Pistol",
  "Rusty Snipper Rifle", "Hardned Shotgun", "Night-Vision Pipe Rifle", "Sniper Rifle",
  "Double-Barrel Shotgun", "Enhanced Sniper Rifle", "Rusty Plasma Pistol", "Hardned Sniper Rifle",
  "Incendiary institute Pistol", "Plasma Pistol", "Armor Piercing Sniper Rifle", "Bayoneted Pipe Rifle",
  "Rusty Laser Rifle", "Tuned Plasma Pistol", "Focused Plasma Pistol", "Laser Rifle", "Butcher Knife",
  "Improved institute Pistol", "Rusty Combat Shotgun", "Tuned Laser Rifle", "Combat Shotgun",
  "Focused Laser Rifle", "Enhanced Combat Shotgun", "Junk Jet", "Rusty Railway Rifle",
  "Hardned Combat Shotgun", "Railway Rifle", "Enhanced Railway Rifle", "Institute Rifle",
  "Rusty Flamer", "Flamer", "Recoil Compensated Junk Jet", "Enhanced Flamer", "Pickaxe",
  "Risty Gauss Rifle", "Excited Institute Rifle", "Gauss Rifle", "Hardned Flamer",
  "Pressurized Flamer", "Rusty Plasma Rifle", "Tatical Junk Jet", "Plasma Rifle", "Lone Wanderer",
  "Blackhawk", "Lincoln's Repeater", "Little Brother", "Laser Musket", "Amplified Plasma Pistol",
  "Amplified Laser Rifle", "Wazer Rifle", "Accelerated Railway Rifle", "Enhanced Gauss Rifle",
  "Plasma Thrower", "Tuned Alien Blaster", "Amplified Plasma Rifle", "Focused Alien Blaster",
  "Amplified Alien Blaster", "Flaming Junk Jet", "Mean Green Monster", "Rusty Missile Launcher",
  "Armor Piercing Minigun", "Gatling Laser", "Guided Missile Launcher", "Relentless Raider Sword",
  "Fat Man", "Vengeance", "MIRV", "Dragon's Maw"
].map(&:strip).to_set # Use um Set para buscas mais rápidas

# Lista completa de todos os itens faltantes
missing_items = {
  "Arma" => {
    "Rara" => ["Rusty Ripper", "Ripper", "Enhanced Ripper", "Hardened Ripper", "Rusty surgical Ripper", "Surgical Ripper", "Enhanced surgical Ripper", "Hardened surgical Ripper", "Hardened .32 pistol", "Hardened 10mm pistol", "Hardened scoped .44", "Rusty Gauss pistol", "Focused Gauss pistol", "Enhanced Gauss pistol", "Hardened Gauss pistol", "Rusty tranq gun", "Tranq gun", "Enhanced tranq gun", "Hardened tranq gun", "Rusty T60 pistol", "T60 pistol", "Enhanced T60 pistol", "Hardened T60 pistol", "Armor piercing T60 pistol", "Hardened assault rifle", "BOS assault rifle", "Enhanced BOS assault rifle", "Hardened BOS assault rifle", "Armor piercing BOS assault rifle", "Rusty Gauss rifle", "Hardened hunting rifle", "Hardened lever-action rifle", "Hardened sniper rifle", "Hardened combat shotgun", "Double-barrel combat shotgun", "Hardened sawed-off shotgun", "Hardened shotgun", "Assaultron head", "Enhanced Assaultron head", "Hardened Assaultron head", "Hardened flamer", ".50 cal machine gun", "Enhanced .50 cal machine gun", "Hardened .50 cal machine gun", "Armor piercing .50 cal machine gun", "Calibrated pipe rifle", "Long pipe rifle"],
    "Lendária" => ["Fire hydrant bat", "Rusty power fist", "Power fist", "Enhanced power fist", "Hardened power fist", "Ed's custom power fist", "Grognak's axe", "Wild Bill's Sidearm", "Infiltrator", "Red Rocket", "Hardened Gauss rifle", "Accelerated Gauss rifle", "Magnetron 4000", "Henrietta", "Ol' Painless", "Mare's Leg", "Hardened railway rifle", "Railmaster", "Victory rifle", "Charon's shotgun", "Mountain Momma", "Kneecapper", "Farmer's Daughter", "Ghoul revolver", "Alien blaster", "Destabilizer", "MPXL Novasurge", "Alien disintegrator", "Enhanced alien disintegrator", "Hardened alien disintegrator", "Wazer Wifle", "Tuned plasma rifle", "Focused plasma rifle", "Pulse rifle", "Enhanced pulse rifle", "Hardened pulse rifle", "Enhanced Fat Man", "Hardened Fat Man", "Guided Fat Man", "Burnmaster", "Tuned Gatling laser", "Focused Gatling laser", "Amplified Gatling laser", "Minigun", "Enhanced minigun", "Hardened minigun", "Lead Belcher", "Missile launcher", "Enhanced missile launcher", "Hardened missile launcher", "Plasma caster", "Enhanced plasma caster", "Hardened plasma caster", "Scoped Institute pistol", "Scattered Institute pistol", "Long Institute rifle", "Night-vision Institute rifle", "Targeting Institute rifle", "Virgil's rifle", "Electrified Junk Jet", "Technician's Revenge", "Big Sister", "Agitated plasma thrower", "Tactical plasma thrower", "Boosted plasma thrower", "Overcharged plasma thrower"]
  },
  "Roupa" => {
    "Comum" => ["Vault suit", "RobCo factory uniform", "Accountant outfit", "Agent provocateur", "Bespoke attire"],
    "Rara" => ["Sturdy battle armor", "Sturdy leather armor", "BOS casual", "NCR Ranger outfit", "RobCo R&D suit", "Robot armor", "Bowling shirt", "Swing dress", "Elf outfit", "Enclave security outfit", "Ghost costume", "Mayor outfit", "Pilgrim outfit", "Santa suit", "Skeleton costume", "Vault 33 suit", "Ma June jacket", "Sleazy suit", "Prewar cowboy costume", "Wedding dress", "Action wedding dress", "Vault security outfit"],
    "Lendária" => ["Heavy vault suit", "Heavy battle armor", "Expert jumpsuit", "Heavy leather armor", "Commander fatigues", "Lucky nightwear", "Mutant hunter gear", "Heavy metal armor", "Tattered longcoat", "Autumn's uniform", "Bittercup's outfit", "Eulogy Jones' suit", "Heavy synth armor", "Incognito leisurewear", "Lucy's vault suit", "Moldaver's armor", "Nuka-Girl outfit", "Overseer's office wear", "Piper's outfit", "Preston's outfit", "Rachel's outfit", "Sarah Lyons' Brotherhood fatigues", "Silver Shroud costume", "Virgil's lab coat", "Wasteland wanderer", "Zeta alien outfit", "Zeta alien spacesuit", "Tunnel Snake outfit"]
  }
}

# Adiciona todos os itens, marcando 'owned' corretamente
(owned_item_names.to_a + missing_items.values.flat_map { |r| r.values }.flatten).uniq.each do |name|
  # Encontra a categoria e raridade do item
  category, rarity = nil, nil
  missing_items.each do |cat, rarities|
    rarities.each do |rar, names|
      if names.include?(name)
        category = cat
        rarity = rar
        break
      end
    end
    break if category
  end

  Item.create!(
    name: name,
    category: category || "Desconhecida",
    rarity: rarity || "Desconhecida",
    owned: owned_item_names.include?(name)
  )
end

puts "Banco de dados populado com #{Item.count} itens."
puts "#{Item.where(owned: true).count} itens marcados como 'possuídos'."
puts "#{Item.where(owned: false).count} itens marcados como 'faltantes'."

