import os
import sys
import time
import keyboard

ctr = 0
ctr_check = 0

def pressed_keys(e):
    global ctr
    global ctr_check

    ctr += 1

    #print ("pi2scart ctr %s ctr_check %s" % (ctr, ctr_check))




# define a main function
def main():

    global ctr
    global ctr_check

    #os.popen("pikeyd165 -smi -ndb -d")
    #os.popen("sleep 1")

    keyboard.hook(pressed_keys)

    time.sleep(1)

    # was keys pressed?
    if ctr > 9:
        print ("0")
        #print ("pi2scart")

    else:
        #print ("pi2jamma")
        print ("1")

    #os.popen("pikeyd165 -k")

    sys.exit()


# run the main function only if this module is 
# executed as the main script (if you import 
# this as a module then nothing is executed)
if __name__=="__main__":
    # call the main function
    main()
