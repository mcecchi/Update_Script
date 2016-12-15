import os
from os import walk
import os.path
import string
import subprocess

class Update_Checker():
    """docstring for Update_Checker"""
    def __init__(self):
        self.current_path = os.path.dirname(os.path.realpath(__file__))
        print("Current Directory is: " + self.current_path)
        self.check_updates()
        self.check_completed_updates()
        self.execute_updates()


    def check_updates(self):
        self.updates_path = self.current_path + "/../updates/"
        self.update_filenames = []
        for (dirpath, dirnames, filenames) in walk(self.updates_path):
            if filenames != "updates.txt":
                self.update_filenames.extend(filenames)

        print("Files inside of /updates/ : ")
        for file in self.update_filenames:
            print("\t" + file)

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

        

    def execute_updates(self):
        print("These need updating:")
        for update in self.needed_updates:
            print("\t" + update)

        
        for update in self.needed_updates:
            print("Executing " + update)
            subprocess.call(["sudo sh "+ self.updates_path + update], shell=True)
        




uc = Update_Checker()


        
        