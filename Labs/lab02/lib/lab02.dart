void main() {
  var grades = [30.0, 22.0, 12.0, 21.0, 05.0];
  List<int> ids = [000343434,000123000,000555222,000234999,000123456];
  List<String> n = ['Sarah Song', 'Jojo Jojo', 'John Smith', 'Bobby Bob', 'Koi Ko'];
  List<Student> students = new List(5);

//q1

  var q1 = grades.map((grades) => (grades + 2));
  List<double> tep = q1.toList();
  //print(tep);

//q3

  var q3 = (id) {
    return id.map((id) => (100000000 + id));
  };
  var temp = q3(ids);
  var te = List.from(temp);
  //print(te);

//q4
  for(int i =0; i < 5; i++){
    students[i] = new Student(te[i], n[i]);
    print(students[i].sid+' '+students[i].name+' '+tep[i].toString());
  }

  print('=======================================================');
  //q5 an q6

  Player player = new Player();
  Enemy boss = new Enemy();

  player.name = "Player";
  player.hp = 100;
  player.defense = 50;
  player.mana = 100;
  player.magicDamage = 20;

  boss.name = "Boss";
  boss.hp = 100;
  boss.defense = 10;
  boss.stamina = 100;
  boss.attackPower = 55;



  // notes:
  //int d = player.castSpell();
  //int n = int.parse(stdin.readLineSync());
  // output should look like this
  // Boss hits Player for 5 points of damage!
  // Player hits Boss for 10 points of damage!
  // calculate damage (magicDamage - the other character's defense stat)
  // subtracting this damage from their hp and returning the damage

  // battle phase
  // while boss/player hp is not 0, continue loop
  while(boss.hp > 0 && player.hp > 0){



    print(player.name + '               ' + boss.name);//8 tabs
    print('HP: ' + player.hp.toString() + '              ' +
        'HP: ' + boss.hp.toString());

    print('DEF: ' + player.defense.toString() + '              ' +
        'DEF: ' + boss.defense.toString());

    print('MP: ' + player.mana.toString() + '              ' +
        'SP: ' + boss.stamina.toString());

    // damage calculation phase
    int dmg;

    //Boss attacks
    dmg = boss.doAttack(player);
    player.hp = player.hp - dmg;
    print(boss.name + ' hits ' + player.name + ' for ' + dmg.toString() + ' points of damage!');

    //Player attaks
    dmg = player.castSpell(boss);
    boss.hp = boss.hp - dmg;
    print(player.name + ' hits ' + boss.name + ' for ' + dmg.toString() + ' points of damage!');
    print('\n-------------------------------------------------------- \n');

    //player.hp = -32;
    if(player.hp <= 0){
      player.hp = 0;
      print('Player died! Boss Wins!');
      //break;
    }
    else if(boss.hp <= 0){
      boss.hp = 0;
      print('Boss died! Player Wins!');
    }
  }//end of while

  print('THE END');
}


class Student{
  String sid;
  String name;
  Student(int id, String n){
    this.sid = id.toString();
    this.name = n.toString();
  }
  void printthis(){
    print('ID: '+this.sid + ' Name: ' +this.name);
  }
}

class Character {
  String name;
  int hp;
  int defense;

  Character({this.name, this.hp, this.defense});
}

mixin Magic on Character{
  int mana;
  int magicDamage;

  // castSpell
  // calculate damage (magicDamage - the other character's defense stat)
  // This function will take a second Character instance as an argument
  // subtracting this damage from their hp and returning the damage
  int castSpell(Character p){
    int dmg = 0;
    this.mana = this.mana - 10;
    dmg = this.magicDamage - p.defense;
    return dmg;
  }
}
mixin Melee on Character{
  int stamina;
  int attackPower;

  int doAttack(Character p){
    int dmg = 0;
    this.stamina = this.stamina - 10;
    dmg = this.attackPower - p.defense;
    return dmg;
  }
}


class Player extends Character with Magic {
  Player({name, hp, magicDamage, mana, defense})
      : super(name: name, hp: hp, defense: defense) {
    this.mana = mana;
    this.magicDamage = magicDamage;

  }
}

class Enemy extends Character with Melee {
  Enemy({name, hp, attackPower, stamina, defense})
      : super(name: name, hp: hp, defense: defense) {
    this.stamina = stamina;
    this.attackPower = attackPower;
  }
}