func temperatureConverter(value : Double, unit : String) {
    switch unit {
    case "C":
        let farenheit = (value * 9 / 5) + 32 
        let kelvin = value + 273.15
        print ("\(farenheit)°F, \(kelvin)K")
    case "F":
        let celcius = 	(value - 32) * 5 / 9 
        let kelvin = celcius + 273.15
        print ("\(celcius)°C, \(kelvin)K")
    case "K":
        let celcius = value - 273.15
        let farenheit = (celcius * 9 / 5) + 32 
        print ("\(farenheit)°F, \(celcius)°C")
    default:
        print("Please enter either C, F or K for unit")
    }
}


print("Enter the temperature value")
if let valueStr = readLine(), let value = Double(valueStr) {
    print("Please enter either C, F or K for unit")
    if let unit = readLine() {
        temperatureConverter(value: value, unit: unit)
    } else {
        print("Wrong input! (no unit)")
    }
} else {
    print("Wrong input! (not a valid number)")
}