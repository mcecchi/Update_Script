import serial

class Erase_eeprom():

    def __init__(self):
        self.setup_serial()
        self.erase_eeprom()

    def setup_serial(self):
        with serial.Serial() as self.ser:
            self.ser.baudrate = 250000
            self.ser.port = ('/dev/ttyACM0')  # open serial port
            self.ser.open()

        print(self.ser.name)

    def erase_eeprom(self):
        print("Writing M502")
        self.ser.write(b'M502')
        print("Closing Connection")
        self.ser.close()
        print("Connection Closed")

ee = Erase_eeprom()