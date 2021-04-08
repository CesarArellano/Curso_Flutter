void main() {
  Vehicle myVehicle = new Vehicle(4, "Blue");
  print(myVehicle);

  final Car myCar = Car(4, "Red", "891AED", "A2323DSA21P");
  print(myCar);
  print("last4DigitsMotor: ${myCar.last4DigitsMotor}");
  print("last4DigitsPlate: ${myCar.last4DigitsPlate}");

  final Bicycle myBicycle = Bicycle(2, "Yellow", bumper: true);
  print(myBicycle);
}

class Vehicle {
  final int tires;
  final String color;

  /* Constructor con más líneas de código
    
  Vehicle(int tires, String color){
    this.tires = tires;
    this.color = color;
  }
  */

  // Constructor simplificado
  Vehicle(this.tires, this.color);
  //Devuelve la cadena
  // override sirve para sobrescribir un método ya existente, y así modificar sus instrucciones dependiendo lo que se quiera obtener.
  @override
  String toString() => "Vehicule - tires: $tires, color: $color";
}

class Car extends Vehicle {
  //Para definir variables privada sólo se coloca un guión bajo antes del nombre de la variable como se hace con la variable motor.
  final String plate, _motor;

  String get last4DigitsMotor => _motor.substring(_motor.length - 4);

  String get last4DigitsPlate => plate.substring(plate.length - 1);
  //Con super manda a llamar al constructor de la clase padre.
  Car(int tires, String color, this.plate, this._motor) : super(tires, color);
  @override
  String toString() =>
      "Car - tires: $tires, color: $color, plate: $plate, motor: $_motor";
}

class Bicycle extends Vehicle {
  final bool bumper;
  Bicycle(int tires, String color, {this.bumper = false}) : super(tires, color);
  @override
  String toString() =>
      "Bicycle - tires: $tires, color: $color, bumper: $bumper";
}
