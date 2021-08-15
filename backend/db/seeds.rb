# River.destroy_all
# SingleFish.destroy_all

r1 = River.create(name: "Kenai River", country: "United States")
r2 = River.create(name: "Amazon River", country: "Brazil")
r3 = River.create(name: "Mekong River", country: "Thailand")
r4 = River.create(name: "Murray River", country: "Australia")

10.times do
  SingleFish.create(
    species: ["Brook Trout", "Red Piranha", "Giant Snakehead", "Sleepy Cod"].sample,
    weight: [42, 14, 2, 37].sample,
    rarity: (0..10).to_a.sample,
    caught: [true, false].sample,
    river: [r1, r2, r3, r4].sample
  )
end

puts 'Fish Seeded With Rivers'