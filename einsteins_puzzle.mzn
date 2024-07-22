include "globals.mzn";

set of int: HOUSES = 1..5;
enum COLORS = {blue, white, green, red, yellow};
enum PETS = {horse, dog, cat, bird, fish};
enum NATIONALITIES = {Norwegian, German, Swedish, English, Danish};
enum CIGARS = {blends, blue_master, dunhill, pall_mall, prince};
enum DRINKS = {milk, water, beer, coffee, tea};

array[COLORS] of var HOUSES: color;
array[PETS] of var HOUSES: pet;
array[NATIONALITIES] of var HOUSES: nationality;
array[CIGARS] of var HOUSES: cigar;
array[DRINKS] of var HOUSES: drink;

constraint alldifferent(color);
constraint alldifferent(pet);
constraint alldifferent(nationality);
constraint alldifferent(cigar);
constraint alldifferent(drink);

constraint nationality[English] = color[red];
constraint nationality[Swedish] = pet[dog];
constraint nationality[Danish] = drink[tea];
constraint color[white] - 1 = color[green];
constraint color[green] = drink[coffee];
constraint cigar[pall_mall] = pet[bird];
constraint color[yellow] = cigar[dunhill];
constraint drink[milk] = ceil(max(HOUSES)/2);
constraint nationality[Norwegian] = 1;
constraint abs(cigar[blends] - pet[cat]) = 1;
constraint abs(pet[horse]- cigar[dunhill]) = 1;
constraint drink[beer] = cigar[blue_master];
constraint nationality[German] = cigar[prince];
constraint abs(nationality[Norwegian] - color[blue]) = 1;
constraint abs(cigar[blends] - drink[water]) = 1;

solve satisfy;