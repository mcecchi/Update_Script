import serial

class Erase_eeprom():

    def __init__(self):
        self.setup_serial()
        self.erase_eeprom()

    def setup_serial(self):
        self.ser = serial.Serial('/dev/ttyACM0')  # open serial port
        print(self.ser.name)

    def erase_eeprom(self):
        self.ser.write(b'M502')
        self.ser.close()

ee = Erase_eeprom()