num1 = 12
key = False

if num1 == 12:
    if key: 
        print('num1 is equal to twelve and they have the key')
    else:
        print('num1 is equal to twelve and they do NOT have the key')
elif num1 < 12:
    print('num1 is less than twelve')
else:
    print('num1 is NOT equal to twelve')
    

num2 = 20
key = True

if num2 == 20:
    if key:
        print('you are not old enough to drink but you are old enough to drive')
    else:
        print('you are not old enough to drink and you are not old enough to drive')
elif num > 20:
    print('you are old enough to drink')
else:
    print('you are also not old enough to drink')
