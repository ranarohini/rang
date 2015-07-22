# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts "Adding products"
Product.create [
  {
    name: 'Elephant - Meenakari art on Brass',
    description: 'Beautiful figurines with fine Meenakari work on brass metal.',
    image_url: 'https://s3-ap-southeast-2.amazonaws.com/rang.indian.handicrafts/elephant.jpg',
    full_image_url: 'https://s3-ap-southeast-2.amazonaws.com/rang.indian.handicrafts/full/elephant_full.jpg',
    price: 32
  },
  {
    name: 'Wooden Tricycle',
    description: 'Wooden Tricycle.',
    image_url: 'https://s3-ap-southeast-2.amazonaws.com/rang.indian.handicrafts/wooden_rikshaw.jpg',
    full_image_url: 'https://s3-ap-southeast-2.amazonaws.com/rang.indian.handicrafts/full/wooden_rikshaw_full.jpg',
    price: 25
  },
  {
    name: 'Reversible Patchwork Kantha Stole',
    description: 'Reversible Patchwork Kantha Stole Multicoloured',
    image_url: 'https://s3-ap-southeast-2.amazonaws.com/rang.indian.handicrafts/silk_stole.jpg',
    full_image_url: 'https://s3-ap-southeast-2.amazonaws.com/rang.indian.handicrafts/full/silk_stole_full.jpg',
    price: 40
  },
  {
    name: 'Walnut Wooden Box',
    description: 'Walnut carved wooden jwellery box',
    image_url: 'https://s3-ap-southeast-2.amazonaws.com/rang.indian.handicrafts/walnut_wodden_box.jpg',
    full_image_url: 'https://s3-ap-southeast-2.amazonaws.com/rang.indian.handicrafts/full/walnut_wodden_box_full.jpg',
    price: 75
  },
  {
    name: 'Beadwork Potli Bag',
    description: 'Beadwork Potli Bag in dull gold and red satin silk.',
    image_url: 'https://s3-ap-southeast-2.amazonaws.com/rang.indian.handicrafts/bead_potli.jpg',
    full_image_url: 'https://s3-ap-southeast-2.amazonaws.com/rang.indian.handicrafts/full/bead_potli_full.jpg',
    price: 25
  },
  {
    name: "Zardosi Cushion Covers",
    description: "Yellow Zardosi Cushion covers exclusive from Jaipur, India.",
    image_url: 'https://s3-ap-southeast-2.amazonaws.com/rang.indian.handicrafts/cushion_covers.jpg',
    full_image_url: 'https://s3-ap-southeast-2.amazonaws.com/rang.indian.handicrafts/full/cushion_covers_full.jpg',
    price: 55
  },
  {
    name: 'Kutch Patchwork Hand Bag',
    description: 'Kutch embroidery uses metallic threads couched on to a high quality fabric such as silk.',
    image_url: 'https://s3-ap-southeast-2.amazonaws.com/rang.indian.handicrafts/handbag.jpg',
    full_image_url: 'https://s3-ap-southeast-2.amazonaws.com/rang.indian.handicrafts/full/handbag_full.jpg',
    price: 45
  },
  {
    name: 'Kutch Embroidered Leather Ipad Case',
    description: 'Leather & Kutch Embroidered Ipad Case',
    image_url: 'https://s3-ap-southeast-2.amazonaws.com/rang.indian.handicrafts/ipad_case.jpg',
    full_image_url: 'https://s3-ap-southeast-2.amazonaws.com/rang.indian.handicrafts/full/ipad_case_full.jpg',
    price: 30
  },
  {
    name: 'Table Lamp Shades',
    description: 'Table Lamp Shades of the shadow puppetry art form "Tholu Bommalata"',
    image_url: 'https://s3-ap-southeast-2.amazonaws.com/rang.indian.handicrafts/lamp.jpg',
    full_image_url: 'https://s3-ap-southeast-2.amazonaws.com/rang.indian.handicrafts/full/lamp_full.jpg',
    price: 25
  },
  {
    name: 'Dhokra Curio - Fish',
    description: 'Brass Dhokra is amongst the oldest traditional techniques of metal casting in India.',
    image_url: 'https://s3-ap-southeast-2.amazonaws.com/rang.indian.handicrafts/metalic_fish.jpg',
    full_image_url: 'https://s3-ap-southeast-2.amazonaws.com/rang.indian.handicrafts/full/metalic_fish_full.jpg',
    price: 32
  },
  {
    name: 'Kashmiri Embroidered Handbag',
    description: 'Kashmiri embroidered handbag',
    image_url: 'https://s3-ap-southeast-2.amazonaws.com/rang.indian.handicrafts/kashmiri_bag.jpg',
    full_image_url: 'https://s3-ap-southeast-2.amazonaws.com/rang.indian.handicrafts/full/kashmiri_bag_full.jpg',
    price: 32
  },
  {
    name: 'Rajasthani Puppets Couple',
    description: 'Puppets or “Kathputli” is an ancient and popular form of folk entertainment.',
    image_url: 'https://s3-ap-southeast-2.amazonaws.com/rang.indian.handicrafts/puppets.jpg',
    full_image_url: 'https://s3-ap-southeast-2.amazonaws.com/rang.indian.handicrafts/full/puppets_full.jpg',
    price: 20
  }]