import 'package:backend_shop/models/product_model.dart';
import 'package:backend_shop/models/supplement_model.dart';

List<Product> menuFoods = [
  Product(
    productRating: 4.8,
    productImage: 'assets/foods/3eja.png',
    productName: 'Ojja aux merguez',
    productPrice: 9.00,
    foodSupplements: [
      Supplement(
        supplementName: 'Merguez',
        supplementImage: 'assets/supps/merguez.png',
      ),
      Supplement(
        supplementName: 'Oeufs',
        supplementImage: 'assets/supps/eggs.png',
      ),
    ],
    productDesc:
        "Un délicieux plat tunisien mettant en vedette des saucisses épicées merguez, nappées d'une sauce riche à base de tomates, agrémentée d'oignons, d'ail, de poivrons, et d'un mélange d'épices envoûtant. Servi chaud et garni d'herbes fraîches, c'est un délice plein de saveurs parfait pour toutes les occasions",
  ),
  Product(
    productRating: 4.8,
    productImage: 'assets/foods/kosksi.png',
    productName: 'Couscous au poulet',
    productPrice: 11.50,
    foodSupplements: [
      Supplement(
        supplementName: 'Poulet',
        supplementImage: 'assets/supps/djej.png',
      ),
    ],
    productDesc:
        "Un plat délicieux qui marie parfaitement le poulet tendre avec des grains de couscous moelleux, le tout agrémenté d'un mélange d'épices parfumées et de légumes colorés. Un festin savoureux et réconfortant à déguster en famille ou entre amis.",
  ),
  Product(
    productRating: 4.8,
    productImage: 'assets/foods/pasta.png',
    productName: 'Spaghetti au poulet',
    productPrice: 10.00,
    foodSupplements: [
      Supplement(
        supplementName: 'Poulet',
        supplementImage: 'assets/supps/djej.png',
      ),
    ],
    productDesc:
        "Un plat associant des morceaux de poulet tendres à des pâtes spaghetti al dente, le tout enrobé d'une sauce tomate savoureuse et parfumée, agrémentée d'herbes fraîches et de parmesan râpé pour une explosion de saveurs.",
  ),
  Product(
    productRating: 4.8,
    productImage: 'assets/foods/shan_tounsi.png',
    productName: 'Shan Tounsi',
    productPrice: 7.00,
    foodSupplements: [
      Supplement(
        supplementName: 'Oeufs',
        supplementImage: 'assets/supps/eggs.png',
      ),
      Supplement(
        supplementName: 'Frite',
        supplementImage: 'assets/supps/frite.png',
      ),
    ],
    productDesc:
        "Un plat composé de morceaux de viande mijotés dans une sauce épicée à base de tomates, d'oignons, d'ail et de diverses épices locales. Servi avec un pain croustillant pour tremper dans la sauce, c'est un festin délicieusement authentique.",
  ),
  Product(
    productRating: 4.8,
    productImage: 'assets/foods/slata_meshwya.png',
    productName: 'Salade grillée',
    productPrice: 5.5,
    foodSupplements: [
      Supplement(
        supplementName: 'Oeufs',
        supplementImage: 'assets/supps/eggs.png',
      ),
    ],
    productDesc:
        "Un mélange de légumes frais comme les poivrons, les courgettes et les champignons, grillés pour une saveur fumée et légèrement caramélisée. Complétée par une vinaigrette aromatique et des herbes fraîches, cette salade apporte une touche délicieusement grillée à votre repas",
  ),
];
