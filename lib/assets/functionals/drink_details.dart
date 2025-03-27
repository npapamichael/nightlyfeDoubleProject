final List<Map<String, dynamic>> drinks = [
  {
    'base': 'vodka',
    'name': 'Bloody Mary',
    'image': 'lib/assets/images/drinks/bloody.jpg',
    'traits': ['Spicy', 'Savory'],
    'description': 'A savory cocktail made with vodka, tomato juice, and various spices.',
    'points': 400,
    'recipe': '''
      1. Pour 1.5 oz of vodka into a shaker.
      2. Add 3 oz of tomato juice.
      3. Add a dash of hot sauce, Worcestershire sauce, and ground black pepper.
      4. Shake well and strain into a tall glass filled with ice.
      5. Garnish with a celery stick and lime wedge.
    ''',
  },
  {
    'base': 'vodka',
    'name': 'Pornstar Martini',
    'image': 'lib/assets/images/drinks/pornstar.webp',
    'traits': ['Sweet', 'Fruity'],
    'description': 'A fruity and tangy cocktail made with vodka, passion fruit, and vanilla liqueur.',
    'points': 300,
    'recipe': '''
      1. Shake 2 oz of vodka, 1 oz of passion fruit puree, and 1/2 oz of vanilla liqueur.
      2. Strain into a chilled martini glass.
      3. Serve with a shot of prosecco on the side.
    ''',
  },
  {
    'base': 'whiskey',
    'name': 'Whiskey Sour',
    'image': 'lib/assets/images/drinks/whiskey_sour.jpg',
    'traits': ['Sour', 'Strong'],
    'description': 'A classic whiskey cocktail with lemon juice, sugar, and bitters.',
    'points': 350,
    'recipe': '''
      1. In a shaker, combine 2 oz of whiskey, 3/4 oz of lemon juice, and 1/2 oz of simple syrup.
      2. Add ice and shake well.
      3. Strain into an old-fashioned glass filled with ice.
      4. Garnish with a cherry or lemon twist.
    ''',
  },
  {
    'base': 'whiskey',
    'name': 'Old Fashioned',
    'image': 'lib/assets/images/drinks/old_fashioned.jpg',
    'traits': ['Strong', 'Bitter'],
    'description': 'A classic cocktail made with whiskey, bitters, sugar, and orange peel.',
    'points': 700,
    'recipe': '''
      1. Muddle 1 sugar cube and 2 dashes of bitters in a glass.
      2. Add 2 oz of whiskey and a large ice cube.
      3. Stir and garnish with an orange peel.
    ''',
  },
  {
    'base': 'gin',
    'name': 'Gin Fizz',
    'image': 'lib/assets/images/drinks/gin_fizz.jpg',
    'traits': ['Citrusy', 'Fizz'],
    'description': 'A refreshing cocktail made with gin, lemon juice, and soda water.',
    'points': 170,
    'recipe': '''
      1. Shake 2 oz of gin, 1 oz of lemon juice, and 3/4 oz of simple syrup with ice.
      2. Strain into a tall glass filled with ice.
      3. Top with soda water and garnish with a lemon slice.
    ''',
  },
  {
    'base': 'gin',
    'name': 'Gin Rickey',
    'image': 'lib/assets/images/drinks/gin_rickey.jpg',
    'traits': ['Citrusy', 'Refreshing'],
    'description': 'A simple and refreshing drink made with gin, lime juice, and soda water.',
    'points': 300,
    'recipe': '''
      1. Combine 2 oz of gin and 1 oz of lime juice in a glass.
      2. Fill the glass with ice and top with soda water.
      3. Stir and garnish with a lime wedge.
    ''',
  },
  {
    'base': 'gin',
    'name': 'Southside',
    'image': 'lib/assets/images/drinks/southside.jpg',
    'traits': ['Minty', 'Herbal'],
    'description': 'A refreshing gin cocktail with mint leaves, lime juice, and simple syrup.',
    'points': 500,
    'recipe': '''
      1. Muddle fresh mint leaves in a shaker.
      2. Add 2 oz of gin, 1 oz of lime juice, and 1/2 oz of simple syrup.
      3. Shake with ice and strain into a chilled glass.
      4. Garnish with mint leaves.
    ''',
  },
  {
    'base': 'tequila',
    'name': 'Margarita',
    'image': 'lib/assets/images/drinks/margarita.jpg',
    'traits': ['Sour', 'Fruity'],
    'description': 'A classic cocktail made with tequila, lime juice, and triple sec.',
    'points': 150,
    'recipe': '''
      1. In a shaker, combine 2 oz of tequila, 1 oz of lime juice, and 1/2 oz of triple sec.
      2. Shake well with ice and strain into a salt-rimmed glass.
      3. Garnish with a lime wedge.
    ''',
  },
  {
    'base': 'tequila',
    'name': 'Tequila Sunrise',
    'image': 'lib/assets/images/drinks/sunrise.webp',
    'traits': ['Fruity', 'Sweet'],
    'description': 'A colorful cocktail made with tequila, orange juice, and grenadine.',
    'points': 350,
    'recipe': '''
      1. Pour 2 oz of tequila into a glass filled with ice.
      2. Add 4 oz of orange juice and stir.
      3. Slowly pour 1/2 oz of grenadine into the glass and allow it to settle at the bottom.
      4. Garnish with an orange slice and cherry.
    ''',
  },
  {
    'base': 'tequila',
    'name': 'Tequila Sour',
    'image': 'lib/assets/images/drinks/tequila_sour.webp',
    'traits': ['Sour', 'Bold'],
    'description': 'A tart cocktail made with tequila, lemon juice, and sugar.',
    'points': 200,
    'recipe': '''
      1. In a shaker, combine 2 oz of tequila, 3/4 oz of lemon juice, and 1/2 oz of simple syrup.
      2. Shake well and strain into a chilled glass.
      3. Garnish with a lemon twist.
    ''',
  },
  {
    'base': 'rum',
    'name': 'Mule',
    'image': 'lib/assets/images/drinks/mule.jpg',
    'traits': ['Spicy', 'Citrusy'],
    'description': 'A refreshing drink made with rum, ginger beer, and lime juice.',
    'points': 190,
    'recipe': '''
      1. In a glass, combine 2 oz of rum and 1/2 oz of lime juice.
      2. Fill the glass with ice and top with ginger beer.
      3. Stir and garnish with a lime wedge.
    ''',
  },
  {
    'base': 'rum',
    'name': 'Paloma',
    'image': 'lib/assets/images/drinks/paloma.jpg',
    'traits': ['Citrusy', 'Bitter'],
    'description': 'A refreshing Mexican cocktail made with tequila, grapefruit soda, and lime juice.',
    'points': 250,
    'recipe': '''
      1. In a glass, combine 2 oz of tequila and 1/2 oz of lime juice.
      2. Add 4 oz of grapefruit soda and stir gently.
      3. Garnish with a lime wedge.
    ''',
  },
  {
    'base': 'vodka',
    'name': 'Brandy Sour',
    'image': 'lib/assets/images/drinks/brandy_sour.webp',
    'traits': ['Tart', 'Sweet'],
    'description': 'A sour cocktail made with brandy, lemon juice, and simple syrup.',
    'points': 300,
    'recipe': '''
      1. In a cocktail shaker, add 2 oz of brandy.
      2. Add 3/4 oz of freshly squeezed lemon juice.
      3. Add 1/2 oz of simple syrup.
      4. Fill the shaker with ice and shake well.
      5. Strain into a chilled glass.
      6. Garnish with a lemon twist or cherry if desired.
    ''',
  },
];
