import os
from os import walk
import os.path
import string
import subprocess
import yaml
import logging


class Update_Checker():
    """docstring for Update_Checker"""
    def __init__(self, versioning_path=None):
        logging.basicConfig(filename='/home/pi/update_script.log', level=logging.DEBUG)
        logging.info('Update_Checker imported')

        self.version = '1.0.4'
        self.current_path = os.path.dirname(os.path.realpath(__file__))
        print("Current Directory is: " + self.current_path)
        self.versioning_path = versioning_path
        self.check_updates()
        self.check_completed_updates()
        self.execute_updates()

    def update_version(self):
        if self.versioning_path:
            with open(self.versioning_path, 'w') as f:
                f.write(self.version)
        else:
            pass

    def check_updates(self):
        self.updates_path = self.current_path + "/../updates/"
        self.update_filenames = []
        for (dirpath, dirnames, filenames) in walk(self.updates_path):
            if filenames != "updates.txt":
                self.update_filenames.extend(filenames)

        print("Files inside of /updates/ : ")
        for file in self.update_filenames:
            print("\t" + file)
        logging.info("Available Updates: {}".format(self.update_filenames))

    def check_completed_updates(self):
        #get the filename of the logged updates
        self.current_updates_filename = "/home/pi/.updates.txt"
        if not os.path.isfile(self.current_updates_filename):
            create_file = open(self.current_updates_filename, 'w+')

        print("Completed Updated Path: " + self.current_updates_filename)

        #put all logged filenames into a list
        cu = []
        with open(self.current_updates_filename, "r") as completed:
            for line in completed:
                cu.append(line)
        completed.close()

        cu_fixed = []
        for file in cu:
            cu_fixed.append(file.replace("\n", ""))
        print(cu_fixed)

        #check the logged filenames against the updates that need to occur
        print("Checking Updates")
        self.needed_updates = []
        for update in self.update_filenames :
            if update in cu_fixed:
                print("\t" + update + ": Already updated")
            else:
                self.needed_updates.append(update)
                print("\t" + update + ": Needs Updating")

        logging.info("Desires an update: {}".format(self.needed_updates))

    def execute_updates(self):
        if len(self.needed_updates) != 0:
            #turn off octoprint and bring up error screen
            subprocess.call("sudo bash " + self.current_path + "/../octoprint_takeover.sh", shell=True)

            #update all pending updates
            print("These need updating:")
            for update in self.needed_updates:
                print("\t" + update)


            for update in self.needed_updates:
                print("Executing " + update)
                logging.info("Start... package: {}".format(update))
                subprocess.call(["sudo bash "+ self.updates_path + update], shell=True)
                logging.info("Complete... package: {}".format(update))

            logging.info("Updating Version...")
            self.update_version()
            logging.info("...Complete.")
            #restart the machine
            logging.info("Rebooting system...")
            subprocess.call("sudo reboot", shell=True)
            logging.info("Exiting....")
            exit(0)
        else:
            self.update_version()
            exit(0)



if __name__ == '__main__':
    Update_Checker()
