import serial

class Erase_eeprom():

    def __init__(self):
        self.setup_serial()

    def setup_serial(self):
        with serial.Serial() as self.ser:
            self.ser.baudrate = 250000
            self.ser.port = ('/dev/ttyACM0')  # open serial port
            self.ser.open()
            self.read_serial(self.ser)
            print("Writing M502")

            self.ser.write(b'M502\n')

            self.read_serial(self.ser) 

            print("Closing Connection")
            self.ser.close()
            print("Connection Closed")

    def read_serial(self, serial):
        for x in range(0,10):
            line = ser.readline()
            print(line)

    
           


ee = Erase_eeprom()