import platform
from subprocess import check_output
import socket
import psutil  # Used psutil documentation for navigating through its library https://psutil.readthedocs.io/en/latest/#


print("*"*20, "System Information", "*"*20)  # printing system information
usrName = platform.uname()
print("System Name: ", usrName.system)
print("Node Name: ", usrName.node)
print("Release: ", usrName.release)
print("Version: ", usrName.version)
print("Machine: ", usrName.machine)
print("Processor: ", usrName.processor)
print("")  # LineBreak
##############################################

print("*"*20, "CPU Information", "*"*20)  # Getting CPU information
# When False returns physical no of cores
print("Physical Cores:", psutil.cpu_count(logical=False))
# When True returns total number of cores
print("Total Cores:", psutil.cpu_count(logical=True))
print("Maximum CPU frequency: ", psutil.cpu_freq().max, "Mhz")
print("Minimum CPU frequency: ", psutil.cpu_freq().min, "Mhz")
print("Current CPU frequency: ", psutil.cpu_freq().current, "Mhz")
# Using enumerates to convert the number of cores into a list.  Found the refrence on w3Schools.
for i, value in enumerate(psutil.cpu_percent(percpu=True, interval=1)):
    print("Core", i, ":", value, "%")
print("Total CPU usage:", psutil.cpu_percent())
print("")  # LineBreak
##############################################
print("*"*20, "Memory Information", "*"*20)  # Getting CPU information
# Returns total memory in GigaBytes.
print("Total Memory:", psutil.virtual_memory().total/1024/1024/1024, "GB")
print("Total Memory Available:",
      psutil.virtual_memory().available / 1024/1024/1024, "GB")
print("Total Memory Used:", psutil.virtual_memory().used/1024/1024/1024, "GB")
print("Total Memory Free:", psutil.virtual_memory().free/1024/1024/1024, "GB")
print("Total Memory Active:", psutil.virtual_memory().active/1024/1024/1024, "GB")
print("Total Inactive Memory:",
      psutil.virtual_memory().inactive/1024/1024/1024, "GB")
print("")  # LineBreak

print("*"*20, "Disk Information", "*"*20)  # Getting disk information
print("Total Disk space:", psutil.disk_usage(
    '/').total/1024/1024/1024, "GB")
print("Total Disk space used: ", psutil.disk_usage('/').used/1024/1024/1024, "GB")
print("Total Disk space free: ", psutil.disk_usage('/').free/1024/1024/1024, "GB")
print("Total Disk percent: ", psutil.disk_usage('/').percent, "%")
print("")  # LineBreak

print("*"*20, "Network Information", "*"*20)  # Getting Network information
if_addrs = psutil.net_if_addrs()
for interface_name, interface_addresses in if_addrs.items():
    for address in interface_addresses:
        print("Interface:", interface_name)
        if str(address.family) == 'AddressFamily.AF_INET':
            print("IP Address:", address.address)
            print("Netmask:", address.netmask)
            print("Broadcast IP:", address.broadcast)
        elif str(address.family) == 'AddressFamily.AF_PACKET':
            print("MAC Address:", address.address)
            print("Netmask:", address.netmask)
            print("Broadcast MAC:", address.broadcast)