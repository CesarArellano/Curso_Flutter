void main () {
  //Cuando una clase es abstracta no se pueden instanciar, sólo heredar.
  // Los mixins nos ayudan a integrar funcionalidades que algunas clases pueden tener y otras no.
  final flypper = Dolphin();
  flypper.swim("Flypper");
  
  final daffy = Duck();
  daffy.swim("Daffy");
  daffy.walk("Daffy");
  daffy.fly("Daffy");
  
}

abstract class Animal{ }

abstract class Mammal extends Animal{ }
abstract class Bird extends Animal{ }
abstract class Fish extends Animal{ }

class Dolphin extends Mammal with SwimMixin{ }
class Bat extends Mammal with WalkMixin, FlyMixin{ }
class Cat extends Mammal with WalkMixin{ }

class Dove extends Bird with WalkMixin, FlyMixin{ }
class Duck extends Bird with WalkMixin, SwimMixin, FlyMixin{
  @override
  void walk(String text){
    print("Pato caminando: $text");
  }
}

class Shark extends Fish with SwimMixin{ }
class FlyingFish extends Fish with SwimMixin, FlyMixin{ }

mixin WalkMixin{
  void walk(String text)=> print("Walking: $text");
}

mixin SwimMixin{
  void swim(String text)=> print("Swimming: $text");
}

mixin FlyMixin{
  void fly(String text)=> print("Flying: $text");
}