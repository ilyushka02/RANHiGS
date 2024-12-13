import wmi
import os


if __name__ == '__main__':

    # default values
    disk_def = ['E823_8FA6_BF53_0001_001B_444A_464F_BDBA.']
    user_name_def = 'mrnas'
    
    c = wmi.WMI()
    disk = c.Win32_PhysicalMedia()
    disk_serial = [d.SerialNumber for d in disk]

    username = os.getenv("USERNAME")

    if disk_serial == disk_def and username == user_name_def:
        print("Hellow Ilya!")
    else: print("You not Ilya. Who are you?")